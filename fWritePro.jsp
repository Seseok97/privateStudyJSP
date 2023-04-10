<%@page import="com.itwillbs.board.boardReview.BoardDAO"%>
<%@page import="com.itwillbs.board.boardReview.BoardDTO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="org.apache.commons.collections4.bag.SynchronizedSortedBag"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>fWritePro.jsp</h1>
<%
String realPath = request.getRealPath("/upload");
int maxSize = 10 * 1024 * 1024;

MultipartRequest multi = new MultipartRequest(
								request,
								realPath,
								maxSize,
								"UTF-8",
								new DefaultFileRenamePolicy()
		); 
System.out.println("파일 업로드 완료 !!");

BoardDTO dto = new BoardDTO();
dto.setName(multi.getParameter("name"));
dto.setPass(multi.getParameter("pass"));
dto.setSubject(multi.getParameter("subject"));
dto.setContent(multi.getParameter("content"));
dto.setFile(multi.getFilesystemName("file"));
dto.setIp(request.getRemoteAddr());

BoardDAO dao = new BoardDAO();
dao.insertBoard(dto);

response.sendRedirect("boardList.jsp");


%>


</body>
</html>