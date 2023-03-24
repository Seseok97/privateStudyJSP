<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertPro.jsp</title>
</head>
<body>
<h1>회원가입 진행 페이지(insertPro.jsp)</h1>
	<%
	// 한글처리
	request.setCharacterEncoding("UTF-8");
	// 전달정보 저장 >> 액션태그 활용
	%>
	<jsp:useBean id="mb" class="signin_login.MemberBean"/>
	<jsp:setProperty property="*" name="mb"/>
	<%
	// 회원가입 일자정보를 regdate에 저장
	mb.setRegdate(new Date(System.currentTimeMillis()));
	%>
	<%=mb %>
	<h2>전달받은 정보를 itwill_member 테이블에 저장!</h2>
	<%
	final String DRIVER="com.mysql.cj.jdbc.Driver";
	final String DBURL="jdbc:mysql://localhost:3306/jspdb";
	final String DBID="root";
	final String DBPW="1234";
	
	Class.forName(DRIVER);
	System.out.println("드라이버로드 성공!");
	
	Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
	System.out.println("DB연결 성공!");
	System.out.println(con);
	
	//sql 쿼리 작성 + pstmt 객체
	String sql = "insert into itwill_member(id,pw,name,gender,age,email,regdate) values(?,?,?,?,?,?,?)";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	// 물음표 채우기
	pstmt.setString(1,mb.getId());
	pstmt.setString(2,mb.getPw());
	pstmt.setString(3,mb.getName());
	pstmt.setString(4,mb.getGender());
	pstmt.setInt(5,mb.getAge());
	pstmt.setString(6,mb.getEmail());
	pstmt.setDate(7,mb.getRegdate());
	
	// sql 쿼리 실행
	pstmt.executeUpdate();
	
	System.out.println("회원가입 성공!");
	
	response.sendRedirect("loginForm.jsp");
	%>
	
	

</body>
</html>