<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 방법 1. 회원인증정보 속성삭제 (F12 세션 ID는 유지됩니다.)
	session.removeAttribute("UserId");
	session.removeAttribute("member");
	
	// 방법2. 세션무효화
	// session.invalidate();
	
	// 페이지 이동
	response.sendRedirect("LoginForm.jsp");
%>
</body>
</html>