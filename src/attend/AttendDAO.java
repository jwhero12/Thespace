package attend;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class AttendDAO {

	private Connection conn;
	private ResultSet rs;
	
	public AttendDAO() {
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
		String SQL = "SELECT attendID FROM ATTEND ORDER BY attendID DESC";
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
	
	public int write(String attendTitle, String userID, String attendContent) {
		String SQL = "INSERT INTO ATTEND VALUES (?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, attendTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, attendContent);
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public ArrayList<Attend> getList(int pageNumber) {
		String SQL = "SELECT * FROM ATTEND WHERE attendID < ? AND attendAvailable = 1 ORDER BY attendID DESC LIMIT 10";
		ArrayList<Attend> list = new ArrayList<Attend>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Attend attend = new Attend();
				attend.setAttendID(rs.getInt(1));
				attend.setAttendTitle(rs.getString(2));
				attend.setUserID(rs.getString(3));
				attend.setAttendDate(rs.getString(4));
				attend.setAttendContent(rs.getString(5));
				attend.setAttendAvailable(rs.getInt(6));
				list.add(attend);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM ATTEND WHERE attendID < ? AND attendAvailable = 1 ORDER BY attendID DESC LIMIT 10";
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
	
	public Attend getAttend(int attendID) {
		String SQL = "SELECT * FROM ATTEND WHERE attendID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, attendID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Attend attend = new Attend();
				attend.setAttendID(rs.getInt(1));
				attend.setAttendTitle(rs.getString(2));
				attend.setUserID(rs.getString(3));
				attend.setAttendDate(rs.getString(4));
				attend.setAttendContent(rs.getString(5));
				attend.setAttendAvailable(rs.getInt(6));
				return attend;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int update(int attendID, String attendTitle, String attendContent) {
		String SQL = "UPDATE ATTEND SET attendTitle=? WHERE attendID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, attendTitle);
			pstmt.setString(2, attendContent);
			pstmt.setInt(3, attendID);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
}