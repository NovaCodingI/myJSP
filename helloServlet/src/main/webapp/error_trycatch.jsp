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
	// 스크립틀리 내부는 자바코드만 작성할수있다 - 참고
	// 파라메터로 넘어온 age를 읽어들여오고 int 변수에 저장해보자
	// 오류 발생 이유는 String 타입이기 때문에
	// int age = request.getParameter("age");
	// try 캐치를 이용하여 소스 안보이게?
	
	try{
	// 사용자의 요청을 담고 있는 객체
	int age = Integer.parseInt(request.getParameter("age"));

	out.print("당신의 나이는" + age + "입니다.");
	} catch(Exception e){
		out.print("예외발생 :" + e.getMessage());
	
%>
	<h1>오류가 발생하였습니다.</h1>
	<p>관리자에게 문의 해주세요<p>
	<%=e.getMessage()%>
	
<%
	}
%>


</body>
</html>