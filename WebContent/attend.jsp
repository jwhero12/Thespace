<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="attend.AttendDAO" %>
<%@ page import="attend.Attend" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>The SpaceFriends for Teacher</title>
<style type="text/css">
	a,a:hover{
		color:#000000;
		text-decoreation: none;
	}
</style>
</head>
<body>
<%
	String userID=null;
		if(session.getAttribute("userID")!=null){
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1;
		if(request.getParameter("pageNumber")!=null){
			pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		}
%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">The SpaceFriends For Teachers</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li class="active" style="text-decoration:underline; color:green; font-weight:bold"><a href="attend.jsp">출결관리</a>
				<li><a href="support.jsp">서포터즈</a></li>
				<li><a href="teacher.jsp">선생님</a></li>
			</ul>
			<%
				if(userID == null){
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
			<%
				} else{
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>
				</li>
			</ul>	
			<%	
				}
			%>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">날짜</th>
						<th style="background-color: #eeeeee; text-align: center;">과목</th>
						<th style="background-color: #eeeeee; text-align: center;">출결 확인 선생님</th>
					</tr>
				</thead>
				<tbody>
					<%
						AttendDAO attendDAO = new AttendDAO();
						ArrayList<Attend> list = attendDAO.getList(pageNumber);
						for(int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td><%= list.get(i).getAttendID() %></td>
						<td><a href="attendview.jsp?attendID=<%= list.get(i).getAttendID() %>"><%= list.get(i).getAttendDate().substring(0, 11)%></a></td>
						<td><%= list.get(i).getAttendTitle().replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></a></td>
						<td><%= list.get(i).getUserID() %></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<%
				if(pageNumber != 1) {
			%>
				<a href="attend.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-success btn-arraw-Left">이전</a>
			<%
				} if(attendDAO.nextPage(pageNumber + 1)) {
			%>
				<a href="attend.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn-success btn-arraw-Left">다음</a>
			<%
				}
			%>
			<a href="attendwrite.jsp" class="btn btn-primary pull-right">출결 등록</a>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>