<%@page import="com.itwillbs.board.boardReview.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
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
<h1>boardList.jsp</h1>
<h2><a href="writeForm.jsp">글쓰기</a></h2>
<h2><a href="fWriteForm.jsp?">파일 글쓰기</a></h2>
	
	<%
	// BoardDAO 객체 생성 > BoardDAO의 메서드를 이용하기 위함.
	BoardDAO dao = new BoardDAO();
	
	// 페이징처리 1 > 한 페이지에서 출력되는 게시글 수 제한
	int count = dao.getBoardCount();
	
	int pageSize = 5;
	
	String pageNum = request.getParameter("pageNum");
	// pageNum 인자는 개발자도구에서 확인할 수 있다.
	// html에서 기본적으로 넘겨주는 값인듯 ..
	if(pageNum == null){
		pageNum = "1";
	}
	
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize +1;
	int endRow = currentPage * pageSize;
	
	ArrayList boardList = dao.getBoardList(startRow, pageSize);
	
	
	%>
	<table border="1">
		<tr>
			<td>글 번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>
			<td>IP</td>
		</tr>
		<%
		for(int i=0;i<boardList.size();i++){
			BoardDTO dto = (BoardDTO)boardList.get(i);
			%>
			<tr>
				<td><%=dto.getBno() %></td>
				<td>
					<a href="boardContent.jsp?bno=<%=dto.getBno() %>&pageNum=<%=pageNum%>">
					<%if(dto.getRe_lev()>0){ %>
					<%for(int j=0;j<dto.getRe_lev()-1;j++){%>
						<img src="level.gif">
					<%} %><img src="re.gif"><%}%>
					<%=dto.getSubject() %></a></td>
				<td><%=dto.getName() %></td>
				<td><%=dto.getDate() %></td>
				<td><%=dto.getReadcount() %></td>
				<td><%=dto.getIp() %></td>
			</tr>
			<% }// for end %>
		<hr>
			<%
			// 페이징처리 2 > 페이지 찾아가기
			if(count != 0){
				int pageCount= count/pageSize + (count%pageSize==0? 0:1);
				
				int pageBlock = 6;
				
				//시작 페이지
				int startPage=(((currentPage -1)/pageBlock)*pageBlock)+1;
				//끝 페이지
				int endPage = startPage+pageBlock-1;
				if(endPage>pageCount){
					endPage = pageCount;
				}
				// 이전
				if(startPage > pageBlock){
					%>
					<a href="boardList.jsp?pageNum=<%=startPage-pageBlock %>">[Prev]</a>
					<%
				}
				// [1][2][3] ... 
				for(int i=startPage;i<=endPage;i++){
					%>
					<a href="boardList.jsp?pageNum=<%=i%>">[<%=i %>]</a>
					<%
				}
				//다음
				if(endPage < pageCount){
					%>
					<a href="boardList.jsp?pageNum=<%=endPage+1 %>">[Last]</a>
					<%
				}
				
			}// if end
			
			
			%>
		
	</table>



</body>
</html>