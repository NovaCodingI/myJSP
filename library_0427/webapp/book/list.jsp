<%@page import="com.library.vo.PageDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="../css/style.css">

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
<script type="text/javascript">
	let message = "${message}";
	if(message != null && "" != message){
		alert(message);
	}

	function deleteBook(){
		// 체크박스가 선택된 요소의 value값을 , 로 연결
		delNoList = document.querySelectorAll("[name=delNo]:checked");
		
		let delNo = "";
		delNoList.forEach((e)=>{
			delNo += e.value + ',';
		});
		
		delNo = delNo.substr(0, delNo.length-1);
		
		console.log("삭제할 번호 : " + delNo);
		
		// 삭제 요청
		searchForm.action = "../book/delete.book";
		searchForm.delNo.value = delNo;
		searchForm.submit();
		
	}
	
	/* 혼자해보다가 안된것
	function insertBook() {
		  let title = document.getElementById("title").value; // 도서명 입력 필드에서 값 가져오기
		  let author = document.getElementById("author").value; // 작가명 입력 필드에서 값 가져오기

		  // 등록 요청
		  let form = document.getElementById("searchForm");
		  form.action = "../book/insert.book";
		  form.title.value = title;
		  form.author.value = author;
		  form.submit();
	}
	*/
</script>
<%@include file="/common/header.jsp" %>
</head>
<body>

<h2>도서목록</h2>
총건수 : ${ map.totalCnt }건
${ list }

<!-- 검색폼 시작 -->
<%@include file="/common/searchForm.jsp" %>
<!-- 검색폼 끝 -->

<!-- 목록출력 -->
<table border='1'>
	<c:if test="${ sessionScope.adminYn eq 'Y' }">
	<tr>
		<td colspan="6" class="center">
		<!-- 어드민 계정인 경우 등록, 삭제 버튼을 출력 -->
		<button onclick="location.href='./write.book'">도서등록</button>
		<button onclick="deleteBook()">도서삭제</button>
		</td>
	</tr>
	</c:if>
	<tr>
		<th></th>
		<th>게시물번호</th>
		<th>도서명</th>
		<th>작가명</th>
		<th>대여여부/반납일</th>
		<th>등록일</th>
	</tr>

<%-- <c:if test="${ empty list } " var="res"> --%>
	<c:if test="${empty map.list}" var="res">
		<td colspan="6" class="center">
			등록된 게시물이 없습니다.
		</td>
	</c:if>
	<c:if test="${ not res }">
<%-- 	<c:forEach items="${ list }" var="book" step="1"> --%>
		<c:forEach items="${ map.list }" var="book" step="1">
			<tr>
				<td class="center">
					<!-- 삭제용 체크박스 -->
					<input type="checkbox" name="delNo" value="${ book.no }">
				</td>
				<td class="center">
				${ book.no }
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
    <!-- 
    페이지블럭 생성 시작
	    - 총 건수 조회
	    - 쿼리수정
	    - form의 이름을 searchForm으로 지정
	    - pageNo 필드를 생성
    -->
	<table border="1" width="90%">
		<tr>
			<td align="center">
				<%@include file="../common/PageNavi.jsp" %>
			</td>
		</tr>
	</table>
	<!-- 페이지블럭 생성 끝-->
<!-- 상세보기 -->

<!-- 등록 -->

<!-- 삭제 -->
</body>
</html>