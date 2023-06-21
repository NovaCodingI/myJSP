<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
	formatNumber
		var		: 변수명 (변수명을 지정하지 않으면 바로 출력)
		value	: 출력할 숫자
		pattern	: 숫자패턴
		scope	: 영역
		
		type	: 출력양식을 설정
			- percent	: 퍼센트 (% 단위가 1기준 100%   ex)100 10,000%)
			- currency	: 통화 (￦)
			- number	: 기본값, 일반숫자
			
		groupingUsed	: 구분기호 사용여부 (콤마)
	 -->
	 
	 <c:set var="num" value="12345" />
	
	<h4>숫자 포맷 설정</h4> 
	콤마 출력		: <fmt:formatNumber value="${ num }" /> <br>
	콤마 출력 안함	: <fmt:formatNumber value="${ num }" groupingUsed="flase" /> <br>
	
	변수에 저장 			: <fmt:formatNumber value="${ num }" var="saveVar" type="currency" /> <br>
	변수에 저장된 값 출력		: ${ saveVar } <br>
	
	퍼센트		: <fmt:formatNumber value="0.03" type="percent" /> <br>
	
	<h4>패턴을 지정하여 숫자를 활용</h4>
	<c:set var="num1" value="12345.0111" />
	0, # 자릿수를 의미 <br>
	0표현		: 자리에 수가 없으면 0으로 표시 - 자리수를 맞춰서 출력 하고 싶을때 <br>
	#표현		: 자리에 수가 없으면 공란으로 표시 <br>
	
	<fmt:formatNumber value="${ num1 }" /> <br>
	<fmt:formatNumber value="${ num1 }" pattern="0,00.0" /> <br>
	<fmt:formatNumber value="${ num1 }" pattern="0,000,00.0" /> <br>
	<fmt:formatNumber value="${ num1 }" pattern="#,###.##" /> <br>
	<fmt:formatNumber value="${ num1 }" pattern="###,###.0000000" /> <br>
	
	<!-- 정수부분만 출력하게끔 -->
	<fmt:parseNumber value="${ num1 }" integerOnly="true" var="saveVar" /> <br>
	정수 부분만		: ${ saveVar } <br>
	
	<h4>날짜 포멧</h4>
	<c:set var="today" value="<%=new java.util.Date() %>" /> <!-- import를 원치 않으면 앞의 경로까지 적어주면 됩니다. -->
	<c:set var="today" value="<%=new Date() %>" />
	오늘 날짜		: ${ today } <br>
	
	<fmt:formatDate value="${ today }" type="date" dateStyle="full"/> <br>
	<fmt:formatDate value="${ today }" type="date" dateStyle="short"/> <br>
	<fmt:formatDate value="${ today }" type="date" dateStyle="long"/> <br>
	<fmt:formatDate value="${ today }" type="date" dateStyle="default"/> <br>
	<fmt:formatDate value="${ today }" type="date" dateStyle="medium"/> <br>
	
	<h4>시간 포멧</h4>
	<fmt:formatDate value="${ today }" type="time" timeStyle="full"/> <br>
	<fmt:formatDate value="${ today }" type="time" timeStyle="short"/> <br>
	<fmt:formatDate value="${ today }" type="time" timeStyle="long"/> <br>
	<fmt:formatDate value="${ today }" type="time" timeStyle="default"/> <br>
	<fmt:formatDate value="${ today }" type="time" timeStyle="medium"/> <br>
	
	<h4>날짜/시간 표시</h4>
	<fmt:formatDate value="${ today }" type="both" dateStyle="full" timeStyle="full"/> <br>
	
	<h4>pattern 지정 후 출력</h4>
	<fmt:formatDate value="${ today }" type="both" pattern="yyyy-MM-dd hh:mm:ss EEEE" /> <br>
	
	<h4>타임존 설정</h4>
	<fmt:timeZone value="GMT">
		협정세계시		: <fmt:formatDate value="${ today }" type="both" pattern="yyyy-MM-dd hh:mm:ss EEEE" /> <br>
	</fmt:timeZone>
	<fmt:timeZone value="America/Chicago">
		미국 			: <fmt:formatDate value="${ today }" type="both" pattern="yyyy-MM-dd hh:mm:ss EEEE" /> <br>
	</fmt:timeZone>
	
	<h4>로케일 설정</h4>
	<c:set var="today" value="<%= new java.util.Date() %>" />
	
	한글로 설정		: <fmt:setLocale value="ko_kr" />
	<fmt:formatNumber value="10000" type="currency" /> /
	<fmt:formatDate value="${ today }" /> <br />
	
	일어로 설정		: <fmt:setLocale value="ja_JP" />
	<fmt:formatNumber value="10000" type="currency" /> /
	<fmt:formatDate value="${ today }" /> <br />
	
	영어로 설정		: <fmt:setLocale value="en_US" />
	<fmt:formatNumber value="10000" type="currency" /> /
	<fmt:formatDate value="${ today }" /> <br />
	
	
</body>
</html>