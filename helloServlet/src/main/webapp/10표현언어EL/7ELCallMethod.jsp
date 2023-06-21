<%@page import="utils.CookieManager"%>
<%@page import="el.MyELClass"%>
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
	MyELClass myClass = new MyELClass();
	pageContext.setAttribute("myClass", myClass);
	pageContext.setAttribute("response", response);
	
%>
<h3>영역에 저장 후 메소드 호출하기</h3>
	001129-3000000 → ${ myClass.getGender("001129-30000000")}<br>
	001129-4000000 → ${ myClass.getGender("001129-40000000")}<br>
	001129-5000000 → ${ myClass.getGender("001129-50000000")}<br>
	
<h3>정적메소드 호출하기</h3>
	${ MyELClass.showGugudan(7) }
	
<h3>정적메소드 호출하기 - 쿠키생성하기</h3>
	
	<!-- 그냥 response를 입력하면 nullpointException 오류가 발생합니다  -->
	<!-- pageContext.setAttribute("response", response);를 만들어 왜 오류가 안나는지 생각해보세요 -->
	${ CookieManager.makeCookie(response, "ELCookie", "EL좋아요", 10) } <br>
	${ cookie.ELCookie.value }
	
<h3>메소드 호출하기</h3>
	<!-- The method getReplace() is undefined for the type String -->
	${"123-123".replace("-", "") }

</body>
</html>