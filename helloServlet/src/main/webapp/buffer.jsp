<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    errorPage="errorPage.jsp"%>
<%@ page buffer="10kb" autoFlush="true" %>

<!-- page buffer="1kb" autoFlush="false" -->
<!-- Error : JSP 버퍼 오버 플로우
	버퍼의 크기를 충분히 크게 지정 하던가
	autoFlush속성을 true로 설정 하면 해결
-->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 

CPU ▶ 메모리 ▶ I/O 출력 순으로 속도가 빠름
잦은 I/O는 컴퓨터에 부담을 줄수있음

DB도 입출력이 가장느림, 연결을 많이하는것은 올바르지않은 것일까? 일껄?

버퍼
	응답 결과를 웹 브라우저로 즉시 전송하지 않고,
	출력할 내용을 버퍼에 저장해 두었다가 일정량이 차면 클라이언트로 전송
	
	(CPU나 메모리에 비해 IO(입출력) 속도가 느리므로 응답결과를 버퍼에 저장해 두었다가 전송)
	
	buffer="none"으로 지정시 포워드, 에러페이지 등의 기능을 사용하지 못합니다.
	크기를 줄일경우 jsp의 기능을 온전히 사용하지 못하므로 값을 변경 하는 경우 거의 없음.
	
버퍼를 사용 하는 이유
	- 성능 향상
	- JSP 실행 도중 버퍼를 비우고 새로운 내용을 전송 가능
	- 버퍼가 다 차기 전에, 응답 헤더를 변경 가능
	
	사용자 요청(요청을 받는 컨트롤러) ▶ (컨트롤러를 통해서 서로 다른 페이지를 보여주고싶을때가 있을겁니다)
	login / id = abc, pw = 123 . 폼에서 데이터 가져오겠죠?
	컨트롤러가 받아가요 , id/pw 체크하고 db에 있는지 확인할겁니다
	있니? 있으면 로그인 성공 login.jsp파일로 연결해주자
	(응답을 하는 JSP)/(로그인이 실패했는지 성공했는지 처리를.. login_OK or login_false)
	이런 처리를 하는게 forward, sendRedirect
	
	만약 버퍼가 없다면 바로바로 보여주기때문에 이런 처리를 사용할수없을것이다. 하지만 버퍼는 몰아서 하기때문에..
	(forward, redirect)
	
autoFlush
	true	: 버퍼가 차면, 자동 전송
	false	: 버퍼가 차면, 예외 Exception 발생으로 실행 중지
-->

<%
	for(int i=0;i<100;i++){
		out.println("abcde12345");
	}
	out.println(out.getBufferSize());
	out.println(out.isAutoFlush());
%>
</body>
</html>