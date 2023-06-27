package com.library.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.service.BookService;
import com.library.vo.Criteria;

@WebServlet("*.book")
public class Bookcontroller extends HttpServlet{

	BookService bs = new BookService();
	
	// 컨트롤러 하나가 복잡해지는 대신에 하나의 컨트롤러로 모든 처리가 가능해진다 @WebServlet("*.book") 모든 요청으로 인해
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		System.out.println("요청 uri : " + uri);
		
		
		// list가 요청되었다면 list 조회 (경로에 list가 있다면 실행)
		if(uri.indexOf("list") > 0) {
			
			// 검색조건 세팅 
			Criteria cri = new Criteria(
									req.getParameter("searchField")
									, req.getParameter("searchWord")
									, req.getParameter("pageNo"));
			
			// list를 저장해주세요
			// 리스트 조회 및 요청객체에 저장
//			req.setAttribute("list", bs.getList(cri));
//			Map<String, Object> map = bs.getList(cri);
//			req.setAttribute("map", map);
			
			req.setAttribute("map", bs.getList(cri));
			
			// forward 하는 이유는 request 영역을 공유하기 위해서
			req.getRequestDispatcher("./list.jsp").forward(req, resp);
			
		} else if (uri.indexOf("delete") > 0) {
			// 포워딩
			int res = bs.delete(req.getParameter("delNo"));
			
			if(res>0) {
				req.setAttribute("message", res + "건 삭제되었습니다.");
			} else {
				req.setAttribute("message", "삭제 실패! 관리자에게 문의해주세요.");
			}
			resp.sendRedirect("./list.book");
			//req.getRequestDispatcher("./list.book").forward(req, resp);
			
		} else if (uri.indexOf("insert") > 0) {
			  String title = req.getParameter("title");
			  String author = req.getParameter("author");
			  bs.insert(title, author);

			  // 도서 등록 후 리스트 페이지로 리다이렉트
			  req.setAttribute("message", "도서가 등록되었습니다.");
			  resp.sendRedirect("./list.book");
			}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	
	public Bookcontroller() {
		// TODO Auto-generated constructor stub
	}

}
