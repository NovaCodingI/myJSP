package servlet;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import dto.Member;

// 경로를 매핑
@WebServlet("")
public class MemberAuth extends HttpServlet{

	// 필드에 dao를 생성
	MemberDao dao;
	
	@Override
	public void init() throws ServletException {
		// dao 를 init 에서 만들어 줄겁니다.
		dao = new MemberDao();
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String admin_id = this.getInitParameter("admin_id");
		
		// MemberAuth.jsp 에 있는 <a href="./MemberAuth.mvc?id=test&pw=1234"> req.getParameter의 매개변수값은 id, pw 따라 가는겁니다
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		Member member = dao.login(id, pw);
		
		if(member != null) {
			req.setAttribute("authMessage"
					, member.getName() + "회원님 반가습니다.");
			
			if(member.getId().equals(admin_id)) {
				req.setAttribute("authMessage", admin_id + "님은 관리자 입니다.");
			}
			
		} else {
			req.setAttribute("authMessage"
					, member.getName() + "로그인 실패");
		}
		// 메서드가 살아있으면 오류가 날겁니다 405번 - 메서드 못찾는 오류 super()부모를 찾는 메서드 
		// super()
		
		// req.getRequestDispatcher("/13서블릿/MemberAuth.jsp").forward(req, resp);
		
		//"java.lang.IllegalArgumentException: The Unicode character [서] at code point [49,436] cannot be encoded as it is outside the permitted range of 0 to 255"
		// resp.sendRedirect("/13서블릿/MemberAuth.jsp");
		// resp.sendRedirect("/13%EC%84%9C%EB%B8%94%EB%A6%BF/MemberAuth.jsp");
		
//		String encodedURL = URLEncoder.encode("/13서블릿/MemberAuth.jsp", "UTF-8");
//		resp.sendRedirect(encodedURL);
		
//		String encodedURL = URLEncoder.encode("/13서블릿/MemberAuth.jsp", "UTF-8").replaceAll("\\+", "%20");
//		resp.sendRedirect(encodedURL);

//		TODO : sendredirect 경로확인
//		String str = URLEncoder.encode("MemberAuth.jsp");
//		str = URLEncoder.encode("../13서블릿/MemberAuth.jsp");
//		resp.sendRedirect(str);
		



	}
	
	
	
	public MemberAuth() {
		// TODO Auto-generated constructor stub
	}

}
