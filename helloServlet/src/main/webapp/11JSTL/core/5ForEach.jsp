<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="dto.Member"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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

<h4>일반 for문 형태의 forEach문</h4>
	<!-- 
	forEach 태그를 활용한 반복문
		begin	: 시작값
		end		: 종료값
		step	: 증가값
		var		: 변수
	-->
	<%
		for(int i=2;i<=10;i++){
			System.out.println("반복 "+ i + "입니다.");
		}
	%>
	<c:forEach begin="2" end="2" step="2" var="i">
		<p>반복 ${ i } 입니다.</p>
	</c:forEach>
	
	<h4>varStatus 속성 살펴보기</h4>
	<!-- 
	varStatus 루프의 현재 상태를 알려주는 변수 이름
		current		: var에 지정한 현재 루프의 변수값
		index		: var에 지정한 현재 루프의 인덱스값
		count		: 실제 반복횟수(1부터 시작)
		first		: 루프의 처음일때 true
		last		: 루프의 마지막일때 true
	-->
	<table border='1'>
	<c:forEach begin="3" end="5" var="i" varStatus="loop" >
		<tr>
			<td>i : ${ i }</td>
			<td>current : ${ loop.current }</td>
			<td>index : ${ loop.index }</td>
			<td>count : ${ loop.count }</td>
			<td>first : ${ loop.first }</td>
			<td>last : ${ loop.last }</td>
		</tr>
	</c:forEach>
	</table>
	
	<h4>1~100까지 정수중 홀수의 합</h4>

	<c:forEach begin="1" end="100" var="num" >
		<!-- $ { num } <br> -->
		<!-- < c : if test="{ not (num mod 2 eq 0)}"> -->
		<c:if test="${ num mod 2 ne 0 }">
			<c:set var="sum" value="${ sum+num }"></c:set>
		</c:if>
	</c:forEach>
	sum : ${ sum } <br>
	
	<h4>향상된 for문 형태의 forEach 태그</h4>
	<%
		String[] rgba = {"Red", "Green", "Blue", "Black"};
	%>
	
	<!-- items 속성에 배열을 지정하고 변수 이름은 "c"로 입력
		배열을 처음부터 끝까지 돌면서 반복문을 수행	
	-->
	<table border="1">
	<c:forEach items="<%=rgba %>" var="c" varStatus="loop">
		<tr>
			<td><span style="color:${c}">${ c }</span></td>	
			<td>current : ${ loop.current }</td>
			<td>index : ${ loop.index }</td>
			<td>count : ${ loop.count }</td>
			<td>first : ${ loop.first }</td>
			<td>last : ${ loop.last }</td>
		</tr>
	</c:forEach>
	</table>
	
	<h4>List 컬렉션 사용하기</h4>
	<%
		List<Member> list = new ArrayList<Member>();
		list.add(new Member("아아이디", "", "이름입니당", ""));
		list.add(new Member("아더워디", "", "여름입니당", ""));
		list.add(new Member("아춥디디", "", "겨울입니당", ""));
		list.add(new Member("아시원디", "", "가을입니당", ""));
	%>
	
	<c:set var="list" value="<%=list %>"></c:set>
	<!-- 
		items	: 반복을 위한 객체를 지정
		var		: 변수명
	-->
	<c:forEach items="${ list }" var="member">
		<li>아이디 : ${ member.id }</li>
		<li>이름 : ${ member.name }</li>
	</c:forEach>
	
	<h4>Map 컬렉션 사용하기</h4>
	<%
		// String 타입의 key와 Member 타입의 value , Map은 인터페이스입니다.
		// @뒤에 나오는건 메모리주소값
		Map<String, Member> map = new HashMap<String, Member>();
		map.put("1st", new Member("5번", "", "5번이요", ""));
		map.put("2nd", new Member("6번", "", "6번이요", ""));
		map.put("3rd", new Member("7번", "", "7번이요", ""));
		map.put("4rd", new Member("8번", "", "8번이요", ""));
	%>
	<c:set var="map" value="<%=map %>"></c:set>
	<c:forEach items="${ map }" var="map">
		<li> key : ${ map.key } <br>
			 value : ${ map.value } <br>
			 이름 : ${ map.value.name } <br>
			 아이디 : ${ map.value.id } <br>
		</li>
	</c:forEach>
	
	<h4>forTokens 태그 사용</h4>
	<%
		String rgb = "Red, Green, Blue, Black";
	%>
	
	<!-- 
		Token	: 문법적으로 의미 있는 최소단위
				  구분자를 기준으로 문자열을 나눠 토큰의 갯수만큼 반복합니다.
				  
		items	: 문자열(문자열만 사용가능)
		delims 	: 구분자
		var		: 변수명
	-->
	<c:forTokens items="<%=rgb %>" delims="," var="color">
		<span style="color:${ color }">${ color }</span>
	</c:forTokens>
	
</body>
</html>