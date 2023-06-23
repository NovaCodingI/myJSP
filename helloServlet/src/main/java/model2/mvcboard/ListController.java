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

		
		/*
		int pageNo = 1;
		if(req.getParameter("pageNo") != null) {
			try {
				pageNo = Integer.parseInt(req.getParameter("pageNo"));
			} catch (Exception e) {
				System.err.println("페이지 번호를 숫자로 변환중 오류 발생");
				System.err.println("pageNo : " + req.getParameter("pageNo").toString());
				pageNo = 1;
			}
		} 
//		Criterion criterion = new Criterion(pageNo);
		*/
		
		// 객체를 만들어서 객체로 넣어주세요
		
		// 검색어, 페이지정보 세팅
//		Criterion criterion = new Criterion();
		
		String searchField = req.getParameter("searchField");
		String searchWord = req.getParameter("searchWord");
		String pageNo = req.getParameter("pageNo");
//		int pageNo = req.getParameter("pageNo") == null ? 1 : Integer.parseInt(req.getParameter("pageNo"));
		Criterion criterion = new Criterion(searchField, searchWord, pageNo);
		
//		System.out.println("===== 페이지 관련 파라메터 ======");
//		System.out.println(criterion.getPageNo());
//		System.out.println(criterion.getStartNo());
//		System.out.println(criterion.getEndNo());
//		System.out.println("===== 페이지 관련 파라메터 ======");
		
		
//		criterion.setSearchField(req.getParameter("searchField"));
//		criterion.setSearchWord(req.getParameter("searchWord"));
		
		

		// 검색어, 페이지 정보를 담은 객체를 매개변수로 넣어줍니다.
//		List<MVCBoardDTO> list = dao.getList(criterion);
		List<MVCBoardDTO> list = dao.getListPage(criterion);
		
		
		// System.out.println("list : " + list.size());
		
		int TCnt = dao.getTotalCount(criterion);
		
		// 페이지 네비게이션 생성을 위해 pageDto를 생성
		MVCPageDto pagedto = new MVCPageDto(TCnt, criterion);
		
		
		// request영역에 저장
		req.setAttribute("list", list);
		req.setAttribute("TCnt", TCnt);
		// PageNavi.jsp
		// <c:set var="MVCPageDto" value="${pagedto}" /> value 값이잖아요 이 바보야
		req.setAttribute("pagedto", pagedto);
		
		
		// 화면 페이지 전환
		req.getRequestDispatcher("/14MVCBoard/List.jsp").forward(req, resp);
		// 테이블 새로 만들거구. dao 만들고 dto 만들어야겠죠? 새로운 게시판 만들겁니다
		// System.out.println(pagedto);
	}
	
	public ListController() {
		// TODO Auto-generated constructor stub
	}

}
