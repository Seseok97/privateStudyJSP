<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>dbConnectTest.jsp</h1>
	
	<%
	// 0 - JDBC 드라이버 설치!!
	// WEB_INF/lib/mysql_connector-j-8.0.32.jar 설치.
	// 프로젝트당 1회만 하면 된다. >> 새 프로젝트 실행시 재설치 필요 !
	
	// 1 - 설치한 드라이버 로드(불러오기)
	Class.forName("com.mysql.cj.jdbc.Driver");
	// 라이브러리에 해당 파일이 없는 경우, ClassNotFoundException 에러가 발생한다.
	// 에러코드 발생시에는 아래서 위로 쭉 ~ 읽다보면 몬가 알게된다 ~
	
	System.out.println("드라이버 로드 성공!");
	
	// 2 - 드라이버를 사용하여 DB 연결
	Connection con =
	DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb","root","1234");
	
	System.out.println("DB연결 성공!");
	
	System.out.println(con);
	
	
	%>

</body>
</html>