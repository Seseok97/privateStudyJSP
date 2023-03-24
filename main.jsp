<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>main.jsp</h1>
	<script type="text/javascript">
	function logout(){
		var tmp = confirm("You wanna Logout?");
		if(tmp){
			location.href = 'logout.jsp';
		}else{
			location.href = 'main.jsp';
		}
	}
	
	</script>
	<%
	String id = (String)session.getAttribute("id");
	if(id == null){
		response.sendRedirect("loginForm.jsp");
	}
	%>
	로그인 아이디 : <%=session.getAttribute("id") %><br>
	<input type="button" value="로그아웃" onclick="return logout();">
	<hr>
	
	<h3><a href="memberInfo.jsp"> 내 정보 조회</a></h3>
	
	<h3><a href="memberUpdate.jsp"> 내 정보 수정</a></h3>
	
	<h3><a href="memberDelete.jsp"> 회원 탈퇴</a></h3>
	<hr>
	<%
	if(id != null){
	if(id.equals("admin")){
		%>
		<h2>관리자 전용 메뉴</h2>
		
		<h3><a href="memberList.jsp"> 회원 정보 목록</a></h3>
		<%
		}
	}
	%>


</body>
</html>