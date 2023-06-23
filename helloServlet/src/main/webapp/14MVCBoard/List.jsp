<%@page import="model2.mvcboard.Criterion"%>
<%@page import="model2.mvcboard.MVCBoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="model2.mvcboard.MVCBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	// String searchField = request.getParameter("searchField");
	// String searchWord = request.getParameter("searchWord");
	
	// int pageNo = request.getParameter("pageNo") == null ? 1 : Integer.parseInt(request.getParameter("pageNo"));
	
	// Criterion criterion = new Criterion(searchField, searchWord, pageNo);

	// MVCBoardDAO dao = new MVCBoardDAO();
	// int TCnt = dao.getTotalCount(criterion);
	
	// 확인용
	// out.print("총건수 : " + TCnt);
	
	// 페이징 처리O
	// List<MVCBoardDTO> list = dao.getList()
	
%>
</head>

<body>


	
	<h2>MVC 모델2 게시판</h2>
    <h4> 총 게시물 수 : ${ TCnt }</h4>
	<%--
	<c:set var="fileList" value="${ requestScope.list }" />
	--%>
	
	<!-- 검색폼 --> 
    <form method="get" name='searchForm'>
    <!-- 페이지 번호 -->
    <%-- <input type='text' name='pageNo'> --%>
    <input type='hidden' name='pageNo' value="${param.pageNo}" />
    <table border="1" width="90%" >
    <tr>
        <td align="center">
        	<%-- 확인해보기
        	searchField : [${ param.searchField }]
        	비교 결과  : [${ param.searchField eq "content" }]
        	--%> 
            <select name="searchField">
                <option value="title" ${ param.searchField eq "title" ? "selected" : ""} >제목</option> 
                <option value="content" ${ param.searchField eq "content" ? "selected" : ""} > 내용 </option>
            </select>
            <input type="text" name="searchWord" value="${param.searchWord}" />
            <input type="submit" value="검색하기" />
        </td>
    </tr>   
    </table>
    </form>
    
    <!-- 목록 테이블 -->
	<table border="1" width="90%">
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
		
		<%-- 확인용 TEST 오류가 났을때 어디가 빵꾸났는지 확인해보세요
		<c:choose>
			<c:when test="${ 1 > 2 } ">when</c:when>
			<c:otherwise>otherwise</c:otherwise>
		</c:choose>
		 --%>
		
		
		<c:choose>
			<c:when test="${ empty list }">
				<tr>
					<td colspan="10"> 등록된 게시물이 없습니다. </td>
				</tr>
			</c:when>
			<c:otherwise>
				<!-- 게시물 목록 출력 -->
				<c:forEach items="${ list }" var="row" varStatus="loop">
					<tr>
						<td> ${ row.idx }</td>
						<td> ${ row.name }</td>
						<td>
							<a href="../mvcboard/view.do?idx=${ row.idx }">
								${ row.title }
							</a>
						</td>
						<td> ${ row.content }</td>
						<td> ${ row.postdate }</td>
						<td> ${ row.ofile }</td>
						<td> ${ row.sfile }</td>
						<td> ${ row.downcount }</td>
						<td> ${ row.visitcount }</td>
						<td>
						<a href="">[다운로드]</a>
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	
	<!--
		글쓰기 버튼 추가
		글쓰기 버튼 클릭시 글쓰기 페이지로 이동 → 글쓰기 버튼 클릭하면 글등록
	-->
	<table border="1" width="90%">
        <tr align="right">
			<td>
				<%-- /mvcboard/list.do --%>
				<button type="button" onclick="location.href='../mvcboard/write.do'">글쓰기</button>
			</td>
		</tr>
    </table>
    
    <table border="1" width='90%'>
		<tr>
			<td align="center">
				<%@include file="PageNavi.jsp" %>
			</td>
		</tr>
	</table>
	
	<%--
	<jsp:include page="PageNavi.jsp"></jsp:include>
	--%>
</body>
</html>