<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Enumeration"%>
<%@page import="common.JSFunction"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="fileupload.FileDao"%>
<%@page import="fileupload.FileDto"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
    // 저장할 디렉토리의 실제 경로
    String saveDirectory = "C:/upload";

    // 파일의 최대 크기 (10MB)
    int maxPostSize = 1024 * 1000 * 10;

    // 인코딩 방식
    String encoding = "utf-8";

    try {
        // MultipartRequest 객체 생성
        MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding);

        // 파일 목록을 배열로 받아옴
        Enumeration<String> fileNames = mr.getFileNames();
        List<FileDto> fileList = new ArrayList<>(); // 파일 목록을 저장할 리스트 생성

        // 파일을 하나씩 처리
        while (fileNames.hasMoreElements()) {
            String inputName = fileNames.nextElement(); // input 태그의 이름
            File file = mr.getFile(inputName); // 파일 객체 가져오기

            // 파일이 존재하면 처리
            if (file != null) {
                String fileName = file.getName(); // 파일명

                // 새로운 파일명 생성
                String ext = fileName.substring(fileName.lastIndexOf("."));
                String now = new SimpleDateFormat("yyyyMMdd_HHmmssSSS").format(new Date());
                String newFileName = now + ext;

                // 파일 이동
                File newFile = new File(saveDirectory, newFileName);
                file.renameTo(newFile);

                // 폼 요소의 값을 저장
                String name = mr.getParameter("name");
                String title = mr.getParameter("title");
                // 체크박스인 경우, 배열로 반환 받아서 문자열로 연결해서 저장
                String[] categoryArr = mr.getParameterValues("category");
                
                StringBuffer sb = new StringBuffer();
                if (categoryArr == null) {
                    sb.append("선택없음");
                } else {
                    for (String category : categoryArr) {
                        sb.append(category + ", ");
                    }
                }

                // 파일 DTO 생성 및 리스트에 추가
                FileDto dto = new FileDto("", name, title, sb.toString(), fileName, newFileName, "");
                fileList.add(dto);
            }
        }

        // 파일 목록을 데이터베이스에 등록
        FileDao fileDao = new FileDao();
        for (FileDto dto : fileList) {
            fileDao.insertFile(dto);
        }

        // 파일 등록 완료 후 처리할 로직 작성

        JSFunction.alertLocation("등록되었습니다.", "FileList.jsp", out); // 등록 성공 시
        } catch (Exception e) {
            e.printStackTrace();
        JSFunction.alertBack("등록에 실패 하였습니다. 관리자에게 문의해주세요.", out); // 업로드 실패 시 이동할 페이지
        }
    %>
</body>
</html>
        