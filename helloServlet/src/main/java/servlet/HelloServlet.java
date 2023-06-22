package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setAttribute("message", "서블릿 호출!!!");
		
		/*
		// 주소표시줄 창에 13??? 라고 뜹니다 그래서 주석처리했습니다
		// PrintWriter out = resp.getWriter();
		// out.print("<h1>서블릿 호출!!!<h1>");
		*/
		
		
		// 한글이 깨져서 나와요
		// resp.getWriter().print("서블릿 호출!!!");
		
		// 리퀘스트 영역이 초기화 될테니까 메세지는 안가져가겠죠?
		// sendRedirect는 request 영역이 공유가 안됩니다.
		// resp.sendRedirect("HelloServlet.jsp");
		
		// forward 방식입니다. request영역을 객체를 공유합니다.
		req.getRequestDispatcher("HelloServlet.jsp").forward(req, resp);
	}
	
	public HelloServlet() {
		// TODO Auto-generated constructor stub
	}

}
