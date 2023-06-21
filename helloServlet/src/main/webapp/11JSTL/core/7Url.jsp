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

	<h4>url태그를 이용해서 링크 걸기</h4>
	<!-- 
		c:URL
		지정한 경로와 매개변수를 이용해서 컨텍스트루트를 포함한 URL을 생성 합니다.
		a태그의 href속성이나 form 태그의 action속성에 이용할 수 있습니다.
		
		value	: 경로
		var		: 변수명
		
	-->
	<!-- 내가 선언해놓은 값에 url이라고 사용할꺼야 -->
	<a href="/12JSTL/inc/OtherPage.jsp">페이지 바로가기</a>
	
	<c:url value="/12JSTL/inc/OtherPage.jsp" var="url"></c:url> <br>
	<a href="${ url }">url 태그를 이용한 바로가기</a> <br>
	
	<form action="${ url }">
		<button>전송</button>
	</form>
	
	<h4>예외처리</h4>
	<!-- 
		c:catch 태그
			예외가 발생하면 지정한 변수에 에러메세지가 저장되어 전달
	-->
	
	<%
		int num1 = 100;
	%>
	<%--
	<!-- 예외 [java.lang.ArithmeticException: / by zero]을(를) 발생시켰습니다. -->
	<%
		int res = num1/0;
	%>
	 --%>
	<c:catch var="eMessage">
		<%
			int res = num1/0;
		%>
	</c:catch>
	
	예외내용 : ${ eMessage }
	
	<h4>EL에서의 예외</h4>
	<!-- 문자와 함께연산될경우에는 오류가 발생할수있습니다 -->
	<c:set var="num2" value="200"></c:set>
	<%-- 파싱이 되지 않기때문에 오류를 발생시킵니다
	${ "일" + num2 } --%>
	
	<c:catch var="eMessage">
	${ "일" + num2 }
	</c:catch> 
	
	예외내용 : ${ eMessage }
</body>
</html>