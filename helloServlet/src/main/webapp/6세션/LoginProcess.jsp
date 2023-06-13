<%@page import="dto.Member"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginProcess</title>
</head>
<body>
<%
	String id = request.getParameter("user_id");
	String pw = request.getParameter("user_pw");	
	
	MemberDao dao = new MemberDao();
	Member member = dao.login(id, pw);
	
	if(member != null){
		// 로그인 성공 → 세션에 member객체를 저장
		
		session.setAttribute("UserId", member.getId());
		session.setAttribute("member", member);
		
		// response.sendRedirect("LoginForm.jsp");
		response.sendRedirect("Board.jsp");
	} else {
		// 로그인 실패 → LoginForm 페이지로 이동, 오류 메세지 출력
		request.setAttribute("LoginErrMsg"
									, "아이디, 비밀번호가 일치하지 않습니다.");
		// sendRedirect는 response에 있고 유지가 안됨 forward를 사용해서 유지를 시켜주자
		// getParemater는 form에 있는 요소의 값을 읽어오는것!
		// setAttribute는 내가 직접 값을 저장해주는것
		// getAttribute는 setAttribute한 값을 가져오는것
		// get방식 호출 ? 쿼리스트링 사용
		
		// LoginForm.jsp로 이동
		// request영역을 공유하기 위해 forward 사용
		request.getRequestDispatcher("LoginForm.jsp")
									.forward(request, response);
	}

%>


</body>
</html>