<%@page import="common.JSFunction"%>
<%@page import="dto.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 사용자의 입력값을 받아서 DB에 입력하는겁니다.
	입력 메소드 실행시켜주면 됩니다.
-->
<%
	// 한글 깨짐 방지
	request.setCharacterEncoding("UTF-8");
	// out.print(request.getParameter("num"));
	// out.print(request.getParameter("title"));
	// out.print(request.getParameter("content"));
	
	// 파라메터를 입력받아 Dto객체 설정
	String num = request.getParameter("num");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	Board board = new Board(num, title, content, "", "", "");
	
	// 게시물 업데이트 
	BoardDao dao = new BoardDao();
	int res = dao.update(board);
	
	
	
	if(res > 0){
		// 성공 : 메세지 출력 상세페이지로 이동
		JSFunction.alertLocation("게시글이 수정 되었습니다.(공통호출)", "View.jsp?num=" + board.getNum(), out);
	} else {
		// 실패 : 메세지 출력 이전페이지로 이동
		JSFunction.alertBack("수정중 오류가 발생 하였습니다.(공동호출)", out);
	}
%>
</body>
</html>