<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>loginPro.jsp</h1>
	<%
	request.setCharacterEncoding("UTF-8");
	String oldURL = request.getParameter("oldURL");
	%>
	<jsp:useBean id="mb" class="signin_login.MemberBean"/>
	<jsp:setProperty property="*" name="mb"/>
	
	<%
	final String DRIVER = "com.mysql.cj.jdbc.Driver";
	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	final String DBID = "root";
	final String DBPW = "1234";
	Class.forName(DRIVER);
	System.out.println(" 드라이버 로드 성공! ");
	Connection con = DriverManager.getConnection(DBURL, DBID ,DBPW);
	System.out.println(" 디비 연결 성공! ");
	
	String sql ="select pw from itwill_member where id=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1,mb.getId());
	
	ResultSet rs = pstmt.executeQuery(); 
	if(rs.next()){
		if(mb.getPw().equals(rs.getString("pw"))){
			session.setAttribute("id",mb.getId());
			if(oldURL.equals("null")){
			%>
			<script type="text/javascript">
				alert("Hello, <%= mb.getId()%>");
				location.href="main.jsp";
			</script>
			<%
			}else{
				response.sendRedirect(oldURL);
			}
		}else{
			%>
			<script type="text/javascript">
				alert("WRONG PASSWORD");
				history.back();
			</script>
			<%
		}
	}else{
		%>
		<script type="text/javascript">
			var tmp = confirm("You are not our member. Do you Wanna Join?");
			if(tmp){
				location.href="insertForm.jsp";
			}else{
				location.href="loginForm.jsp";
			}
		</script>
		<%
	}
	%>
	
	
	
</body>
</html>