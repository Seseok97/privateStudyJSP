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
	<script type="text/javascript">
		function checkPw(){
			if(document.fr.pw.value == ""){
				alert("Input PassWord!");
				document.fr.pw.focus();
				return false;
			}
		}
	
	</script>
</head>
<body>
	<h1>memberUpdate.jsp</h1>
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
	ResultSet rs = pstmt.executeQuery();
	
	MemberBean mb = new MemberBean();
	
	if(rs.next()){
		mb.setId(rs.getString("id"));
		mb.setPw(rs.getString("pw"));
		mb.setName(rs.getString("name"));
		mb.setGender(rs.getString("gender"));
		mb.setAge(rs.getInt("age"));
		mb.setEmail(rs.getString("email"));
		mb.setRegdate(rs.getDate("regdate"));
		
		out.print("your ID: "+ rs.getString("id"));
	}
	
	if(mb.getGender().equals("") || mb.getGender() == null){
		mb.setGender("남");
	}
	System.out.println("회원정보 조회 성공!");
	System.out.println(mb);
	%>
	<fieldset>
		<legend>내 정보 수정</legend>
			<form action="memberUpdatePro.jsp" method="post" name="fr" onsubmit="return checkPw();">
				ID: <input type="text" name="id" value="<%=mb.getId() %>" readonly><br>
				PW: <input type="password" name="pw"><br>
				Name: <input type="text" name="name" value="<%=mb.getName() %>"><br>
				Age: <input type="text" name="age" value="<%=mb.getAge() %>"><br>
				E-mail: <input type="text" name="email" value="<%=mb.getEmail() %>>" readonly><br>
				Gender: <br><input type="radio" name="gender" value="남"
						<%
						if(mb.getGender().equals("남")){
							%>checked<%
						}
						%>
						>남
						<br><input type="radio" name="gender" value="여"
						<%
						if(mb.getGender().equals("여")){
							%>checked<%
						}
						%>
						>여<br>
						<hr>
						<input type="submit" value="SUBMIT">
			</form>
	
	</fieldset>
	

</body>
</html>





















