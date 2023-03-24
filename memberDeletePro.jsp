<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>memberDeletePro.jsp</h1>
	<%
	String id = (String)session.getAttribute("id");
	if(id == null){
		response.sendRedirect("loginForm.jsp?oldURL="+request.getRequestURL());
	}
	request.setCharacterEncoding("UTF-8");
	String pw = request.getParameter("pw");
// 			(String)session.getAttribute("pw");

	final String DRIVER = "com.mysql.cj.jdbc.Driver";
	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	final String DBID = "root";
	final String DBPW = "1234";
	Class.forName(DRIVER);
	System.out.println(" 드라이버로드 성공! ");
	Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
	System.out.println(" 디비연결 성공! ");
	
	String sql = "select pw from itwill_member where id=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1,id);
	
	ResultSet rs = pstmt.executeQuery();
	
	if(rs.next()){
		if(pw.equals(rs.getString("pw"))){
			sql = "delete from itwill_member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			session.invalidate();
			%>
			<script type="text/javascript">
			alert("Good Bye.");
			location.href="main.jsp";
			</script>
			<%
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
		alert("No Information!");
		history.back();
		</script>
		<%
	}
	%>

</body>
</html>


















