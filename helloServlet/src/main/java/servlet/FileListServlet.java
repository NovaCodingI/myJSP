package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fileupload.FileDao;
import fileupload.FileDto;

// @WebServlet("/12파일업로드/FileList")
// 두개를 매핑하면 서버가 충돌납니다!! 조심하세요!
public class FileListServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setAttribute("FileList", "일단출력해봐");
		
		// 데이터 조회 합니다
		FileDao dao = new FileDao();
		List<FileDto> list = dao.getFileList();
		System.out.print("총건수 : " + list.size());
		
		req.getRequestDispatcher("12파일업로드/FileList.jsp").forward(req, resp);
	
	}
	
	public FileListServlet() {
		// TODO Auto-generated constructor stub
	}

}
