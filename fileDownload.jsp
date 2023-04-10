<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.FileInputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>fileDownload.jsp</h1>
<%
String fileName = request.getParameter("fileName"); //  서버 업로드 파일 경로
String savePath = "upload"; // 가상경로

ServletContext CTX = getServletContext();
String downloadPath = CTX.getRealPath(savePath);
System.out.println("downloadPath = "+downloadPath);

String filePath = downloadPath+"\\"+fileName; // 다운로드할 파일의 경로
System.out.println("filePath : "+filePath);

byte[] b = new byte[4096];

FileInputStream fis = new FileInputStream(filePath);
String mimeType = getServletContext().getMimeType(filePath);
System.out.println("mimeType: "+ mimeType);
if(mimeType == null){
	mimeType="application/octet-stream";
}
response.setContentType(mimeType);

String agent = request.getHeader("User-Agent");
boolean ieBrowser = (agent.indexOf("MSIE") > -1)		// MSIE
					|| (agent.indexOf("Trident") > -1); // Trident
if(ieBrowser){
	fileName=URLEncoder.encode(fileName,"UTF-8").replaceAll("\\","%20%");
}else{
	fileName=new String(fileName.getBytes("UTF-8"),"iso-8859-1");
}
System.out.println("파일전송준비 완료!");

response.setHeader("Content-Disposition","attachment; fileName="+fileName);

out.clear();
out = pageContext.pushBody();
ServletOutputStream out2 = response.getOutputStream();

int data = 0;
while((data = fis.read(b,0,b.length)) != -1){
	out2.write(b,0,data);
}

out2.flush();
out2.close();
fis.close();
					
%>
</body>
</html>