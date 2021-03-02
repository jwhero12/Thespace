<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>The SpaceFriends for Teacher</title>
</head>
<body>
<%
	String userID=null;
		if(session.getAttribute("userID")!=null){
			userID = (String) session.getAttribute("userID");
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
				<li class="active" style="text-decoration:underline; color:green; font-weight:bold"><a href="main.jsp">메인</a></li>
				<li><a href="attend.jsp">출결관리</a></li>
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
		<div>
		<img src="images/1.PNG" width=180 height=130 align=left>
		<h1>&nbsp; 더 스페이스 프랜즈는?</h1>
		<p>&emsp; 다문화, 외국인, 학교수업을 따라가기 어려운 내국인,지역 내 소외된 학생들에게 <br>&emsp; 교과교육 및 문화학습 기회를 제공하는 사회적 기업입니다.</p>
		</div><br><br>
		<div>
		<img src="images/2.PNG" width=180 height=130 align=right>
		<h1>더스페이스 프랜즈 선생님 사이트 개발 배경</h1>
		<p>더 스페이스 프랜즈의 가치를 높이고, 효율적인 방법으로 LMS와 학생들의 성장을 돕기 위하여 개발하였습니다.
		<br>더욱이 선생님과 서포터즈 간의 보고서 교류를 통해 활발한 정보의 장이 되길 바라는 마음으로 만들었습니다.</p>
		</div><br>
		<div>
		<img src="images/3.PNG"width=180 height=130 align=left>
		<h1>&nbsp; 더 스페이스 프랜즈 info</h1>
		<ul>
		<li>&emsp; Contact: Tel:02-310-9999 / Fax: 02-3789-8602 / Email: thespacefriends.kor@gmail.com</li>
		<li>&emsp; Homepage: 대표 홈: <a href="https://www.thespacefriends.com">https://www.thespacefriends.com</a> / 
		LMS:<a href="https://thespace.eclassin.com/">https://thespace.eclassin.com/</a></li>
		<li>&emsp; Instagram: @thespacefriends</li>
		<li>&emsp; Working Days: 월요일~금요일 13PM - 19PM</li>
		</ul>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>