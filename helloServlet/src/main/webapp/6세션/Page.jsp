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
<script>
	function go(page){
		location.href="Page.jsp?pageNo="+page;
	}
</script>
<%

	int pageNo = request.getParameter("pageNo") == null
					? 1 : Integer.parseInt(request.getParameter("pageNo"));

	// Criteria criteria = new Criteria(2);
	Criteria criteria = new Criteria(pageNo);
	// int total = 55;
	int total = 300;
	// 매개변수 순서 중요합니다. int가 먼저옵니다.
	PageDto pageDto = new PageDto(total, criteria);
	
	
	if(pageDto.isPrev()){
		// 1페이지 블럭
		out.print("<input type='button' value='<<'" 
						+ "onclick='go(1)'>");
		// 이전 페이지 블럭
		out.print("<input type='button' value='<'" 
						+ "onclick='go("+(pageDto.getStartNo()-1)+")'>");
	}
	for(int i = pageDto.getStartNo(); i<=pageDto.getEndNo(); i++){
		// 클릭한 번호의 페이지로 이동
		out.print("<input type='button' value='"+i+"' onclick='go("+i+")'>");
	}
	if(pageDto.isNext()){
		// 이후 페이지 블럭
		out.print("<input type='button' value='>'"
						+ "onclick='go("+(pageDto.getEndNo()+1)+")'>");
		// 마지막 페이지 블럭
		out.print("<input type='button' value='>>'"
						+ "onclick='go("+(pageDto.getRealEnd())+")'>");
	}
%>
</body>
</html>