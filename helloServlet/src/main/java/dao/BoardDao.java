package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DBConnPool;
import dto.Board;

public class BoardDao {

	public BoardDao() {
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * 게시글을 조회 합니다. 
	 * @return List<Board>
	 */
	public List<Board> getList() {
		List<Board> boardList = new ArrayList<Board>();
		
		String sql = "select * from board order by num desc";
		// 검색조건 추가
		try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);
				) {
			ResultSet rs = psmt.executeQuery();
			
			// 게시글의 수 만큼 반복 하기위해 rs.next() List에!
			while(rs.next()) {
				// 게시물의 한행을 DTO에 저장
				Board board = new Board();
				
				board.setNum(rs.getString("num"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setId(rs.getString("id"));
				board.setPostdate(rs.getString("postdate"));
				board.setViscount(rs.getString("visitcount"));
				
				boardList.add(board);
				
				/*
				String num = rs.getString("num");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String id = rs.getString("id");
				String postdate = rs.getString("postdate");
				String viscount = rs.getString("visitcount");
				Board board = new Board(num, title, content, id, postdate, viscount);
				boardList.add(board);
				*/
			}
		} catch (SQLException e) {
			System.err.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return boardList;
	}
	
	
	/**
	 * 게시물의 총 갯수를 반환
	 * @return
	 */
	public int getTotalCnt() {
		int totalCnt = 0;
		
		String sql = "select count(*) "
				+ "from board "
				+ "order by num desc";
		
		
		try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);) {
			ResultSet rs = psmt.executeQuery();
			rs.next();
			totalCnt = rs.getInt(1); // 첫번째 컬럼의 값을 반환
			
			rs.close();
		} catch (SQLException e) {
			System.err.println("총 게시물의 수를 조회 하던중 예외가 발생하였습니다.");
			e.printStackTrace();
		}
		
		
		
		return totalCnt;
	}
	

}
