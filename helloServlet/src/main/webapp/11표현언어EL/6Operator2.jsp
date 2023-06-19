<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 출력하기 위해서는 어떤 영역에 있어야함.
	pageContext.setAttribute("num1", 9);
	pageContext.setAttribute("num2", "10");
	
	// empty 연산자
	// null, 빈문자열, 길이가 0인배열, 사이즈가 0인 컬렉션 인 경우 true를 반환
	pageContext.setAttribute("nullStr", null);
	pageContext.setAttribute("emptyStr", "");
	pageContext.setAttribute("lengthZero", new Integer[0]);
	pageContext.setAttribute("sizeZero", new ArrayList());
	
%>

<h2>empty 연산자</h2>
<!-- 주로 리스트 출력시 리스트가 비었는지 확인하는 용도로 사용 -->
empty nullStr 		: ${empty nullSrt } 	<br>
empty emptyStr 		: ${empty emptySrt } 	<br>
empty lengthZero 	: ${empty lengthZero } 	<br>
empty sizeZero 		: ${empty sizeZero } 	<br>
empty num1 			: ${empty num1 } 	<br>

<h3>삼항 연산자</h3>
	<!-- 조건 ? "true" : "false" -->
	num1 gt num2 : ${ num1 gt num2 ? "num1이 크다" : "num2가 크다" }
	
<h3>null 연산</h3>
	<!-- null이 연산에 사용될 경우 0으로 인식 -->
	${null + 10 } <br>
	${nullStr + 10}	<br>
	
	${param.noVar > 10} <br>
	${param.noVar < 10} <br>
	<!-- 비교 연산시 null을 0으로 판단하는것이 아니라 null과의 연산은 0으로 간주하지 않습니다. -->
	${param.noVar == null} // 변수가 null인지 확인
	${param.noVar == undefined} // 변수가 정의되지 않았는지 확인
	

</body>
</html>