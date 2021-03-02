package teacher;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class TeacherDAO {

	private Connection conn;
	private ResultSet rs;
	
	public TeacherDAO() {
		try {
	      String dbURL = "jdbc:mysql://localhost:3306/TheSpaceFriendsForTeachers?serverTimezone=UTC";
	      String dbID = "root";
	      String dbPassword = "eodzb2846";
	      Class.forName("com.mysql.jdbc.Driver");
	      conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
	     } catch (Exception e) {
	      e.printStackTrace();
	     }
	    }

	
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return ""; //데이터베이스 오류
	}
	
	public int getNext() {
		String SQL = "SELECT teacherID FROM TEACHER ORDER BY teacherID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; //첫 번째 게시물인 경우
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public int write(String teacherTitle, String userID, String teacherContent) {
		String SQL = "INSERT INTO TEACHER VALUES (?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, teacherTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, teacherContent);
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public ArrayList<Teacher> getList(int pageNumber) {
		String SQL = "SELECT * FROM TEACHER WHERE teacherID < ? AND teacherAvailable = 1 ORDER BY teacherID DESC LIMIT 10";
		ArrayList<Teacher> list = new ArrayList<Teacher>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Teacher teacher = new Teacher();
				teacher.setTeacherID(rs.getInt(1));
				teacher.setTeacherTitle(rs.getString(2));
				teacher.setUserID(rs.getString(3));
				teacher.setTeacherDate(rs.getString(4));
				teacher.setTeacherContent(rs.getString(5));
				teacher.setTeacherAvailable(rs.getInt(6));
				list.add(teacher);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM TEACHER WHERE teacherID < ? AND teacherAvailable = 1 ORDER BY teacherID DESC LIMIT 10";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public Teacher getteacher(int teacherID) {
		String SQL = "SELECT * FROM TEACHER WHERE teacherID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, teacherID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Teacher teacher = new Teacher();
				teacher.setTeacherID(rs.getInt(1));
				teacher.setTeacherTitle(rs.getString(2));
				teacher.setUserID(rs.getString(3));
				teacher.setTeacherDate(rs.getString(4));
				teacher.setTeacherContent(rs.getString(5));
				teacher.setTeacherAvailable(rs.getInt(6));
				return teacher;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int update(int teacherID, String teacherTitle, String teacherContent) {
		String SQL = "UPDATE TEACHER SET teacherTitle=? WHERE teacherID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, teacherTitle);
			pstmt.setString(2, teacherContent);
			pstmt.setInt(3, teacherID);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
}