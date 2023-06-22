package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// uri로 지정해줘야해요!
// @WebServlet("/13서블릿/AnnotationMapping.do")
@WebServlet("/13서블릿/A")
public class AnnotationMapping extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("message", "AnnotationMapping.do 호출");
		// 지금은 직접 호출하지만 Spring 들어가면 코드로 자동화 됩니다!
		req.getRequestDispatcher("HelloServlet.jsp").forward(req, resp);
	}
	
	public AnnotationMapping() {
		// TODO Auto-generated constructor stub
	}

}
