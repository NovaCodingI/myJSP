<%@page import="common.JSFunction"%>
<%@page import="dao.BoardDao"%>
<%@page import="dao.NewBoardDao"%>
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
<%@include file="../6세션/IsLogin.jsp" %>
<%
	
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String num = request.getParameter("num");
	
	// out.print(num); 확인용
	
	String id = session.getAttribute("UserId").toString();
	
	if (title.trim().length() == 0 && content.trim().length() == 0) {
        
		JSFunction.alertBack("수정된 내용이 없습니다.", out);
	
	} else { 
	
		Board board = new Board(num, title, content, id , "", "");
		BoardDao dao = new BoardDao();
	
		int res = dao.update(board);
		
		if(res>0){
			JSFunction.alertLocation("수정 되었습니다.", "View.jsp?num="+num, out);
		} else {
			JSFunction.alertBack("수정작업 중 오류가 발생 하였습니다.", out);
		}
	}
	
	/* Test
	out.print(request.getParameter("title"));
	out.print(request.getParameter("content"));
	out.print(request.getParameter("num"));
	*/
%>

</body>
</html>