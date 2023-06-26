package com.library.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.service.BookService;

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
			// list를 저장해주세요
			req.setAttribute("list", bs.getList());
			// forward 하는 이유는 request 영역을 공유하기 위해서
			req.getRequestDispatcher("./list.jsp").forward(req, resp);
			
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
