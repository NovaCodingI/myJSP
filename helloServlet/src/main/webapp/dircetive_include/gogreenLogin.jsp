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
		response.sendRedirect("gogreen_main.jsp?loginErr=Y");
		// loginErr=Y 라는 매개변수를 넣어주었음
	}
%>

</body>
</html>