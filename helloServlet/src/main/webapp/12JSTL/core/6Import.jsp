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
	<!-- 
		import : 외부파일을 현재 위치에 삽입
			
			url		: 외부파일 파일 경로
			scope	: 영역
			var		: 변수명
						변수명을 사용하면 선언과 삽입을 분리 할 수 있습니다.
		외부파일에 매개변수 넣기
			- url의 쿼리스트링으로 전달하기
			- c:param 태그를 이용하기
	-->
	
	<c:import url="/6세션/Link.jsp" var="link">
		<c:param name="param1" value="헤더영역" />
	</c:import>
	
	<h4>다른 문서 삽입하기</h4>
	${ link }
	
	<h4>iframe을 이용한 외부자원 삽입하기</h4>
	<!-- 예전에 많이 사용하던방식 요즘엔 별로 안쓰는듯 페이지영역에 내가 지정한 크기만큼 외부자원을 삽입하는것 -->
	<iframe src="../inc/GoldPage.jsp" style="width:100%; height:200px;"></iframe>
	
	<c:set var="iTag">
		i 태그는 <i>기울임</i>을 표현합니다.
	</c:set>
	
	<h4>EL 출력</h4>
	${ iTag }
	<h4>out 태그 기본 사용</h4>
	<!-- out 태그는 문자열처럼.. -->
	<c:out value="${ iTag }"></c:out>
	
	<h4>escapeXml 속성</h4>
	<!-- HTML 태그를 해석하여 마크업이 적용된 상태로 출력 -->
	<c:out value="${ iTag }" escapeXml="false" />
	
	<h4>default 속성</h4>
	<c:out value="${ param.name }" default="이름 없음" />
	<c:out value="" default="빈 문자열도 값입니다."></c:out>
	
	<!--  <%-- --%> 주석을 활용하면 태그와 상관없이 주석처리됩니다 -->
	<%--
	<h4>redirect</h4>
	<!-- request 영역이 공유되지 않고 페이지가 완전히 전환됩니다. >
	<c:set var="requestVar" value="requestTest" scope="request"></c:set>
	<c:redirect url="/12JSTL/inc/OtherPage.jsp">
		<c:param name="param1" value="출판사"></c:param>
		<c:param name="param2" value="골든래빗"></c:param>
	</c:redirect >
	 --%>
	 
	 
 	<h4>redirect</h4>
	request 영역이 공유되지 않고 페이지가 완전히 전환됩니다. >
	<c:set var="requestVar" value="requestTest" scope="request"></c:set>
	<c:redirect url="/12JSTL/inc/OtherPage.jsp">
		<c:param name="param1" value="출판사"></c:param>
		<c:param name="param2" value="골든래빗"></c:param>
	</c:redirect >
	
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
	
	<c:url value="/12JSTL/inc/OtherPage.jsp" var="url"></c:url>
	<a href="${ url }">url 태그를 이용한 바로가기</a>
	
	
</body>
</html>