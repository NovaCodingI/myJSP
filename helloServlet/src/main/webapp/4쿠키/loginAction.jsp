<%@page import="utils.CookieManager"%>
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
		int i = 0;
	
		if(i > 0){
			// 내장객체를 이용한 출력
			out.write("i는 0보다 크다!");	
	%>
		<h1>i는 0보다 크다아</h1>
	<%
		}
	%>


	<%
	
	// name속성의 값을 매개값으로 넘겨주면 value속성의 값을 반환 합니다.
	String id = request.getParameter("userid");
	String pw = request.getParameter("userpw");
	
	// 아이디 저장 체크박스
	String saveYN = request.getParameter("save_check");
	out.print("saveYN : " + saveYN + "<br>");
	
	// 아이디 저장하기 체크박스에 체크가 되었다면
	// 쿠키에 아이디를 저장 합니다.
	if("Y".equals(saveYN)){
		
		// CookieManager를 이용하여 쿠키를 생성 후 응답객체에 담아줍니다.
		// static으로 메소드를 만들었기때문에 바로 작성 가능
		CookieManager.makeCookie(response, "userId", id, 3600);
		
		/*
		out.print("id : " + id + "<br>");
		// 쿠키 생성하기 (userId, 사용자아이디)
		Cookie cookie = new Cookie("userId", id);
		
		// 유지시간 설정
		cookie.setMaxAge(3600);
		
		// 응답객체에 담기
		response.addCookie(cookie);
		*/
	}
	
	
	
	// 아이디가 abc, 비밀번호가 123
	// id != null && id.equals("abc") 널처리를 안하고싶다면 그 객체로 접근해서 "abc".
	
	// .equalsIgnoreCase(id) 대소문자 구문없는 메소드
	if("abc".equals(id) && "123".equals(pw)){
		// 로그인 성공
		out.print("로그인 성공");
		response.sendRedirect("login.jsp?name="+id);
	%>
		<!-- html을 출력 -->
		<h1>로그인 성공</h1>
	<%
		// 요청할 페이지 정보
	} else {
		// 로그인 실패
		out.print("로그인 실패");
		// response.sendRedirect("login.jsp?loginErr=Y");
		// loginErr=Y 라는 매개변수를 넣어주었음
	}
	%>


</body>
</html>