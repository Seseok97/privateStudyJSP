<%@page import="com.itwillbs.board.boardReview.BoardDAO"%>
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
	<h2>전달받은 정보를 DB에 저장</h2>
	<%
	request.setCharacterEncoding("UTF-8");
	%>
	<jsp:useBean id="dto" class="com.itwillbs.board.boardReview.BoardDTO"/>
	<jsp:setProperty property ="*" name="dto"/>
	<%
	dto.setIp(request.getRemoteAddr());
	
	BoardDAO dao = new BoardDAO();
	
	dao.insertBoard(dto);
	
	response.sendRedirect("boardList.jsp");
	%>

</body>
</html>