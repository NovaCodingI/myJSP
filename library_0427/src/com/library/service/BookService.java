package com.library.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.library.dao.BookDao;
import com.library.vo.Book;
import com.library.vo.Criteria;
import com.library.vo.PageDto;

public class BookService {
	BookDao dao = new BookDao();
	
	/**
	 * 책 리스트를 조회 합니다.
	 * @param cri 
	 * @return
	 */
//	public List<Book> getList(Criteria cri){
	// 여러가지 타입을 저장하고싶을때 map 사용 Object★
	public Map<String, Object> getList(Criteria cri){
		// dao 리턴하면 되는거 아니에요? 라는 생각은 안되요. 이해해요?
		// Map으로 바꾸면 List에 대한 모든걸 조회할수있게 만들어요
		Map<String, Object> map = new HashMap<>();
		
		// 리스트 조회 할땐 매개변수에 조건 넣어줘야돼요
		// List<Book> list = dao.getList(cri);
		List<Book> list = dao.getListPage(cri);
		System.out.println("list 잘나와요 : " + list);
		
		// 총 건수 조회 할땐 매개변수에 조건 넣어주세요
		int totalCnt = dao.getTotalCnt(cri);
		
		// 페이지DTO
		PageDto pageDto = new PageDto(totalCnt, cri);
		
		map.put("list", list);
		map.put("totalCnt", totalCnt);
		map.put("pageDto", pageDto);
		
//		List<Book> list = dao.getList();
//		for(Book book : list) {
//			System.out.println(book);
//		}
		return map;
	}

	/**
	 * 도서 정보 입력
	 */
//	public void insert(String title, String author) {
	public int insert(Book book) {
//		Book book = new Book(title, author);
		int res = dao.insert(book);
		
		// 서비스에서 메세지처리 해주면 좋지만 컨트롤러에서
		// JSFunction에서 메세지 처리를 하기때문에 별도 주석처리합니다.
//		if(res > 0) {
//			System.out.println(res + "건 입력 되었습니다.");
//		} else {
//			System.err.println("입력중 오류가 발생 하였습니다.");
//			System.err.println("관리자에게 문의 해주세요");
//		}
		return res;
	}

	public int delete(String noStr) {
		int res = dao.delete(noStr);
		return res;
	}
	/*
		if(res>0) {
			System.out.println(res+"건 삭제되었습니다.");
		} else {
			System.err.println("삭제중 오류가 발생 하였습니다.");
			System.err.println("관리자에게 문의 해주세요");
		}
	}
	*/
	public int rentBook(Book book) {
		int res = dao.rentBook(book);
		return res;
	}
	public String returnBook(Book book) {
	    String rentYN = dao.returnBook(book); // 대여 여부를 저장할 변수

	    return rentYN; // 대여 여부를 반환
	}
	
	/* 옛날꺼
	public void rentBook(int bookNo) {
		// 대여가능한 도서인지 확인
		String rentYN = dao.getRentYN(bookNo);
		if("Y".equals(rentYN)) {
			System.err.println("이미 대여중인 도서 입니다.");
		} else if ("".equals(rentYN)) {
			System.out.println("없는 도서 번호 입니다.");
		}
		
		// 대여처리
		int res = dao.update(bookNo, "Y");
		
		if(res>0) {
			System.out.println(res + "건 대여 되었습니다.");
		}else {
			System.out.println("대여중 오류가 발생 하였습니다.");
			System.out.println("관리자에게 문의 해주세요");
		}
	}
	*/
	/* 옛날꺼
	public void returnBook(int bookNo) {
		// 반납가능한 도서인지 확인
		String rentYN = dao.getRentYN(bookNo);
		if("N".equals(rentYN)) {
			System.err.println("반납 가능한 상태가 아닙니다.");
		} else if ("".equals(rentYN)) {
			System.out.println("없는 도서 번호 입니다.");
		}
		
		// 반납처리
		int res = dao.update(bookNo, "N");
		
		if(res>0) {
			System.out.println(res + "건 반납 되었습니다.");
		}else {
			System.out.println("반납 처리 중 오류가 발생 하였습니다.");
			System.out.println("관리자에게 문의 해주세요");
		}
	}
	*/
	
	public Book selectOne(String no) {
		return dao.selectOne(no);
	}
	
}













