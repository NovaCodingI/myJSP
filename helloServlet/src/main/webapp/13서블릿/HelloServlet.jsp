<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	표현식 	: <%=request.getAttribute("message") %> <br>
	EL		:${ requestScope.message } <br>

	<!-- ./ : 현재 경로 -->
	<!-- 13서블릿/HelloServlet.do, web.xml에 지정해놓은 경로입니다. -->
	<!-- 이런 url이 호출되면 web.xml에 지정해둔 HelloServlet.jsp 실행되도록 지정해놨어요 -->
	<a href="./HelloServlet.do">HelloServlet.do 바로가기</a> <br>
	<!-- 실행시 서버를 재시작해야합니다 -->
	<a href="${ pageContext.request.contextPath }/13서블릿/AnnotationMapping.do">}AnnotationMapping.do 바로가기</a> <br>
	
</body>
</html>