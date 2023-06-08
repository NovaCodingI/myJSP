<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PageLocation</title>
</head>
<body>
	<h1>페이지 이동 후 page영역의 속성값 읽기</h1>
	<%
		// 형변환 NullPointException 때문에 담아주는거겠죠?
		// Object page_str = pageContext.getAttribute("page").toString(); 에러남
		Object page_str = pageContext.getAttribute("page");
		Object page_int = pageContext.getAttribute("page_int");
		Object pagePerson = pageContext.getAttribute("pagePerson");
		
		
	%>
	
	<ul>
		<li> int :
			<%= (page_int == null)? "값 없음":page_int %>
		</li>
		<li> String :
			<%= (page_str == null)? "값 없음":page_str %>
		</li>
		<li> person :
			<%= (pagePerson == null)? "값 없음":pagePerson %>
		</li>
	</ul>
</body>
</html>