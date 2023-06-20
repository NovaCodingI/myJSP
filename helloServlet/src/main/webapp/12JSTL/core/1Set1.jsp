<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Member"%>
<%@page import="java.util.Date"%>
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
	JSTL(JSP Standard Tag Library)
		JSP의 표준태그라이브러리를 이용하면 스클립틀릿을 사용하지 않고 태그를 사용하여
		제어문, 반복문등을 사용 할 수 있습니다
		
		기본태그가 아닌 확장태그 이므로 사용하기 위해서는 별도의 라이브러리가 필요합니다.
		메이븐리파지토리로 접근하여 jstl-1.2.jar파일을 다운로드 받고 lib폴더에 추가합니다.
		
	JSTL 종류
		Core태그 : 변수선언, 조건문/반복문, URL처리
		접두어	:	 c
		
		Formatting 태그 : 숫자, 날짜, 시간 포멧 지정
		접두어	: fmt
		
	JSTL을 사용하는 방법
		1. 라이브러리 추가
		2. taglib 지시어 추가
	 -->
	 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	 
	 <!-- 
	 Core태그
	 변수선언, 조건문, 반복문등을 대체 하는 태그를 제공
	 
	 set		: 변수선언(setAttribute())
	 remove		: 변수제거(removeAttribute())
	 if			: 단일 조건문 처리(else문 없음)
	 choose		: 다중 조건문 처리(when ~ otherwise 태그 이용)
	 forEach	: 반복문 처리
	 forTokens	: 구분자로 분리된 토큰을 처리
	 import		: 외부파일 삽입
	 redirect	: 지정한 경로로 이동(sendRedirect())
	 url		: 경로를 설정
	 out		: 내용을 출력
	 catch		: 예외처리
	 -->
	 
	 <!-- 
	 1. 변수 선언
	 	var		: 변수명
	 	value	: 값
	 	scope	: 저장영역
	 	
	 	*scope : 를 지정하지 않으면 가장 가까운 영역에 표시됩니다.
	 -->
	 
	 <c:set var="directVar" value="100" />
	 <c:set var="elVar" value="${ directVar mod 5 }" />
	 <c:set var="expVar" value="<%=new Date() %>" />
	 <c:set var="betweenVar">변수값 요렇게 설정</c:set>
	 
	 <h4>EL을 이용해 변수 출력</h4>
	 <ul>
	 	<li>directVar : ${ pageScope.directVar }</li>
	 	<li>elVar : ${ elVar }</li>
	 	<li>expVar : ${ expVar }</li>
	 	<li>betweenVar : ${ betweenVar }</li>
	 </ul>
	 
	 <h4>자바빈즈 생성1 - 생성자 사용</h4>
	 <c:set var="personVal1" value='<%=new Member("id", "", "하니", "2023-06-20") %>'
	 							scope="request" />
	 <ul>
		 <li>${ personVal1.id }</li>
		 <!-- 영역을 지정해주지 않으면 페이지영역부터 순서대로 찾아갑니다. -->
		 <li>${ requestScope.personVal1.name }</li>
		 <li>${ personVal1 }</li>
	 </ul>
	 
	 <h3>자바빈즈 생성 후 값을 변경하기</h3>
	 <h4>자바빈즈 생성 2- target, property 사용</h4>
	 <!-- 
	 	자바빈즈 생성 후 값을 변경 해봅시다
	 	target 		: 자바빈즈 변수명
	 	property 	: 자바빈즈 속성명(멤버변수명)
	 	value 		: 값 지정
	 -->
	 
	 <c:set var="personVal2" value='<%=new Member("hani", "", "하니", "2023-06-20") %>'
	 							scope="request" />
	 
	 <ul>
		 <li>변경전 아이디 : ${ personVal2.id }</li>
		 <li>변경전 이름 : ${ requestScope.personVal2.name }</li>
		 <li>${ personVal2 }</li>
	 </ul>
	 
	 <!-- targer은 객체이기 때문에 변수이름이 아니라 EL태그 넣어주면 됩니다. -->
	 <c:set target="${ personVal2 }" property="id" value="hani1234"></c:set>
	 <c:set target="${ personVal2 }" property="name" value="나는대머리독수리다"></c:set>
	 
	 <ul>
		 <li>변경후 아이디 : ${ personVal2.id }</li>
		 <li>변경후 이름 : ${ requestScope.personVal2.name }</li>
		 <li>${ personVal2 }</li>
	 </ul>
	 
	 <h4>List 컬렉션 이용하기</h4>
	 <!-- 서블릿에서 하는거고 -->
	 <%
	 ArrayList<Member> list = new ArrayList<Member>();
	 list.add(new Member("hani", "", "하니", ""));
	 list.add(new Member("nihao", "", "씨에씨에", ""));
	 list.add(new Member("ching", "", "타오", ""));
	 %>
	 <!-- 영역의 객체를 저장하는것을할겁니다 -->
	 <c:set var="pList" value="<%=list %>" scope="request" />
	 <!-- 리스트는 방번호로 가져올수있습니다. -->
	 <ul>
		 <li>아이디 : ${ pList[0].id }</li>
		 <li>이름 : ${ requestScope.pList[0].name }</li>
		 <li>${ pList[0] }</li>
	 </ul>
	 
	 <ul>
		 <li>아이디 : ${ pList[1].id }</li>
		 <li>이름 : ${ requestScope.pList[1].name }</li>
		 <li>${ pList[1] }</li>
	 </ul>
	 
	 <h4>Map 컬렉션 이용하기</h4>
	 <%
	 	Map<String, Member> map = new HashMap<String, Member>();
	 	map.put("pArgs1", new Member("hey", "", "야치", ""));
	 	map.put("pArgs2", new Member("철권", "", "은폴이지", ""));
	 %>
	 <!-- 맵을 저장합시다 저장된맵을 어떠한 영역에 저장해야겠지요? -->
	 <c:set var="map" value="<%=map %>" scope="request" />
	 
	 <ul>
		 <li>아이디 : ${ map.pArgs1.id }</li>
		 <li>이름 : ${ requestScope.map.pArgs1.name }</li>
		 <li>${ map.pArgs1 }</li>
	 </ul>
	 
	 <ul>
		 <li>아이디 : ${ map.pArgs2.id }</li>
		 <li>이름 : ${ requestScope.map.pArgs2.name }</li>
		 <li>${ map.pArgs2 }</li>
	 </ul>
	 
</body>
</html>