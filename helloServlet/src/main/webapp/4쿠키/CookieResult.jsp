<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 값 출력하기</title>
</head>
<body>
	<h2>쿠키값 확인하기</h2>
	<p>처음 접속시 저장된 쿠키가 없는 경우 빈페이지가 출력 될 수 있습니다.</p>
	<%
		Cookie[] cookies = request.getCookies();
		// 처음에 접근하면 비어있을수 있기때문에 null 체크를 해줘야하며
		// 객체라면 null 체크를 해주는것이 통상적으로 맞다 null pointer exception!!
		
		if(cookies != null){
			// cookies[] 배열을 변수이름 cookie에 담아줍시다
			for(Cookie cookie : cookies){
				// 출력하고 싶으면 변수에 담거라!
				String cookieName = cookie.getName();
				String cookieValue = cookie.getValue();
				
				out.print("쿠키명 : " + cookieName + "<br>"
					 	+ "쿠키값 : " + cookieValue + "<br><br>");
			}
		}
		
	
	%>

</body>
</html>