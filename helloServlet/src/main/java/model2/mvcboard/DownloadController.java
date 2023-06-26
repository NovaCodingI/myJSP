package model2.mvcboard;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.FileUtil;

/**
 * Servlet implementation class DownloadController
 */
@WebServlet("/mvcboard/download.do")
public class DownloadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownloadController() {
        super();
        // TODO Auto-generated constructor stub
    }

    // 링크 기본 값이 get
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println(request.getParameter("ofile"));
		System.out.println(request.getParameter("sfile"));
		
		String ofile = request.getParameter("ofile");
		String sfile = request.getParameter("sfile");
		
		// 매개변수로 받아주면 그때그때 getParameter 파일이름을 안바꾸어도 됩니다
//		FileUtil.download(request, response, "c:\\upload");
		FileUtil.download(request, response, "c:\\upload", ofile, sfile);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
