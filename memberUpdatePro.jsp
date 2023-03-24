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
	<h1>memberUpdatePro.jsp</h1>
	<%
	String id = (String)session.getAttribute("id");
	if(id == null){
		response.sendRedirect("main.jsp");
	}
	request.setCharacterEncoding("UTF-8");
	%>
	<jsp:useBean id="umb" class="signin_login.MemberBean"/>
	<jsp:setProperty property="*" name="umb"/>
	<%
	final String DRIVER = "com.mysql.cj.jdbc.Driver";
	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	final String DBID = "root";
	final String DBPW = "1234";
	Class.forName(DRIVER);
	System.out.println(" 드라이버로드 성공! ");
	Connection con =
	   DriverManager.getConnection(DBURL, DBID, DBPW);
	System.out.println(" 디비연결 성공! ");
	String sql = "select pw from itwill_member where id=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1,umb.getId());
	ResultSet rs = pstmt.executeQuery();
	if(rs.next()){
		if(umb.getPw().equals(rs.getString("pw"))){
			sql = "update itwill_member set name=?, age=?, gender=? where id=?";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1,umb.getName());
			pstmt.setInt(2,umb.getAge());
			pstmt.setString(3,umb.getGender());
			pstmt.setString(4,umb.getId());
			
			pstmt.executeUpdate();
			
			%>
			<script type="text/javascript">
				alert("회원 정보 수정 완료!");
				location.href="main.jsp";
			</script>
			<%
		}else{
			%>
			<script type="text/javascript">
				alert("Check your PW");
				history.back();
			</script>
			<%		
		}
	}else{
		%>
		<script type="text/javascript">
			alert("Check your ID");
			history.back();
		</script>
		<%
	}
	%>
	

</body>
</html>