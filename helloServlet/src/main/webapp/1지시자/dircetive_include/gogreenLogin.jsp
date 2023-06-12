<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 Action</title>
</head>
<body>

<%
	String id = request.getParameter("userid");
	String pw = request.getParameter("userpw");
	
	String saveYN = request.getParameter("save_check");
	
	out.print("saveYN : " + saveYN + "<br>");
	
	// if("Y".equals(saveYN)){
	// 체크박스가 체크되었을경우, 아이디를 쿠키에 저장합니다.
	if(saveYN != null && saveYN.equals("Y")){
		out.print("쿠키 생성");
		CookieManager.makeCookie(response, "userId", id, 60*60*24*7);
		
	}
	
	// 아이디가 abc, 비밀번호가 123
	// id != null && id.equals("abc") 널처리를 안하고싶다면 그 객체로 접근해서 "abc".
	
	// .equalsIgnoreCase(id) 대소문자 구문없는 메소드
	if("abc".equals(id) && "123".equals(pw)){
		// 로그인 성공
		
		
		// 세션영역에 id 저장
		session.setAttribute("id", id);

		// response.sendRedirect("gogreen_main.jsp?name="+id);
		response.sendRedirect("gogreen_main.jsp");
		// 요청할 페이지 정보
	} else {
		// 로그인 실패
		out.print("로그인 실패");
		// 실패했을때도 id 값 저장
		response.sendRedirect("gogreen_main.jsp?loginErr=Y");
		// loginErr=Y 라는 매개변수를 넣어주었음
	}
%>

</body>
</html>