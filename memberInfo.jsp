<%@page import="signin_login.MemberBean"%>
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
	<h1>memberInfo.jsp</h1>
	<h2>My Information</h2>
	<%
	String id = (String)session.getAttribute("id");
	if(id == null){
		response.sendRedirect("loginForm.jsp?oldURL="+request.getRequestURL());
	}
	final String DRIVER = "com.mysql.cj.jdbc.Driver";
	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	final String DBID = "root";
	final String DBPW = "1234";
	Class.forName(DRIVER);
	System.out.println(" 드라이버 로드 성공");
	Connection con 
	   = DriverManager.getConnection(DBURL, DBID, DBPW);
	System.out.println(" 디비연결 성공");
	String sql="select * from itwill_member where id=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1,id);
	ResultSet rs = pstmt.executeQuery(); //  실행 마침
	
	//여기서부터 모르는부분 !
	// MemberBean 객체 생성
	MemberBean mb = new MemberBean();
	
	if(rs.next()){
		//rs데이터 >> MemberBean에 저장
		mb.setId(rs.getString("id"));
		mb.setPw(rs.getString("pw"));
		mb.setName(rs.getString("name"));
		mb.setGender(rs.getString("gender"));
		mb.setAge(rs.getInt("age"));
		mb.setEmail(rs.getString("email"));
		mb.setRegdate(rs.getDate("regdate"));
		
		out.print("your ID: "+ rs.getString("id"));
	%>
			your PW: <%=rs.getString("pw") %><br>
	<%
	}
	%>
	<table border="1">
		<tr>
			<th>ID</th>
			<td><%=mb.getId()%></td>
		</tr>
		<tr>
			<th>PW</th>
			<td><%=mb.getPw() %></td>
		</tr>
		<tr>
			<th>Name</th>
			<td><%=mb.getName() %></td>
		</tr>
		<tr>
			<th>Gender</th>
			<td><%=mb.getGender() %></td>
		</tr>
		<tr>
			<th>Age</th>
			<td><%=mb.getAge()+" 살" %></td>
		</tr>
		<tr>
			<th>Email</th>
			<td><%=mb.getEmail() %></td>
		</tr>
		<tr>
			<th>RegDate</th>
			<td><%=mb.getRegdate() %></td>
		</tr>
	</table>
	<h2><a href="main.jsp">메인으로</a></h2>
	


</body>
</html>