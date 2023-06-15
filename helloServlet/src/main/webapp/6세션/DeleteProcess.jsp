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
<%
    String num = request.getParameter("num");
	out.print(request.getParameter("num"));
	
	// HttpSession session = request.getSession(false); // 세션 가져오기 에러남
    
    //String id = session.getAttribute("UserId") == null ? "" : session.getAttribute("UserId").toString();
    
    // String id = (session != null && session.getAttribute("UserId") != null) ? session.getAttribute("UserId").toString() : "";
    
    if (session == null || session.getAttribute("UserId") == null) {
    
    	JSFunction.alertLocation("세션이 만료되어 로그인 페이지로 이동합니다", "LoginForm.jsp", out);

    } else {
    	
    Board board = new Board();
    board.setNum(num);
	
    BoardDao dao = new BoardDao();
    int res = dao.delete(num);
    
    // 삭제 후 게시글 목록 페이지로 이동
    if(res > 0){
    	// 삭제 성공
    	JSFunction.alertLocation("삭제 되었습니다.", "Board.jsp", out);
    	// response.sendRedirect("Board.jsp");
    } else {
    	// 삭제 실패
    	JSFunction.alertBack("삭제중 오류가 발생하였습니다.", out);
    }
    	
    }
    
    
%>
</head>
<body>

</body>
</html>
