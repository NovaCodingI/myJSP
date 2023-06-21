<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function validateForm(form){
		if (form.name.value == ''){
			alert("작성자를 입력하세요");
			form.name.focus();
			return false;
		}
		
		if (form.title.value == ''){
			alert("제목을 입력하세요");
			form.title.focus();
			return false;
		}
		
		if (form.attachedFile.value == ''){
			alert("첨부파일은 필수 입력 입니다.");
			return false;
		}
		
		if(document.querySelectorAll("[name=category]:checked").length == 0){
			alert("카테고리를 선택 해주세요");
			return false;
		}
		
		alert(form.name.value);
		alert(form.attachedFile.value);
		alert(form.categoryArr.value);
		return false;
	}
</script>
</head>
<body>

	<h3>파일 업로드</h3>
	
	<!-- 
	
	파일을 업로드
	라이브러리(cos.jar) 추가 후 form태그의 속성을 설정
	
	<< form 태그의 속성을 설정 >>
		method	: post
		enctype	: multipart/form-data 
	
	 -->
	 
	 <!-- 
	 유효성검사, validatetion 체크
	 사용자입력체크 로직 추가-->
	 ${ errorMessage }
	<form action="UploadProcess2.jsp"
			method="post"
			enctype="multipart/form-data"
			onsubmit="return validateForm(this);">
			<!-- return false 하면 기본이벤트 더이상 실행되지 않음-->
		<p>
			작성자 : <input type="text" name="name" value="하니">
		</p>
		<p>
			제목 : <input type="text" name="title" value="제목">
		</p>
		<p>
			카테고리 :
			<input type="checkbox" name="category" value="사진" checked>사진
			<input type="checkbox" name="category" value="과제">과제
			<input type="checkbox" name="category" value="워드">워드
			<input type="checkbox" name="category" value="음원">음원
		</p>
		<p>
			<!-- multiple="multiple" 여러개 선택할수있는 속성입니다. -->
			첨부파일	: <input type="file" name="attachedFile" multiple="multiple">
		</p>

		<input type="submit" value="전송하기">
	</form>
	
	<!-- enctype : form 값을 서버로 전송할때의 인코딩 방식을 지정
	
			- application/x-www-form-urlencoded (기본값)
				모든 문자를 서버로 전송하기 전에 인코딩 합니다.
			- multipart/form-data
				<form>태그를 통해 파일을 서버로 전송할 때 사용 합니다.
				모든 문자를 인코딩 하지 않습니다.
	-->
	
	<h3>다운로드</h3>
	<!-- 절대경로는 / 컨텍스트 루트가 앞에 들어가야해요 -->
	<!-- 영문이나 숫자가 파일명이면 문제가 없지만 한글일때는 문제가 되므로 저장할 파일명을 넣어줘야합니다. download="" -->
	<!-- download="파일명" 파일명.png로 파일이 다운로드 된것을 확인 할 수 있습니다. -->
	<a href="${ pageContext.request.contextPath }/upload/6. 생성자안에 ctrl space를 누르면 매개변수값이 보입니다.png"
	download="파일명">
	다운로드</a>

</body>
</html>