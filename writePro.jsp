<%@page import="com.seseokboard.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>writePro.jsp</h1>
	<%
	request.setCharacterEncoding("UTF-8");
// 	String id = request.getParameter("name");
// 	if(id == null || id == ""){
		%>
		<script type="text/javascript">
// 		alert('INPUT NAME!!');
// 		history.back();
		</script>
		<%
// 	}// if end // not working.
	%>
	<jsp:useBean id="dto" class="com.seseokboard.board.BoardDTO"/>
	<jsp:setProperty property="*" name="dto"/>
	<%
	dto.setIp(request.getRemoteAddr());
	System.out.println(dto.getIp());
	
	BoardDAO dao = new BoardDAO();
	dao.insertBoard(dto);
	
	System.out.println("writePro: 글쓰기 동작 수행 완료!");
	response.sendRedirect("boardList.jsp");
	%>


</body>
</html>