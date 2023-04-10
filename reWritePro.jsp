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
	<h1>reWritePro.jsp</h1>
	<%
	// 한글처리
	request.setCharacterEncoding("UTF-8");
	String pageNum = request.getParameter("pageNum");
	%>
	<jsp:useBean id="dto" class="com.itwillbs.board.boardReview.BoardDTO"/>
	<jsp:setProperty property="*" name="dto"/>
	<%
	dto.setIp(request.getRemoteAddr());
	BoardDAO dao = new BoardDAO();
	dao.reInsertBoard(dto);
	response.sendRedirect("boardList.jsp?pageNum="+pageNum);
	%>
	
</body>
</html>