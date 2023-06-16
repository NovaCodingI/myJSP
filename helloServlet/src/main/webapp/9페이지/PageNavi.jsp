<%@page import="dto.Criteria"%>
<%@page import="dto.PageDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	PageDto객체를 가지고 페이지 블럭을 생성
	- 페이지블럭의 시작번호
	- 페이지블럭의 끝번호
	- 게시물의 끝 페이지 번호
	- 이전 버튼을 출력할지 여부 (boolean 타입)
	- 다음 버튼을 출력할지 여부 (boolean 타입)
-->
<%
	/*
	// 매개변수를 넣어주세요
	// 총 게시물 수, 검색조건(페이지번호, 페이지당게시물수, 검색어, 검색조건)
	int pageNo = request.getParameter("pageNo") == null ? 1 : Integer.parseInt(request.getParameter("pageNo"));
	
	// totalCnt, pageNo를 세팅 해줘야함!!!!!!!!!!!!
	int totalCnt = 306;

	Criteria criteria = new Criteria(pageNo);

	// totalCnt, criteria 매개변수의 값을 가지고 페이지블록을 그려줍니다.
	PageDto pageDto = new PageDto(totalCnt, criteria);
	*/
	
	// 공통으로 사용하는 PageNavi인데 href=를 사용하여 페이지를 전환하게 되면
	// 공용으로 사용하는데 있어 어려움이 있다
	
	
	if(pageDto.isPrev()){
		// 시작페이지번호가 1보다 큰경우 이전버튼을 출력
		// 태그를 링크로 가져가게되면 검색어 할때 불편합니다.
		out.print("<a href='List.jsp?pageNo="+(pageDto.getStartNo()-1)+"'>");
		out.print("<");
		out.print(" </a>");
	}
	for(int i = pageDto.getStartNo(); i<= pageDto.getEndNo(); i++){
		out.print("<a href='List.jsp?pageNo="+i+"'>");
		out.print( i );
		out.print(" </a>");
	}
	if(pageDto.isNext()){
		// 마지막페이지번호가 게시물의 끝페이지 번호와 일치하지 않으면
		out.print("<a href='List.jsp?pageNo="+(pageDto.getEndNo()+1)+"'>");
		out.print(">");
		out.print(" </a>");
	}

	
%>
</body>
</html>