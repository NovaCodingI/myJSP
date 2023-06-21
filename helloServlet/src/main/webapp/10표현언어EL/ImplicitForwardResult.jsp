<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>각 영역에 저장된 속성 읽기</h2>
	<ul>
		<li>페이지영역 :
			${pageScope.scopeValue }
		</li>
			
		<li>요청영역 :
			${requestScope.scopeValue }
		</li>
		
		<li>세션영역 :
			${sessionScope.scopeValue }
		</li>
		
		<li>어플리케이션영역 :
			${applicationScope.scopeValue }
		</li>
	</ul>
	
	<h2>영역 지정 없이 속성 읽기</h2>
	<ul>
		<p>가장가까운 페이지 영역이 출력되는걸 볼수있습니다. 정말입니다</p>
		<li>${scopeValue }</li>
	</ul>

</body>
</html>