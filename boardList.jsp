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
	
	<%
	BoardDAO dao = new BoardDAO();
	
	int count = dao.getBoardCount();
	
	int pageSize = 10;
	
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum="1";
	}
	
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize +1;
	int endRow = currentPage * pageSize;
	
	ArrayList boardList = dao.getBoardList(startRow, pageSize);
	%>
	<table border="1">
		<tr>
			<td>글번호</td>
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
				<td><%=dto.getSubject() %></td>
				<td><%=dto.getName() %></td>
				<td><%=dto.getDate() %></td>
				<td><%=dto.getReadcount() %></td>
				<td><%=dto.getIp() %></td>
			</tr>
			<%}%>
		</table>
	<script type="text/javascript">
		function pageUp(){
			if(<%=Integer.parseInt(pageNum)%> <= <%=count/pageSize +1%>){
			location.href =
				'<%=request.getRequestURL().toString() %>?pageNum=<%=Integer.parseInt(pageNum)+1%>'
			}
		}
		function pageDown(){
			if(<%=Integer.parseInt(pageNum)-1%> > 0){
			location.href =
				'<%=request.getRequestURL().toString() %>?pageNum=<%=Integer.parseInt(pageNum)-1%>'
			}
		}
	</script>
	<input type="button" 
	value="LastPage" 
	onclick="return pageDown()">
	<input type="button" 
	value="NextPage" 
	onclick="return pageUp()">
	
	
</body>
</html>