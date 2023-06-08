<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Arrays"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	// 한글깨짐처리 => web.xml에서 설정파일에서 설정
	// 필터 한번에 일괄적으로 처리가 가능함!
	request.setCharacterEncoding("UTF-8");

	// 사용자가 요청한 값을 받아오는 getParameter
	String id = request.getParameter("id");
	String sex = request.getParameter("sex");
	// String favo = request.getParameter("favo"); // 하나씩 밖에 안됌
	// 배열로 전송이 되었나요? 체크박스는 여러개의 값을 받아오기때문에 배열의 형태로 받아와야합니다.
	String[] favo = request.getParameterValues("favo");
	String intro = request.getParameter("intro");
	String favoStr = "";
	//out.print(Arrays.toString(favo));
%>
<ul>
	<li>아이디 : <%= id %></li>
	<li>성별 : <%= sex %></li>
	<li>관심사항 : <%=Arrays.toString(favo) %></li>
	<!-- 줄바꿈처리 -->
	<li>자기소개 : <%= intro.replace("\r\n", "<br>") %></li>
</ul>
</body>
</html>