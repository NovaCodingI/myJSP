package com.library.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.library.service.BookService;
import com.library.vo.Book;
import com.library.vo.Criteria;
import com.oreilly.servlet.MultipartRequest;
import com.utils.FileUtil;
import com.utils.JSFunction;

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
			
//			resp.sendRedirect("./list.book"); // 삭제하면 최상단 홈페이지
			req.getRequestDispatcher("./list.book").forward(req, resp);
			
		} else if (uri.indexOf("write") > 0) {
			resp.sendRedirect("./Write.jsp");
			
		} else if (uri.indexOf("view") > 0) {
			Book book = bs.selectOne(req.getParameter("no"));
			req.setAttribute("dto", book);
			System.out.println(book);
			if(book != null) {
				// 상세화면
				req.getRequestDispatcher("./View.jsp").forward(req, resp);
			} else {
				JSFunction.alertBack(resp, "도서번호에 해당하는 도서가 존재하지 않습니다.");
			}
		}
		
		else{
			JSFunction.alertBack(resp, "url을 확인해주세요!");
		}
		
//		else if (uri.indexOf("insert") > 0) {
//			  String title = req.getParameter("title");
//			  String author = req.getParameter("author");
//			  bs.insert(title, author);
//
//			  // 도서 등록 후 리스트 페이지로 리다이렉트
//			  req.setAttribute("message", "도서가 등록되었습니다.");
//			  resp.sendRedirect("./list.book");
//		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		System.out.println("요청 uri : " + uri);
		
		if (uri.indexOf("write") > 0) {
			// 도서등록
			String saveDirectory = "C:\\Users\\user\\git\\myJSP\\library_0427\\webapp\\images\\bookimg";
			MultipartRequest mr = FileUtil.uploadFile(req, saveDirectory, 1024*10000);
			Book book = new Book(mr.getParameter("title")
								, mr.getParameter("author"));
			
			String ofile = mr.getFilesystemName("bookImg");
			System.out.println("ofile" + ofile);
			if(ofile != null && !"".equals(ofile)) {
				String sfile = FileUtil.fileNameChange(saveDirectory, ofile);
				
				book.setOfile(ofile);
				book.setSfile(sfile);
			}
			
			int res = bs.insert(book);
			
			if(res > 0) {
				JSFunction.alertLocation(resp, ".list.book", "등록되었습니다.");
			} else {
				JSFunction.alertBack(resp, "등록중 예외사항이 발생하였습니다.");
			}
		
//			resp.sendRedirect("./list.book");
//			req.getRequestDispatcher("/book/list.book").forward(req, resp);
//			System.out.println("요청 uri : " + uri); // 페이지 전환하기에 있어서 sendRedirect로 해야 페이지가 넘어갑니다.
			
		} else if(uri.indexOf("rent") > 0) {
			// 로그인 아이디 확인
			HttpSession session = req.getSession();
			if(session.getAttribute("userId") == null) {
				JSFunction.alertBack(resp, "로그인 후 이용 가능한 메뉴 입니다.");
				return;
			}
			// 대여하기 - 책번호, 로그인아이디
			Book book = new Book();
			book.setNo(req.getParameter("no"));
			book.setId(session.getAttribute("userId").toString());
			
			int res = bs.rentBook(book);
			
			if(res > 0) {
				// 컨트롤러를 호출해줘야합니다.
				JSFunction.alertLocation(resp, "./view.book?no="+book.getNo(), "대여 되었습니다.");
			} else {
				// 뒤로가기 후 왜 빈페이지가 나오는가? 트랜젝션처리가 안되도록 해놔서
				JSFunction.alertBack(resp, "대여중 예외사항이 발생하였습니다.");
			}
		} else if (uri.indexOf("return") > 0) {
		    HttpSession session = req.getSession();
		    if (session.getAttribute("userId") == null) {
		        JSFunction.alertBack(resp, "로그인 후 이용 가능한 메뉴입니다.");
		        return;
		    }

		    // 대여하기 - 책번호, 로그인아이디
		    String bookNo = req.getParameter("no");
		    String userId = session.getAttribute("userId").toString();

		    // 책 객체 생성 및 값 설정
		    Book book = new Book();
		    book.setNo(bookNo);
		    book.setId(userId);

		    // 대여 여부 확인
		    String rentYN = bs.returnBook(book);
		    System.out.println("rentYN : " + rentYN);
		    if (!"Y".equals(rentYN)) {
		        System.err.println("반납 가능한 상태가 아닙니다.");
		        JSFunction.alertBack(resp, "반납 가능한 상태가 아닙니다.");
		        return;
		    }

		    String res = bs.returnBook(book);

		    if ("Y".equals(res)) {
		        // 컨트롤러를 호출해줘야 합니다.
		        JSFunction.alertLocation(resp, "./view.book?no=" + book.getNo(), "반납되었습니다.");
		    } else {
		        // 뒤로가기 후 왜 빈 페이지가 나오는가? 트랜잭션 처리가 안되도록 해놔서
		        JSFunction.alertBack(resp, "반납 중 예외사항이 발생하였습니다.");
		    }
		}
	}
		
	
	public Bookcontroller() {
		// TODO Auto-generated constructor stub
	}

}
