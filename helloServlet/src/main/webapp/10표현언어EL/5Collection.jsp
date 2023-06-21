<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="dto.Member"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
		// Object 타입이기때문에 어떤 타입이든지 받아줄 수 있습니다.
		// 리스트 생성 (Object로 지정 → 어떤 타입이든지 저장 가능)
		List<Object> aList = new ArrayList<Object>();
		aList.add("청해진");
		// 객체의 주소값이 출력이 됩니다. dto.Member@66c324d4 주소가 새로고침할때마다 바뀜
		aList.add(new Member("musthave","","익익","2023-06-19"));
		
		// 페이지 영역에 리스트 객체 저장
		pageContext.setAttribute("aList", aList);
		
	%>
	
		<h2>List 컬렉션</h2>
		<ul>
			<li>0번째요소
			<!-- 영역을 지정하지 않았지만 페이지영역에 저장된 aList의 값이 출력  -->
			<p>${aList[0] }</p>
			</li>
			<!-- 객체의 주소값 -->
			<li>1번째요소
			<p>${aList[1] }</p>
			<p>id : ${aList[1].id }</p>
			<p>name : ${aList[1].name }</p>
			</li>
			<!-- 예외가 발생하지 않고 출력되지 않음 -->
			<li>2번째요소
			<p>${aList[2] }</p>
			</li>
		</ul>
		
		<h2>Map 컬렉션</h2>
		<%
			Map<String, String> map = new HashMap<String, String>();
			// key, value
			map.put("한글", "훈이짱구");
			map.put("Eng", "I'm fine");
			
			pageContext.setAttribute("map", map);
		%>
		
		<ul>
			<!-- map은 key값으로 접근 -->
			<li>한글
				<p>${map['한글'] }</p>
				<p>${map["한글"] }</p>
				<!-- 한글은 .으로 접근 불가 -->
				<!-- el코드 주석처리 방법 : 앞에 \를 붙여 줍니다
					오류는 발생하지않지만 작성한형식대로 그대로 출력 됩니다. "문자열처리" -->
				<p>\${map.한글 }</p>
				<p><%=map.get("한글") %></p>
				
				<!-- [org.apache.jasper.JasperException: javax.el.ELException: Failed to parse the expression [ $ { map .한글 }]]을(를) 발생시켰습니다.
					org.apache.el.parser.ParseException: Encountered " <ILLEGAL_CHARACTER> "\ud55c "" at line 1, column 7. -->
				<!-- < p> $ { map. 한글 }< /p> -->
			</li>
			<li>영문
				<p>${map.Eng }</p>
				<p>${map['Eng'] }</p>
				<p>${map["Eng"] }</p>
				<p><%=map.get("Eng") %></p>
			</li>
			<li>Map
				<p>${map }</p>
			</li>
		
		</ul>
</body>
</html>