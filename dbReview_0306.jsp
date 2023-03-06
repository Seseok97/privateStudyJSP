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
<h1>dbReview_0306.jsp</h1>
<%
//한글처리
request.setCharacterEncoding("UTF-8");
//드라이버 설치 > 돼있음
//드라이버 로드
	//DB 연결정보 저장
	final String DRIVER = "com.mysql.cj.jdbc.Driver";
	final String DBURL = "jdbc:mysql://localhost:3306/hr";
	final String DBID = "root";
	final String DBPW = "1234";

Class.forName(DRIVER);
System.out.println("Driver ready");
//DB 연결
Connection con = DriverManager.getConnection(DBURL,DBID,DBPW);
System.out.println("DB ready");
System.out.println(con);
//쿼리 작성
String sql = "select * from employees";
PreparedStatement pstmt = con.prepareStatement(sql);
//SQL 실행
ResultSet rs = pstmt.executeQuery();
//데이터 출력
while(rs.next()){
	out.print("이름: "+rs.getString("last_name")+"<br>");
	out.print("월급: "+rs.getString("salary")+"<br>");
	out.print("<br>");
}


%>

</body>
</html>