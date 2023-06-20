<%@page import="java.util.ArrayList"%>
<%@page import="dto.PageDto"%>
<%@page import="dto.Criteria"%>
<%@page import="dto.Board"%>
<%@page import="java.util.List"%>
<%@page import="dao.NewBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
</head>

<%
	// 검색조건
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
	
	// 페이지 번호
	int pageNo = request.getParameter("pageNo") == null ? 1 : Integer.parseInt(request.getParameter("pageNo"));
	
	Criteria criteria = new Criteria(searchField, searchWord, pageNo);
	
	NewBoardDao dao = new NewBoardDao();
	int totalCnt = dao.getTotalCnt(criteria);
	
	// 확인용
	out.print("총건수 : " + totalCnt);
	
	
	// The method getList() in the type NewBoardDao is not applicable for the arguments (Criteria)
	// public List<Board> getList(Criteria criteria){ 매개변수로 Criteria criteria를 받아준다
		
	// 페이징 처리X
	// List<Board> list = dao.getList(criteria);
	
	// 페이징 처리O
	List<Board> list = dao.getListPage(criteria);
	
	
	
%>
<body>
<!-- 
 / 	: 절대경로
../ : 상위폴더
 -->
<%@include file="../../6세션/Link.jsp" %>
	<h1>new</h1>
    <h2>목록 보기(List)</h2>
    <!-- 검색폼 --> 
    <form method="get" name='searchForm'>
    <input type='text' name='pageNo' value='<%=criteria.getPageNo()%>'> 
    <table border="1" width="90%">
    <tr>
        <td align="center">
            <select name="searchField"> 
                <option value="title">제목</option> 
                <option value="content">내용</option>
            </select>
            <input type="text" name="searchWord" />
            <input type="submit" value="검색하기" />
        </td>
    </tr>   
    </table>
    </form>
    <!-- 게시물 목록 테이블(표) --> 
    <table border="1" width="90%">
        <!-- 각 칼럼의 이름 --> 
        <tr>
            <th width="10%">번호</th>
            <th width="50%">제목</th>
            <th width="15%">작성자</th>
            <th width="10%">조회수</th>
            <th width="15%">작성일</th>
        </tr>
        <!-- 목록의 내용 -->
        <!-- EL에서 사용하기 위해 변수 페이지영역에 저장-->
        <c:set var="list" value="<%=list %>" />
        
        <!-- 리스트가 비었는지 확인 -->
        <c:if test="${ empty list }" var="res">
        	<tr>
        		<td colspan="5" align="center">게시물이 없습니다.</td>
        	</tr>
        </c:if>
        
        <!-- 리스트가 비어 있지 않다면, 리스트를 출력 -->
        <c:if test="${ not res }">
        	<!--  반복문을 통해 리스트에 담긴 board객체를 출력
        			items : 향상된 for문, items에 있는 모든 객체를 생성합니다.
        	 -->
	        <c:forEach items="${ list }" var="board">
	        	<tr align="center">
		            <td>${ board.num }</td>  <!--게시물 번호-->
		            <td align="left">  <!--제목(+ 하이퍼링크)-->
		                <a href="View.jsp?num=${ board.num }&pageNo=<%=criteria.getPageNo()%>">${ board.title }</a> 
		            </td>
		            <td align="center">${ board.id }</td>          <!--작성자 아이디-->
		            <td align="center">${ board.viscount }</td>  <!--조회수-->
		            <td align="center">${ board.postdate }</td>    <!--작성일-->
	        	</tr>
	        </c:forEach>
        </c:if>
		<td><h4>이전내용</h4></td>
		<%
			if(list.isEmpty()){
		%>		
			<tr>
				<td colspan="5" align="center">게시물이 없습니다.</td>
			</tr>		
		<%	
			} else {
				for(Board board : list) {
		%>
        <tr align="center">
            <td><%=board.getNum() %></td>  <!--게시물 번호-->
            <td align="left">  <!--제목(+ 하이퍼링크)-->
                <a href="View.jsp?num=<%=board.getNum()%>&pageNo=<%=criteria.getPageNo()%>"><%=board.getTitle() %></a> 
            </td>
            <td align="center"><%=board.getId() %></td>          <!--작성자 아이디-->
            <td align="center"><%=board.getViscount() %></td>  <!--조회수-->
            <td align="center"><%=board.getPostdate() %></td>    <!--작성일-->
        </tr>
        <%
				}
			}
        %>
    </table>
    <!--목록 하단의 [글쓰기] 버튼-->
    <!-- { UserId } 만 입력하면 페이지영역에서부터 찾아오기때문에 확실한 영역을 설정해주는것이 좋다 -->
    <!-- id : $-- { sessionScope.UserId }  확인용 출력 -->
    <c:if test="${ not empty sessionScope.UserId }">
    	<table border="1" width="90%">
	        <tr align="right">
	            <td><button type="button" onclick="location.href='Write.jsp'">글쓰기</button></td>
	        </tr>
   		</table>
    </c:if>
    <h4>이전내용 br 기준</h4>
    <br>
    <%
    if(session.getAttribute("UserId") != null
    	&& !"".equals(session.getAttribute("UserId"))){
    %>
    <table border="1" width="90%">
        <tr align="right">
            <td><button type="button" onclick="location.href='Write.jsp'">글쓰기</button></td>
        </tr>
    </table>
    <%} %>
    <br>
    <!-- 페이지블럭 생성 시작
    	- 총건수
    	- 쿼리수정
    	- form이 submit 될 수 있도록 form의 이름을 searchForm으로 지정하고
    	- pageNo 필드를 생성
   	-->
    <%
    	PageDto pageDto = new PageDto(totalCnt, criteria);
    %>
    <table border="1" width='90%'>
	<tr>
		<td align="center">
			<%@include file="../../9페이지/PageNavi.jsp" %>
		</td>
	</tr>
</table>
</body>
</html>
