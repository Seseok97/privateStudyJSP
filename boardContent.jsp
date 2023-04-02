<%@page import="com.seseokboard.board.BoardDTO"%>
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
<h1>boardContent.jsp</h1>

	<%
	
	int bno = Integer.parseInt(request.getParameter("bno"));
	String pageNum = request.getParameter("pageNum");
	BoardDAO dao = new BoardDAO();
	
	
	
	// DB > 조회수 1 증가 메서드
// 	dao.updateReadCount(bno);
	
	// bno 정보 저장
	BoardDTO dto = dao.getBoard(bno);
	%>
	
	<table border="1">
		<tr>
			<td>글 번호</td>
			<td><%=dto.getBno() %></td>
			<td>조회수</td>
			<td><%=dto.getReadCount() %></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><%=dto.getName() %></td>
			<td>작성일</td>
			<td><%=dto.getDate() %></td>
		</tr>
		<tr>
			<td>글 제목</td>
			<td colspan="3"><%=dto.getSubject() %></td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<td colspan="3"><%=dto.getFile() %></td>
		</tr>
		<tr>
			<td>글 내용</td>
			<td colspan="3"><%=dto.getContent() %></td>
		</tr>
		<tr>
			<td colspan="4">
				<input type="button" value="수정">
				<input type="button" value="삭제">
				<input type="button" value="답글">
				<input type="button" value="목록">
			</td>
		</tr>
		
		
	
	
	</table>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>