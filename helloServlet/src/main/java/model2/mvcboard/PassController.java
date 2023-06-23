package model2.mvcboard;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.JSFunction;

/**
 * Servlet implementation class PassController
 */
@WebServlet("/mvcboard/pass.do")
public class PassController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PassController() {
        super();
        // TODO Auto-generated constructor stub
    }

    // 누가 호출될지 결정하는 메서드가 service 메서드입니다.
    // 삭제할꺼면 삭제컨트롤러 수정할꺼면 수정컨트롤러로 이동
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	// TODO Auto-generated method stub
    	super.service(req, resp);
    }
    
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// mode : 수정(edit), 삭제(delete)
		// 사용하지않고 있습니다. 주석처리합니다.
		// request.setAttribute("mode", request.getParameter("mode"));
		// request.setAttribute("idx", request.getParameter("idx"));
		
		request.getRequestDispatcher("../14MVCBoard/Pass.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 어떤 속성으로 넘어와요? pass.jsp에서 input post로 name속성 value값 
		// String 값으로 저장해줍니다.
		String idx = request.getParameter("idx");
		String mode = request.getParameter("mode");
		String pass = request.getParameter("pass");

		MVCBoardDAO dao = new MVCBoardDAO();
		
		// pass, idx 를 가지고 있나 없나
		// 게시글의 비밀번호가 일치하는지 확인
		boolean confirmed = dao.confirmPassword(pass, idx);
		
		// 비밀번호 체크 성공
		if(confirmed) {
			System.out.println("비밀번호 검증 성공!!!!");
			if(mode.equals("edit")) {
				// 수정
				response.sendRedirect("../mvcboard/edit.do?idx="+idx);
			} else if(mode.equals("delete")) {
				// 삭제
				int res = dao.delete(idx);
				if(res>0) {
					// 삭제 성공
					JSFunction.alertLocation(response, "../mvcboard/list.do", "삭제 되었습니다.");
				} else {
					// 게시물 삭제 실패
					// 메세지 처리 후 이전화면으로
					JSFunction.alertBack(response, "게시물 삭제에 실패 하였습니다. 관리자에게 문의 해주세요");
				}
			}
		} else {
			// 비밀번호 체크 실패
			// 메세지 처리후 이전화면으로
			JSFunction.alertBack(response, "비밀번호 검증에 실패 하였습니다.");
		}
		
		// doGet(request, response);
	}

}
