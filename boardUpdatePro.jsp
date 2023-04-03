<%@page import="org.apache.commons.collections4.bag.SynchronizedSortedBag"%>
<%@page import="com.itwillbs.board.boardReview.BoardDAO"%>
<%@page import="com.itwillbs.board.boardReview.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>boardUpdatePro.jsp</h1>
	<%
	request.setCharacterEncoding("UTF-8");
	int bno = Integer.parseInt(request.getParameter("bno"));
	String pageNum = request.getParameter("pageNum");
	// 글 수정 !!
	%>
	<jsp:useBean id="dto" class="com.itwillbs.board.boardReview.BoardDTO"/>
	<jsp:setProperty property="*" name="dto"/>
	<%
	BoardDAO dao = new BoardDAO();
	int result = dao.updateBoard(dto);
	%>
	<%=result %>
	
	<%
	if(result == 1){
		System.out.println("bUP: 글 수정 성공!");
		response.sendRedirect("boardList.jsp?pageNum="+pageNum);
	}else if(result == -1){
		%>
		<script type="text/javascript">
		alert('실행 오류!');
		history.back();
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
		alert('미실행!');
		history.back();
		</script>
		<%
	}// all if end
	%>


</body>
</html>