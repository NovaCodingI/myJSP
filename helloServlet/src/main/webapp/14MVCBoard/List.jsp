<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h2>MVC 모델2 게시판</h2>
	<%--
	<c:set var="fileList" value="${ requestScope.list }" />
	--%>
	<table border="1">
		<tr>
			<th>No</th>
			<th>작성자</th>
			<th>제목</th>
			<th>내용</th>
			<th>작성일</th>
			<th>원본 파일명</th>
			<th>저장된 파일명</th>
			<th>다운로드 횟수</th>
			<th>조회수</th>
			<th>다운로드</th>
		</tr>
		
		<c:forEach items="${ list }" var="row" varStatus="loop">
			<tr>
				<td> ${ row.idx }</td>
				<td> ${ row.name }</td>
				<td> ${ row.title }</td>
				<td> ${ row.content }</td>
				<td> ${ row.postdate }</td>
				<td> ${ row.ofile }</td>
				<td> ${ row.sfile }</td>
				<td> ${ row.downcount }</td>
				<td> ${ row.visitcount }</td>
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>