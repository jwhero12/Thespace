<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ page import="attend.AttendDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="attend" class="attend.Attend" scope="page" />
<jsp:setProperty name="attend" property="attendTitle" />
<jsp:setProperty name="attend" property="attendContent" />
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
	if (attend.getAttendTitle() == null || attend.getAttendContent() == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안된 사항이 있습니다')");
		script.println("history.back()");
		script.println("</script>");

	}  else{
				  AttendDAO attendDAO = new AttendDAO();
				  int result = attendDAO.write(attend.getAttendTitle(),userID,attend.getAttendContent());
				  if(result ==-1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");  
				  }else{
				   PrintWriter script = response.getWriter();
				   script.println("<script>");
				   script.println("location.href='attend.jsp'");
				   script.println("</script>");  
				  }
			  }
}
  
 %>
</body>
</html>