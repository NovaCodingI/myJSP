<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>MVC패턴으로 회원 인증하기</h2>
	
	<p>${ authMessage }</p>
	
	<!-- 매핑해줄때는 컨텍스트루트가 빠집니다. 서버 모듈에 / 에 있어요, web.xml에서 가져온 값 /13서블릿/MemberAuth.mvc --> 
	
	
	<!-- http://localhost:8080/myServlet/13서블릿/ == ./ (현재경로), 같은 내용입니다.-->
	
	<a href="./MemberAuth.mvc?id=musthave&pw=1234">
		test로그인	: 
	</a>
	
	<%--
	<a href="/myServlet/13서블릿/MemberAuth.mvc?id=musthave&pw=1234">
    	test로그인:
	</a>
	 --%>
	

</body>
</html>