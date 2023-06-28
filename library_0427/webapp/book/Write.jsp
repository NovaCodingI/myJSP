<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
</head>
<!-- enctype="multipart/form-data" -->
<body>
<form name="writeFrm" method="post" enctype="multipart/form-data"
	action="./write.book" onsubmit="return validateForm(this);">
<%@include file="../common/header.jsp" %>
<h2>책 등록 하기</h2>
    <table border="1" width="90%">
        <tr>
            <td>아이디</td>
            <td>
                <input type="text" name="id" style="width: 150%;"
                	value="${sessionScope.userId }" readonly="readonly" />
                	
            </td>
        </tr>
        <tr>
            <td>제목</td>
            <td>
                <input type="text" name="title" style="width: 150%;" value="이거시뭐시요" />
                	
            </td>
        </tr>
        <tr>
            <td>작가</td>
            <td>
                <input type="text" name="author" style="width: 150%;" value="킹받네" />
                	
            </td>
        </tr>
        <tr>
            <td>책 이미지</td>
            <td>
            	<input type="file" name="bookImg" />
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type="submit">작성 완료</button>
                <button type="reset">다시 입력</button>
                <button type="button">목록 보기</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>