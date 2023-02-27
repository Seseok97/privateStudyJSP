<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>loginReview_0227_proc.jsp</h1>
<%!
//멤버변수 선언
String DBID="tptjrsla";
String DBPW="123";
%>

<script type="text/javascript">
//함수 선언
function goMainPage(){
	location.href="loginReview_0227_main.jsp"
}

function loginSuccess(){
	location.href="loginReview_0227_Success.jsp"
};

function idFail(){
	alert("아이디를 확인해 주세요.")
	goMainPage();
};

function pwFail(){
	alert("비밀번호를 확인해 주세요.")
	goMainPage();
};

function idNull(){
	alert("아이디를 입력해주세요.")
	goMainPage();
};
function pwNull(){
	alert("비밀번호를 입력해주세요.")
	goMainPage();
};
</script>

<%

// UTF-8 필터
request.setCharacterEncoding("UTF-8");
// 로그인정보 전달받기.
String id=request.getParameter("id");
String pw=request.getParameter("pw");
// 성공 > 성공페이지 > 세션에 로그인성공 정보저장
if(id.equals(DBID)){
	if(pw.equals(DBPW)){
		session.setAttribute("loginSuccess",id); // 세션에 로그인정보 저장
		%>
		<script type="text/javascript">
		//비밀번호까지 같을때
		loginSuccess();
		</script>
		<%
	// 실패 > 메인페이지
	// 공란확인 > 얼럿창
	}else if(pw.equals("")){
		%>
		<script type="text/javascript">
		//비밀번호 미입력
		pwNull();
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
		//비밀번호 틀림
		pwFail();
		</script>
		<%
	}
}else if(id.equals("")){
	%>
	<script type="text/javascript">
	//아이디 미입력
	idNull();
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
	//아이디 틀림
	idFail();
	</script>
	<%
	
}

%>



<script type="text/javascript">
//js 공백란
</script>

</body>
</html>