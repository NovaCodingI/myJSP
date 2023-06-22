<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
	컨트롤러를 거치지 않고 JSP를 바로 호출했죠!!
	setAttribute하는것은 컨트롤러
	출력이 안되는게 맞습니다.
	
	서블릿이 실행되고
	컨트롤러가 호출이 되었는지 JSP가 호출되었는지는 명확하게 구분해야한다.
	Attribute에 저장한 값이 없어
	컨트롤러가 요청이 되어야한다.
	주소표시창에 지정해놓은 uri 가 변경되는것을 확인해보자
	
	uri실행 → 컨트롤러 → JSP forward 해주는것
	
	JSP 바로 실행하면 어디 거쳐서가는것이 아니기 때문에 데이터 값이 없습니다.
	 -->

	<h3>하나의 매핑으로 여러 요청 처리하기</h3>
	$ { resultValue }
	<ul>
		<li>URI		: ${ uri }</li>
		<li>요청명	: ${ commandStr }</li>
	</ul>
	
	<ul>
		<li><a href="../13서블릿/regist.one">회원가입</a></li>
		<li><a href="../13서블릿/login.one">로그인</a></li>
		<li><a href="../13서블릿/freeboard.one">자유게시판</a></li>
	</ul>

</body>
</html>
