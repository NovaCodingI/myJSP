<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
</head>
<script>
    function confirmRedirect() {
        var confirmResult = confirm("페이지를 전환하면 작성된 글이 삭제됩니다. 정말로 페이지를 이동하시겠습니까?");
        if (confirmResult) {
            location.href = '../6세션/Board.jsp';
        }
    }
    <!--	
    function checkForm() {
        var title = document.getElementsByName("title")[0].value;
        var content = document.getElementsByName("content")[0].value;
        
        if (title.trim().length === 0 && content.trim().length === 0) {
            alert("수정된 내용이 없습니다.");
            return false; // 전송 취소
        }
        
        return true; // 전송 실행
    }
    -->
</script>
<body>
<jsp:include page="../6세션/Link.jsp" />
<h2>회원제 게시판 - 수정하기(Edit)</h2>
<form onsubmit="return checkForm();">
    <table border="1" width="90%">
        <tr>
            <td>제목</td>
            <td>
                <input type="text" name="title" style="width: 90%;"/> 
            </td>
        </tr>
        <tr>
            <td>내용</td>
            <td>
                <textarea name="content" style="width: 90%; height: 100px;"></textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type="submit">작성 완료</button>
                <button type="reset">다시 입력</button>
                <button type="button" onclick="confirmRedirect();">목록 보기</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>