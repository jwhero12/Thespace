<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ page import="teacher.TeacherDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="teacher" class="teacher.Teacher" scope="page" />
<jsp:setProperty name="teacher" property="teacherTitle" />
<jsp:setProperty name="teacher" property="teacherContent" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>The SpaceFriends For Teachers</title>
</head>
<body>
 
 <%
 String userID = null;
if(session.getAttribute("userID")!=null){
	 userID= (String) session.getAttribute("userID");
}
if(userID == null){
	   PrintWriter script = response.getWriter();
	   script.println("<script>");
	   script.println("alert('로그인을 하세요.')");
	   script.println("location.href='login.jsp'");
	   script.println("</script>"); 
}else{
	if (teacher.getTeacherTitle() == null || teacher.getTeacherContent() == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안된 사항이 있습니다')");
		script.println("history.back()");
		script.println("</script>");

	}  else{
				  TeacherDAO teacherDAO = new TeacherDAO();
				  int result = teacherDAO.write(teacher.getTeacherTitle(),userID,teacher.getTeacherContent());
				  if(result ==-1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");  
				  }else{
				   PrintWriter script = response.getWriter();
				   script.println("<script>");
				   script.println("location.href='teacher.jsp'");
				   script.println("</script>");  
				  }
			  }
}
  
 %>
</body>
</html>