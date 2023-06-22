package servlet;

import java.io.IOException;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 이 uri를 요청할건데 get 방식과 post 방식으로 해보자
// get 방식은 쉽다 링크를 걸어주면 되고 post는 form에 값을 설정해서 해보자!
@WebServlet("/13서블릿/LifeCycle.do")
public class LifeCycle extends HttpServlet{
	
	@PostConstruct
	public void myPostConstruct() {
		System.out.println("myPostConstruct() 호출");
	}
	
	@Override
	public void init() throws ServletException {
		System.out.println("init() 호출");
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		System.out.println("service() 호출");
		// 포스트를 호출해줘야 하기 때문에 super는 그대로있어야 합니다.
		super.service(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 부모를 호출하는 로직이 있으면 오류가 날수있으므로 doGet메소드에서는 지워주는것이 좋다
		
		System.out.println("doGet() 호출");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doPost() 호출");
	}
	
	@Override
	public void destroy() {
		System.out.println("destroy() 호출");
	}
	
	@PreDestroy
	public void myPerDestroy() {
		System.out.println("myPerDestroy() 호출");
	}
	
	public LifeCycle() {
		// TODO Auto-generated constructor stub
	}

}
