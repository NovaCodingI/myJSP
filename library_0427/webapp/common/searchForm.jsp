<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 검색폼 --> 
    <form method="get" name='searchForm'>
    
    <!-- 페이지 번호 -->
    <%-- <input type='text' name='pageNo'> --%>
    <input type='hidden' name='pageNo' value="${param.pageNo}" />
    <input type='hidden' name='delNo' />
    <input type='hidden' name='insertNo' />
    <input type="text" id="title" name="title" placeholder="도서명">
	<input type="text" id="author" name="author" placeholder="작가명">
    
    
    <table border="1" width="90%" >
    <tr>
        <td align="center">
            <select name="searchField">
                <option value="title" ${ param.searchField eq "title" ? "selected" : ""} >도서명</option>
                
                <option value="author" ${ param.searchField eq "author" ? "selected" : ""} > 작가명 </option>
            </select>
            <input type="text" name="searchWord" value="${param.searchWord}" />
            <input type="submit" value="검색하기" />
        </td>
    </tr>   
    </table>
    </form>

</body>
</html>