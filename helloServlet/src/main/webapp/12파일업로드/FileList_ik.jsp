<%@page import="fileupload.FileDto"%>
<%@page import="java.util.List"%>
<%@page import="fileupload.FileDao"%>
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
	FileDao dao = new FileDao();
	List<FileDto> list = dao.getFileList();
%>

	
첨부파일	: <input type="file" name="attachedFile" multiple="multiple">
<h2>DB에 등록된 파일 목록 보기</h2>
<form action="파일을 처리할 JSP 페이지 URL" method="post" enctype="multipart/form-data">
    <!-- 파일 업로드를 위한 입력 필드 -->
    <input type="file" name="uploadedFile">
    <!-- 기타 필드 및 버튼 등 -->
    <input type="submit" value="파일 등록하기">
</form>
    <!-- 게시물 목록 테이블(표) --> 
    <table border="1" width="90%">
        <!-- 각 칼럼의 이름 --> 
        <tr>
            <th width="5%">No</th>
            <th width="5%">작성자</th>
            <th width="5%">제목</th>
            <th width="10%">카테고리</th>
            <th width="15%">원본 파일명</th>
            <th width="20%">저장된 파일명</th>
            <th width="15%">작성일</th>
            <th width="10%">다운로드</th>
        </tr>
        <!-- 목록의 내용 --> 
		<%
			if(list.isEmpty()){
		%>		
			<tr>
				<td colspan="5" align="center">게시물이 없습니다.</td>
			</tr>		
		<%	
			} else {
				for(FileDto fileDto : list) {
		%>
        <tr align="center">
            <td align="center"><%=fileDto.getIdx() %></td>  		<!-- No -->
            <td align="center"><%=fileDto.getName() %></td>			<!-- 작성자 -->
            <td align="center"><%=fileDto.getTitle() %></td>        <!-- 제목 -->
            <td align="center"><%=fileDto.getCate() %></td>  		<!-- 카테고리 -->
            <td align="center"><%=fileDto.getOfile() %></td>   		<!-- 원본 파일명 -->
            <td align="center"><%=fileDto.getSfile() %></td>   		<!-- 저장된 파일명 -->
            <td align="center"><%=fileDto.getPostdate() %></td>   	<!-- 작성일 -->
            <td align="center">
            <a href="${ pageContext.request.contextPath }/upload/<%=fileDto.getSfile() %>"
			 download="<%=fileDto.getSfile() %>">
			[다운로드]</a>
            </td>   												<!-- 다운로드 -->
        </tr>
        <%
				}
			}
        %>

    </table>

</body>
</html>