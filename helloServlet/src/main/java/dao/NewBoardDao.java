package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DBConnPool;
import dto.Board;
import dto.Criteria;

public class NewBoardDao {

	public NewBoardDao() {
		// TODO Auto-generated constructor stub
	}
	
	// public List<Board> getList(String searchField, String searchWord){
	public List<Board> getList(Criteria criteria){
		List<Board> list = new ArrayList<>();
		
		
		// String sql = "select * from board order by num desc";
		
		String sql = "select num, title, content, id, visitcount"
				+ " , decode (trunc(sysdate), trunc(postdate), to_char(postdate, 'hh24:mi:ss'), to_char(postdate, 'yyyy-mm-dd')) postdate "
				+ " from board";
		
		/*
		if(searchWord != null && !"".equals(searchWord)){
			sql += "where " + searchField + " like '%" + searchWord + "%'";
		}
		sql += "order by num desc";
		*/
		
		if(criteria.getSearchWord() != null
				&& !"".equals(criteria.getSearchWord())) {
			// 검색어가 입력 된 경우 검색조건을 추가 합니다.
			sql += " where " + criteria.getSearchField() + " like '%" + criteria.getSearchWord() + "%'";
		}
		
		sql += " order by num desc";
		
		try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);){
			
			ResultSet rs =psmt.executeQuery();
			
			while(rs.next()) {
				Board board = new Board();
				board.setNum(rs.getString("num"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setId(rs.getString("id"));
				board.setPostdate(rs.getString("postdate"));
				board.setViscount(rs.getString("visitcount"));
				
				list.add(board);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	
	public List<Board> getListPage(Criteria criteria){
		List<Board> list = new ArrayList<>();
		
		
		String sql =
				"select * from ("
				+ " select rownum rn, t.* from ("
				+ "	select num, title, content, id, visitcount"
				+ " , decode (trunc(sysdate), trunc(postdate), to_char(postdate, 'hh24:mi:ss'), to_char(postdate, 'yyyy-mm-dd')) postdate "
				+ " from board ";
		
		
		if(criteria.getSearchWord() != null
				&& !"".equals(criteria.getSearchWord())) {
			// 검색어가 입력 된 경우 검색조건을 추가 합니다.
			sql += " where " + criteria.getSearchField() + " like '%" + criteria.getSearchWord() + "%'";
		}
			sql += " order by num desc"
					+ " ) t "
					+ ")"
					+ " where rn between "
					+ criteria.getStartNo()
					+ " and "
					+ criteria.getEndNo();
		
		try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);){
			
			ResultSet rs =psmt.executeQuery();
			
			while(rs.next()) {
				Board board = new Board();
				board.setNum(rs.getString("num"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setId(rs.getString("id"));
				board.setPostdate(rs.getString("postdate"));
				board.setViscount(rs.getString("visitcount"));
				
				list.add(board);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	public int insert(Board board) {
		int res = 0;
		
		String sql = "insert into board "
				+ "(num, title, content, id, postdate, visitcount) "
				+ "values (seq_board_num.nextval, "
				+ "?, ?, ?, sysdate, 0)";
		
		
		try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);){
			
			psmt.setString(1, board.getTitle());
			psmt.setString(2, board.getContent());
			psmt.setString(3, board.getId());
			
			res = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}
	
	public Board selectOne(String num) {
		
		String sql = "select * from board where num=?";
		Board board = null;
		
		// 번호 잘 받아지는지 출력 확인
		// System.out.println("num : " + num);
		
		try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);){
			
			psmt.setString(1, num);
			// 결과 ResultSet에 담아오기
			ResultSet rs = psmt.executeQuery();
			
			// 하나씩 받아올때 getString 값이 DB의 값과 틀리지는 않은지 제대로 다시 확인해보세요
			if(rs.next()) {
				board = new Board();
				board.setContent(rs.getString("content"));
				board.setId(rs.getString("id"));
				board.setNum(rs.getString("num"));
				board.setPostdate(rs.getString("postdate"));
				board.setTitle(rs.getString("title"));
				board.setViscount(rs.getString("visitcount"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return board;
	}
	
	public void updatevisitCount(String num) {
		
		String sql = "update board set visitcount = visitcount+1 where num=?";
		
		
		try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);) {
			
			psmt.setString(1, num);
			psmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	
	public int getTotalCnt(Criteria criteria) {
		int totalCnt = 0;
		
		String sql = "select count(*) "
				+ "from board ";
			
			if(criteria.getSearchWord() != null && !"".equals(criteria.getSearchWord())) {
			
			sql += "where " + criteria.getSearchField() + " like '%" + criteria.getSearchWord() + "%'" ;
			
			}
		
			sql	+= "order by num desc";
		
		try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);) {
			ResultSet rs = psmt.executeQuery();
			if(rs.next()) {
				totalCnt = rs.getInt(1); // 첫번째 컬럼의 값을 반환
			}
				
			
			rs.close();
		} catch (SQLException e) {
			System.err.println("총 게시물의 수를 조회 하던중 예외가 발생하였습니다.");
			e.printStackTrace();
		}
		
		return totalCnt;
	}

}
