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
		response.sendRedirect("login.jsp?loginErr=Y");
		// loginErr=Y 라는 매개변수를 넣어주었음
	}
	%>


</body>
</html>