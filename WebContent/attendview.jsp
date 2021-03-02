<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="attend.Attend" %>
<%@ page import="attend.AttendDAO" %>
<%@ page import="java.io.File" %>
<%@ page import="jxl.Workbook" %>
<%@ page import="jxl.*" %>
<%@ page import="jxl.write.*" %>
<%@ page import="jxl.read.*" %>
<%@ page import="jxl.format.*" %>
<!DOCTYPE html>
<html>
<head>
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
		int attendID=0;
		if(request.getParameter("attendID")!=null){
			attendID=Integer.parseInt(request.getParameter("attendID"));
		}
		if(attendID==0){
			   PrintWriter script = response.getWriter();
			   script.println("<script>");
			   script.println("alert('유효하지 않은 글입니다.')");
			   script.println("location.href='attend.jsp'");
			   script.println("</script>");
		}
		Attend attend = new AttendDAO().getAttend(attendID);
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
			<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3" style="background-color:#eeeeee; text-align:center;"><%=attend.getAttendDate().substring(0, 11)%>일자 출결 확인</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width:20%;">과목명</td>
						<td colspan="2"><%=attend.getAttendTitle().replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></td>
					</tr>
					<tr>
						<td>출석 확인 선생님</td>
						<td colspan="2"><%=attend.getUserID() %></td>
					</tr>
					<tr>
						<td>출결 확인 내용</td>
						<td colspan="2" style="min-height:200px; text-align:left;"><%=attend.getAttendContent().replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>")%></td>
					</tr>
				</tbody>
			</table>
			<a href="attend.jsp" class="btn btn-primary">목록</a>
			<input type="button" class="btn btn-primary" onclick="button_click()" title="현재 출석에 대한 엑셀 파일이 다운로드 됩니다." value="엑셀 파일 다운로드 ↓">
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script>	
	function button_click(){
	<%
	// 엑셀파일 생성
    WritableWorkbook workbook = Workbook.createWorkbook(new File("C:\\HJW/출결 엑셀파일/"+attend.getAttendDate().substring(0, 11)+"출결.xls"));
    // 시트 생성
    WritableSheet sheet1 = workbook.createSheet(attend.getAttendTitle()+"출석",  0);
    // Label 객체 생성 (행, 열, 내용)
    WritableCellFormat titleFormat = new WritableCellFormat();
    //WritableCellFormat FontFormat = new WritableCellFormat(new WritableFont(WritableFont.ARIAL,20,WritableFont.NO_BOLD,false,UnderlineStyle.NO_UNDERLINE,Colour.BLACK,ScriptStyle.NORMAL_SCRIPT));
    Label label1 = new Label(0, 0, attend.getAttendDate().substring(0, 11));
    Label label2 = new Label(0, 1, "출결관리 선생님");
    Label label3 = new Label(1, 1, attend.getUserID());
    Label label4 = new Label(0, 2, "과목명");
    Label label5 = new Label(1, 2, attend.getAttendTitle());
    Label label6 = new Label(0, 3, "출석 학생");
    Label label7 = new Label(1, 3, attend.getAttendContent());
   
    // 셀에 라벨 추가
    sheet1.addCell(label1);
    sheet1.addCell(label2);
    sheet1.addCell(label3);
    sheet1.addCell(label4);
    sheet1.addCell(label5);
    sheet1.addCell(label6);
    sheet1.addCell(label7);
    
    sheet1.mergeCells(0,0,1,0);
    //titleFormat.setAlignment(Alignment.CENTRE);
    //titleFormat.setVerticalAlignment(VerticalAlignment.CENTRE); 
 
    // 쓰기
    workbook.write();
   
    // 닫기
    workbook.close();
	%>	
	alert("엑셀 파일이 입력되었습니다.");
	}
	</script>
</body>
</html>