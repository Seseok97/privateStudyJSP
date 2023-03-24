<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>logout.jsp</h1>
	<script type="text/javascript">
// 	var tmp = confirm("정말 로그아웃 하시겠습니까?");
// 	if(tmp){
		<%
		session.invalidate();
 		%>  
// 		location.href ="main.jsp";
// 	}else{
// 		location.href ="main.jsp";
// 	}
	alert("Logout success!");
	location.href="main.jsp";
	</script>

</body>
</html>