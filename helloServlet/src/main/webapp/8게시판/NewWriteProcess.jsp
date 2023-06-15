<%@page import="common.JSFunction"%>
<%@page import="dao.NewBoardDao"%>
<%@page import="dao.BoardDao"%>
<%@page import="dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 로그인 체크! IsLogin.jsp -->
<%@include file ="../6세션/IsLogin.jsp" %>
<!-- 상단에 로그인, 게시판(페이징) -->
<%@include file ="../6세션/Link.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");

	Board board = new Board();
	
	board.setTitle(request.getParameter("title"));
	board.setContent(request.getParameter("content"));
	board.setId(session.getAttribute("UserId").toString());
	
	
	/*
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	board.setTitle(title);
	board.setContent(content);
	// 아이디는 세션으로부터 가져올수있을것 같아요
	String id = session.getAttribute("UserId") == null ?
						"" : session.getAttribute("UserId").toString();
	board.setId(id);
	*/
	

	NewBoardDao dao = new NewBoardDao();
	int res = dao.insert(board);
	
	if(res > 0){
		JSFunction.alertLocation("게시글이 등록 되었습니다.(공통호출)", "List.jsp", out);
	} else {
		JSFunction.alertBack("등록중 오류가 발생하였습니다.(공통호출) \n 관리자에게 문의해주세요", out);
	}
	
%>
</body>
</html>