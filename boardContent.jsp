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
<h1>boardContent.jsp</h1>

	<%
	
	int bno = Integer.parseInt(request.getParameter("bno"));
	String pageNum = request.getParameter("pageNum");
	BoardDAO dao = new BoardDAO();
	
	
	
	// DB > 조회수 1 증가 메서드
	dao.updateReadCount(bno);
	
	// bno 정보 저장
	BoardDTO dto = dao.getBoard(bno);
	%>
	
	<table border="1">
		<tr>
			<td>글 번호</td>
			<td><%=dto.getBno() %></td>
			<td>조회수</td>
			<td><%=dto.getReadcount() %></td>
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
			<td colspan="3">
			<%if(dto.getFile() != null){%>
				<a href="file/fileDownload.jsp?fileName=<%=dto.getFile() %>">
				<img src="save.png" width="13" height="13"> <%=dto.getFile() %></a>
			<%}else{%>
				첨부파일 없음
			<%}%></td>
		</tr>
		<tr>
			<td>글 내용</td>
			<td colspan="3"><%=dto.getContent() %></td>
		</tr>
		<tr>
			<td colspan="4">
				<input type="button" value="수정" onclick='location.href="boardUpdate.jsp?bno=<%=bno %>&pageNum=<%=pageNum %>";'>
				<input type="button" value="삭제" onclick='location.href="boardDelete.jsp?bno=<%=bno %>&pageNum=<%=pageNum %>";'>
				<input type="button" value="답글" onclick='location.href="reWriteForm.jsp?bno=<%=bno %>&pageNum=<%=pageNum %>";'>
				<input type="button" value="목록" onclick='location.href="boardList.jsp?pageNum=<%=pageNum %>";'>
			</td>
		</tr>
		
		
	
	
	</table>
	
	
	
</body>
</html>