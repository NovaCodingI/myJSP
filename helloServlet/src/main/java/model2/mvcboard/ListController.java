package model2.mvcboard;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ListController extends HttpServlet{

	// 리스트니까 doGet으로 요청받겠죠?
	// doGet은 누가 호출해줘요? 서비스가 호출해줍니다.
	// 서비스가 호출이되고 사용자의 요청에 따라 메서드를 확인하고
	// doGet이면 doGet doPost면 doPost를 실행시켜줍니다.
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 리스트 조회
		MVCBoardDAO dao = new MVCBoardDAO();
		List<MVCBoardDTO> list = dao.getList();
		
		System.out.println("list : " + list.size());
		
		// request영역에 저장
		req.setAttribute("list", list);
		// 화면 페이지 전환
		req.getRequestDispatcher("/14MVCBoard/List.jsp").forward(req, resp);
		// 테이블 새로 만들거구. dao 만들고 dto 만들어야겠죠? 새로운 게시판 만들겁니다
	
	}
	
	public ListController() {
		// TODO Auto-generated constructor stub
	}

}
