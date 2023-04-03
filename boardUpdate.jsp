<%@page import="com.itwillbs.board.boardReview.BoardDAO"%>
<%@page import="com.itwillbs.board.boardReview.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function checkData(){
	if(document.fr.name.value == ""){
		alert("INPUT ID!");
		document.fr.name.focus();
		return false;
	}
	if(document.fr.pass.value == ""){
			alert("INPUT PW!");
			document.fr.pass.focus();
			return false;
	}
	if(document.fr.subject.value == ""){
		alert("INPUT SUBJECT!");
		document.fr.subject.focus();
		return false;
	}
}// checkData() function end
</script>
</head>
<body>
<h1>boardUpdate.jsp</h1>
		<%
		int bno = Integer.parseInt(request.getParameter("bno"));
		String pageNum = request.getParameter("pageNum");
		%>
		<jsp:useBean id="dto" class="com.itwillbs.board.boardReview.BoardDTO"/>
		<jsp:setProperty property="*" name="dto"/>
		<%
		BoardDAO dao = new BoardDAO();
		dto = dao.getBoard(bno);
		%>
	<fieldset>
		<form action="boardUpdatePro.jsp?pageNum=<%=pageNum %>" method="post" name="fr" onsubmit="return checkData();">
		<input type="hidden" name="bno" value="<%=bno %>">
			작성자:<input type="text" name="name" value="<%=dto.getName() %>"><br>
			비밀번호:<input type="password" name="pass" ><br>
			제목:<input type="text" name="subject" value="<%=dto.getSubject() %>"><br>
			내용:<textarea rows="5" cols="35" name="content" ><%=dto.getContent() %></textarea><br>
		<hr>
			<input type="submit" value="수정">
		
		</form>
	</fieldset>


</body>
</html>