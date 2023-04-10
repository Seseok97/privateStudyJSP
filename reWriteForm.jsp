<%@page import="com.itwillbs.board.boardReview.BoardDTO"%>
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
	<h1>reWriteForm.jsp</h1>
	<h2>게시판 답글 쓰기</h2>
	<%
	// 전달정보 저장
	
	int bno = Integer.parseInt(request.getParameter("bno"));
	String pageNum = request.getParameter("pageNum");
	
	BoardDAO dao = new BoardDAO();
	BoardDTO dto = dao.getBoard(bno);
	%>
	
	<fieldset>
		<form action="reWritePro.jsp?pageNum=<%=pageNum %>"  method="post">
			<input type="hidden" name="bno" value="<%=bno %>">
			<input type="hidden" name="re_ref" value="<%=dto.getRe_ref()%>">
			<input type="hidden" name="re_lev" value="<%=dto.getRe_lev()%>">
			<input type="hidden" name="re_seq" value="<%=dto.getRe_seq()%>">
			
			글쓴이: <input type="text" name="name"><br>
			비밀번호: <input type="password" name="pass"><br>
			제목: <input type="text" name="subject" value="[답글]"><br>
			내용: <textarea rows="5" cols="35" name="content"></textarea><br>
			<hr>
			<input type="submit" value="글쓰기">
		</form>
	</fieldset>
	
</body>
</html>