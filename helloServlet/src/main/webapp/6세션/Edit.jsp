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
<script>
    function confirmRedirect() {
        var confirmResult = confirm("페이지를 전환하면 작성된 글이 삭제됩니다. 정말로 페이지를 이동하시겠습니까?");
        if (confirmResult) {
            location.href = 'Board.jsp';
        }
    }
</script>
<%@include file="Link.jsp" %>
<%
	// out.print(request.getParameter("num")); 값이 넘어오는지 확인해보기

	String num = request.getParameter("num");
	
	BoardDao dao = new BoardDao();
	// request.getParameter("num") : 조회하려는 게시글 번호
	// 게시글 1건을 조회 후 board객체에 담아서 반환
	// Board board = dao.selectOne(request.getParameter("num"));
	Board board = dao.selectOne(num);
%>
<script>
	function editPost(){
		var res = confirm("수정 하시겠습니까?");
		if(res){
			location.href = "View.jsp?num=<%=board.getNum()%>";
		}
	}
</script>
<body>

<h2>수정 화면</h2>
<!-- submit이 작동하기 위해서는 form태그가 있어야함 reset도 마찬가지 -->
<form action="EditProcess.jsp" method="post">
	<input type = "text" value="<%=num %>" name="num">
	<table border="1px" width="90%">
        <tr>
            <td>번호</td>
            <td><%=board.getNum()%></td>
            <td>작성자</td>
            <td><%=board.getId()%></td>
        </tr>
        <tr>
            <td>작성일</td>
            <td><%=board.getPostdate()%></td>
            <td>조회수</td>
            <td><%=board.getViscount()%></td>
        </tr>
        <tr>
            <td>제목</td>
            <td colspan="3">
            <input type="text" value="<%=board.getTitle()%>" name="title" style="width:90%">
            </td>
        </tr>
        <tr>
            <td>내용</td>
            <td colspan="3" height="100">
	            <textarea name="content" name="title" style="width:90%; height:100px">
	            <%=board.getContent()%>
	            </textarea>
            </td>
        </tr>
        <tr>
            <td colspan="4" align="center">
            	<button type="submit">수정하기</button>
            	<button type="reset">초기화</button>
            	<button type="button" onclick="confirmRedirect();">목록보기</button>
            </td>
        </tr>
    </table>
	</form>	
</body>
</html>


<%
/*
< button type="button" onclick="location.href='Board.jsp';">
                    목록 보기
                </button>
                < %
                // 로그인한 아이디와 글쓴이가 같으면 수정, 삭제 버튼 활성화
                if(session.getAttribute("UserId") != null
                	&& board.getId().equals(session.getAttribute("UserId"))){
                % >
                <button type="button" onclick="editPost()">수정하기</button>
                < %
                }
                % >
*/
                
%>