<%@page import="java.net.URLEncoder"%>
<%@page import="fileupload.FileDto"%>
<%@page import="fileupload.FileDao"%>
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
	<h2>DB에 등록된 파일 목록 보기</h2>
	<a href="FileUpload.jsp">파일 등록하기</a> <br>
	
	<%
		// 데이터 조회 합니다
		FileDao dao = new FileDao();
		List<FileDto> list = dao.getFileList();
		out.print("총건수 : " + list.size());
	%>
	<!-- 자바빈을 표현언어에서 사용하기 위해 변수로 선언 -->
	<!-- jstl을 사용한 방법 -->
	<!-- 변수이름을 잘 확인해서 items에 넣어주세요 -->
	<c:set var="fileList" value="<%=list %>" />
	
	<table border="1">
		<tr>
			<th>No</th>
			<th>작성자</th>
			<th>제목</th>
			<th>카테고리</th>
			<th>원본 파일명</th>
			<th>저장된 파일명</th>
			<th>작성일</th>
			<th>다운로드</th>
		</tr>
		
		<c:forEach items="${ fileList }" var="fileDto" >
			<tr>
				<td>${ fileDto.idx }</td>
				<td>${ fileDto.name }</td>
				<td>${ fileDto.title }</td>
				<td>${ fileDto.cate }</td>
				<td>${ fileDto.ofile }</td>
				<td>${ fileDto.sfile }</td>			
				<td>${ fileDto.postdate }</td>
				<!-- 원본이름을 알면 원본이름으로 다운로드 할수있게 해줍니다.
				원본이름, 변경된 파일명 모두 가져옵니다. -->
				<td>
					<a href="Download.jsp?oName=${ fileDto.ofile }&sName=${ fileDto.sfile }">다운로드</a>
				</td>
				<%--
				<td><a href="${ pageContext.request.contextPath }/upload/${ fileDto.sfile }"
				 	download="${ fileDto.sfile }">
					[다운로드]</a>
				</td>
				 --%>		
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>