<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="/common/header.jsp" %>

<h2>도서목록</h2>
총건수 : 00건
${ list }
<!-- 검색폼 시작 -->
<%@include file="/common/searchForm.jsp" %>
<!-- 검색폼 끝 -->

<!-- 목록출력 -->
<table border='1'>
	<c:if test="${ sessionScope.adminYn eq 'Y' }">
	<tr>
		<td colspan="5" class="right">
		<!-- 어드민 계정인 경우 등록, 삭제 버튼을 출력 -->
		<button>도서등록</button>
		<button>도서삭제</button>
		</td>
	</tr>
	</c:if>
	<tr>
		<th></th>
		<th>제목</th>
		<th>저자</th>
		<th>대여여부/반납일</th>
		<th>등록일</th>
	</tr>
	
	<c:if test="${ empty list } " var="res">
		<td colspan="5" class="center">
			등록된 게시물이 없습니다.
		</td>
	</c:if>
	<c:if test="${ not res }">
		<c:forEach items="${ list }" var="book" step="1">
			<tr>
				<td class="center">
					<!-- 삭제용 체크박스 -->
					<input type="checkbox" name="delNo" value="${ book.no }">
				</td>
				<td>
					<a href="../book/view.book?no=${ book.no }">
						${ book.title }
					</a>
				</td>
				<td>${ book.author }</td>
				<td>${ book.rentyn }</td>
			</tr>
		</c:forEach>	
	</c:if>	
	
</table>

<!-- 페이징 -->
<table border="1" width='90%'>
		<tr>
			<td align="center">
			</td>
		</tr>
	</table>
<!-- 상세보기 -->

<!-- 등록 -->

<!-- 삭제 -->
</body>
</html>