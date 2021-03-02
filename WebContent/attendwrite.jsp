<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
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
				<li><a href="main.jsp">메인</a></li>
				<li class="active"><a href="attend.jsp">출결관리</a></li>
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
		<form method="post" action="attendwriteAction.jsp">
			<table id="myTable" class="table" style="text-align:center; border:1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3" style="background-color:#eeeeee; text-align:center;">출석부 양식</th>
					</tr>
				</thead>
				<tbody id="tbody">
					<tr>
						<td>출결 확인 과목 선택</td>
						<td colspan="2">
							<div class="form-group" style="text-align:center;">
								<div class="btn-group" data-toggle="buttons">
									<label class="btn btn-primary active">
										<input type="radio" name="attendTitle" autoComplete="off" value="AttiKorean" checked>아띠코리안
									</label>
									<label class="btn btn-primary active">
										<input type="radio" name="attendTitle" autoComplete="off" value="Entry">엔트리
									</label>
									<label class="btn btn-primary active">
										<input type="radio" name="attendTitle" autoComplete="off" value="3D pen">3D펜
									</label>
								</div>
							</div>
						</td>
						</tr>
					<tr>
					<td>출석 학생</td>
					<td><textarea input type="text" class="form-control" placeholder="학생 이름" name="attendContent" maxlength="2048" style="height:50px;"></textarea></td>
				</tbody>
			</table>
			<input type="submit" class="btn btn-primary pull-right" value="출결 등록">
		</form>
		</div>
	</div>
	<!--<script>
		function rowAdd(){
			var trCnt =$('#myTable tr').length;
			if(trCnt <11){
				var innerHtml ="";
				innerHtml +='<tr>';
				innerHtml +='<td>    </td>';
				innerHtml +='<td><input type="text" class="form-control" placeholder="학생입력" name="attendContent" maxlength="50"></td>';
				innerHtml +='<td><div class="form-group" style="text-align:center;">';
				innerHtml +='<div class="btn-group" data-toggle="buttons">';
				innerHtml +='<label class="btn btn-primary active"><input type="radio" name="attendContent" autoComplete="off" value="attend" checked>출석</label>';
				innerHtml +='<label class="btn btn-primary active"><input type="radio" name="attendContent" autoComplete="off" value="absent">결석</label>';
				innerHtml +='</div></div>';
				innerHtml +='</td>';
				innerHtml +='</tr>';
				
				$('#myTable > tbody:last').append(innerHtml);
			}else{
				alert("최대 10개까지만 가능합니다.");
				return false;
			}
		}
	</script>
	<script>	
		function rowDelete(){
			var trCnt =$('#myTable tr').length;
			if(trCnt>2){
				$('#myTable> tbody:last > tr:last').remove();
			}else{
				return false;
			}
		}
	</script>-->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>