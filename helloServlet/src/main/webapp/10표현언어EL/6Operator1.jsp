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
		int num1 = 3;
		pageContext.setAttribute("num2", 4);
		pageContext.setAttribute("num3", "5");
		pageContext.setAttribute("num4", "8");
		
		// 스클립틀릿에서 선언한 변수는 EL 에서 사용할 수 없습니다.
	%>


	<h3>변수 선언 및 할당</h3>
	<!-- num1은 4개의 영역에 저장되지 않았으므로 출력되지 않습니다. -->
	<p>스크립틀릿에서 선언한 변수 : ${num1 }</p>
	<p>페이지 영역에 저장된 변수 : ${num2 }</p>
	<p>페이지 영역에 저장된 변수 : ${num3 }</p>
	<p>페이지 영역에 저장된 변수 : ${num4 }</p>
	
	<!-- 초기에 EL에서는 사용이 불가했었습니다. -->
	<!-- EL 3.0 부터 대입연산자(=)를 이용하여 값을 대입 할 수 있다 -->
	<!-- 값을 대입 후 출력, 대입과 동시에 출력이 가능합니다. -->
	<p>변수 할당 및 즉시출력 : ${num1 = 7 }</p>
	
	<!-- 값을 대입하고 출력하지 않음 -->
	<p>변수 할당 및 별도출력 : ${num2 = 8;'' }</p>
	<p>변수 할당 및 별도출력 : ${num2 = 8;'' } → ${num2 }</p>
	<p>${num2 }</p>
	
	num1 = ${num1 }, num2 = ${num2 }, num3 = ${num3 }, num4 = ${num4 }
	
	<h3>산술 연산자</h3>
	
	<!-- 표현언어(EL)을 이용하면 산술연산시 자동으로 숫자로 변환 -->
	num1 + num2 = ${num1+num2 }<br>
	num1 - num2 = ${num1-num2 }<br>
	num1 * num2 = ${num1*num2 }<br>
	num1 / num2 = ${num1/num2 }<br>
	<br>
	<!-- div : 나누기 (문자 형태의 연산자) -->
	num3 / num4 : ${num3 / num4 }<br>
	num3 div num4 : ${num3 div num4 }<br>
	<!-- mod : 나머지 (문자 형태의 연산자) -->
	num3 % num4 : ${num3 % num4 }<br>
	num3 mod num4 : ${num3 mod num4 }<br>
	
	<h3>+ 연산자는 덧셈만 가능</h3>
	<!-- 숫자의 연산만 가능!! -->
	num1 + "34" : ${num1 + "34" }<br>
	num2 + "이십" : \${num2 + "이십" } <!-- 에러 발생(주석 처리) --> <br /> 
	
	<h3>비교 연산자</h3>
	<!-- 문자 형태의 연산자 -->
	num4 > num3 : ${ num4 gt num3 } <br />
	num1 < num3 : ${ num1 lt num3 } <br />
	num2 >= num4 : ${ num2 ge num4 } <br />
	<!-- 문자형태의 연산자를 사용하여 코드를 좀 더 직관적으로 작성 할 수 있다 -->
	num1 == num4 : ${ num1 eq num4 } <br />
	
	<h3>논리 연산자</h3>
	num3 <= num4 && num3 == num4 : ${ num3 le num4 and num3 eq num4 } <br />
	num3 >= num4 || num3 != num4 : ${ num3 ge num4 or num3 ne num4 } <br />
	<!-- 통상적으로 단독으로 쓰기보다는 태그 라이브러리와 함께 사용됩니다. -->
	
	
	
	
	
</body>
</html>