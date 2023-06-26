package model2.mvcboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DBConnPool;

public class MVCBoardDAO {

	public MVCBoardDAO() {
		// TODO Auto-generated constructor stub
	}

	// MVCBoardDTO 담겨있는 List를 만들어줍니다.
	// 목록 조회
//	public List<MVCBoardDTO> getList(){
//	public List<MVCBoardDTO> getList(String searchField, String searchWord){
	public List<MVCBoardDTO> getList(Criterion criterion){
		List<MVCBoardDTO> list = new ArrayList<MVCBoardDTO>();
		
		// String sql = "SELECT * FROM mvcboard ORDER BY idx DESC";
		String sql = "SELECT * FROM mvcboard ";
		
		// 검색어가 null이 아니라면 검색기능 추가
		if(criterion.getSearchWord() != null
				&& !criterion.getSearchWord().equals("")) {
			sql += "where " + criterion.getSearchField() + " like '%"
					+ criterion.getSearchWord() + "%'";
		}
		
		sql += "ORDER BY idx DESC";
		
		// System.out.println("검색 sql : " + sql);
		
		/*
		String sql = "SELECT * FROM mvcboard "; 
		
		if(searchWord != null && !"".equals(searchWord)) {

			sql += "where " + searchField + " like '%" + searchWord + "%'";
		}
		sql += "ORDER BY idx DESC";
		*/
		
		try ( Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);){
			
			// 결과집합을 반환 받습니다.
			ResultSet rs = psmt.executeQuery();
		
			// if문 이용하면 한건 나옵니다. 반복문을 활용하여..
			while(rs.next()) {
				MVCBoardDTO dto = new MVCBoardDTO(
													rs.getString("idx")
													, rs.getString("name")
													, rs.getString("title")
													, rs.getString("content")
													, rs.getString("postdate")
													, rs.getString("ofile")
													, rs.getString("sfile")
													, rs.getInt("downcount")
													, rs.getString("pass")
													, rs.getInt("visitcount")
												);
				
				/* 매개변수에 담으나 밖으로 빼서 작업하나 비슷합니다.
				dto.setIdx(rs.getString("idx"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getString("postdate"));
				dto.setOfile(rs.getString("ofile"));
				dto.setSfile(rs.getString("sfile"));
				dto.setDowncount(rs.getString("downcount"));
				dto.setPass(rs.getString("pass"));
				dto.setVisitcount(rs.getString("visitcount"));
				*/
				
				list.add(dto);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	// 총건수 조회
	public int getTotalCount(Criterion criterion) {
		
		int res = 0;
		
		String sql = "select count(*) from MVCBOARD ";
		
		if(criterion.getSearchWord() != null && !"".equals(criterion.getSearchWord())) {
			
		sql += "where " + criterion.getSearchField() + " like '%" + criterion.getSearchWord() + "%'" ;
		
		}
	
		sql	+= "order by idx desc";
		
		try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);) {
			ResultSet rs = psmt.executeQuery();
			if(rs.next()) {
				res = rs.getInt(1); // 첫번째 컬럼의 값을 반환
			}
			
			rs.close();
		} catch (SQLException e) {
			System.err.println("총 게시물의 수를 조회 하던중 예외가 발생하였습니다.");
			e.printStackTrace();
		}
		
		return res;
		
	}
	
	// 목록 조회 + 페이징
	public List<MVCBoardDTO> getListPage(Criterion criterion) {
		List<MVCBoardDTO> MVCList = new ArrayList<>();
		
		// 순서대로 작성하신분은 오류가 날수있습니다. rn을 뒤로 붙여주면 오류가 안납니다! 순서상
		// String sql = "select rownum rn, board.* "
		String sql = ""
				+ " select * from ( "
				
				+ " select t.*, rownum rn "
					+ " from ( SELECT * FROM MVCBOARD ";
		
		// 검색어가 입력 되었으면 검색 조건을 추가 합니다.
		if(criterion.getSearchWord() != null && !"".equals(criterion.getSearchWord())) {
			
			sql += " where "+ criterion.getSearchField() +" like '%"+ criterion.getSearchWord() +"%'" ;
		}
		
		sql += " order by idx desc ";
		
		sql += " ) t ) "
			+ " where rn between "
			+ "?"
			//+ criterion.getStartNo()
			+ " and "
			+ "?";
			//+ criterion.getEndNo();
				
		// System.out.println("검색 sql : " + sql);
		
		// 검색조건 추가
		try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);
				) {
			// 페이징 처리 - 시작번호와 끝번호를 입력
			psmt.setInt(1, criterion.getStartNo());
			psmt.setInt(2, criterion.getEndNo());
			
			
			ResultSet rs = psmt.executeQuery();
			
			// 게시글의 수 만큼 반복 하기위해 rs.next() List에!
			while(rs.next()) {
				// 게시물의 한행을 DTO에 저장
				MVCBoardDTO dto = new MVCBoardDTO(rs.getString("idx")
								, rs.getString("name")
								, rs.getString("title")
								, rs.getString("content")
								, rs.getString("postdate")
								, rs.getString("ofile")
								, rs.getString("sfile")
								, rs.getInt("downcount")
								, rs.getString("pass")
								, rs.getInt("visitcount"));
				
				MVCList.add(dto);
				
			}
		} catch (SQLException e) {
			System.err.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return MVCList;
	}

	public MVCBoardDTO selectOne(String idx) {
		
		MVCBoardDTO dto = new MVCBoardDTO();
		String sql = "select * from mvcboard where idx = ?";
		
		try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);) {
			
			psmt.setString(1, idx);
			
			ResultSet rs = psmt.executeQuery();
			
			// 인덱스는 중복될수없는 값이라 하나만 if!
			if(rs.next()) {
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getString(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setDowncount(rs.getInt(8));
				dto.setPass(rs.getString(9));
				dto.setVisitcount(rs.getInt(10));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.err.println("게시물 상세보기 조회 중 오류가 발생 하였습니다.");
			e.printStackTrace();
		}
		return dto;
	}

	public boolean confirmPassword(String pass, String idx) {
		boolean res = false;
		String sql = "select * from mvcboard where idx = ? and pass = ?";
		
		
		try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);) {
			
			psmt.setString(1, idx);
			psmt.setString(2, pass);
			
			ResultSet rs = psmt.executeQuery();
			
			res = rs.next();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}

	public boolean edit(String idx, String title, String content) {
		boolean res = false;
		
		String sql = "update mvcboard set title= ? , content= ? where idx = ?";
		
		try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);) {
			
			psmt.setString(1, idx);
			psmt.setString(2, title);
			psmt.setString(3, content);
			
			ResultSet rs = psmt.executeQuery();
			
			res = rs.next();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}

	public int delete(String idx) {
		int res = 0;
		
		String sql = "delete from mvcboard where idx = ?";
		
		try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);) {
			
			psmt.setString(1, idx);
			
			res = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return res;
	}

	public int insert(MVCBoardDTO dto) {
		int res = 0;
		
		String sql = "insert into mvcboard "
				+ "		(idx, name, title, content, pass, ofile, sfile) "
				+ "    values (SEQ_NUMBER_MVC.nextval, ?, ?, ?, ?, ?, ?) ";
		
		try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);) {
			
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getPass());
			psmt.setString(5, dto.getOfile());
			psmt.setString(6, dto.getSfile());
			
			System.out.println(dto.getTitle());
			
			res = psmt.executeUpdate();
				
		} catch (SQLException e) {
			System.err.println("게시물 입력중 예외 발생");
			e.printStackTrace();
		}
		
		return res;
	}
	
}
