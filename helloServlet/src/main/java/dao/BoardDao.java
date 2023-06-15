package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import common.DBConnPool;
import dto.Board;

/**
 * 남의것 복사할때 주석까지 가져갈셈이야??
 * @author user
 *	Since 언제 누가 어떻게.. 만드는 경우가 있다 (현장에 따라 달라짐)
 *	그러므로 주석 관리 잘해봐
 */
public class BoardDao {

	public BoardDao() {
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * 게시글을 목록을 조회 합니다.
	 * 
	 * @param searchField : 검색조건
	 * @param searchWord : 검색어
	 * @return List<Board> : 게시글 목록
	 */
	
	public List<Board> getList(String searchField, String searchWord) {
		List<Board> boardList = new ArrayList<>();
		
		String sql = "select * "
				+ "from board ";
		
		// 검색어가 입력 되었으면 검색 조건을 추가 합니다.
		if(searchWord != null && !"".equals(searchWord)) {
			
			sql += "where "+ searchField +" like '%"+ searchWord +"%'" ;
		}
		
		sql += "order by num desc";
				
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
	 * @return 게시물의 총 갯수
	 */
	public int getTotalCnt(String searchField, String searchWord) {
		int totalCnt = 0;
		
		String sql = "select count(*) "
				+ "from board ";
			
			if(searchWord != null && !"".equals(searchWord)) {
			
			sql += "where " + searchField + " like '%" + searchWord + "%'" ;
			
			}
		
			sql	+= "order by num desc";
		
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
	
	/**
	 * 게시글을 등록 합니다.
	 * @param board
	 * @return
	 */
	// 세션에 있는걸 받아오고싶다면 HttpSession session를 매개변수에 담아주어야겠지요?
	// public int insert(Board board, HttpSession session) {
	public int insert(Board board) {
		int res = 0;
		
		String sql = "insert into board "
				+ "(num, title, content, id, postdate, visitcount) "
				+ "values (seq_board_num.nextval, "
				
				+ "?, "
				
				+ "?, "
				
				+ "?, "
				
				+ "sysdate, 0)";
		
		
		
		try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);){
			
			// close()가 있는 객체만 try(안에 들어올수있습니다.)
			// conn.close();
			// psmt.close();
			
			// ? 로 했다면 세팅해줘야겠지요
			psmt.setString(1, board.getTitle());
			psmt.setString(2, board.getContent());
			psmt.setString(3, board.getId());
			

			// insert, update, delete 실행 후 몇건이 처리 되었는지 반환
			res = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
		
	}
	
	/**
	 * 게시글번호를 입력받아 게시글을 조회 합니다.
	 * @param num
	 * @return
	 */
	public Board selectOne(String num) {
		// Board board = new Board();
		// 반환이 null 인경우 처리가 가능하기때문에 if문 안에서 생성
		// 생성은 상단에서 세팅은 if 문에서!!
		Board board = null;
		
		String sql = "select * "
				+ "from board "
				+ "where num = ?";
		
		if(num == null || "".equals(num)) {
			return null;
		}
		
		// DBConnPool은 톰켓이 실행시켜줍니다
		try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);) {
			
			psmt.setString(1, num);
			
			// 결과를 조회할때는 쿼리이용하세요
			ResultSet rs = psmt.executeQuery();
			
			// 조회된 결과가 있으면
			// 1건의 게시글을 조회 하여 board 객체에 담아줍니다.
			if(rs.next()) {
				board = new Board();
				// rs.getString(0);
				board.setNum(rs.getString("num"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setId(rs.getString("id"));
				board.setPostdate(rs.getString("postdate"));
				board.setViscount(rs.getString("visitcount"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return board;
	}
	
	/**
	 * 게시물의 조회수를 1 증가 시킵니다
	 * @param num : 게시물번호
	 * @return 업데이트된 건수
	 */
	public int updateVisitCount(String num) {
		int res = 0;
		String sql = "update board set visitcount = visitcount+1 where num=?";
		
		
		try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);) {
				
				// 물음표 하나니까 세팅하는값 하나 입니다.
				psmt.setString(1, num);
				
				res = psmt.executeUpdate();
				
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return res;
	}
	
	
	/**
	 * 게시물 삭제하기
	 * @param num
	 * @return
	 */
	public int delete(String num) {
		int res = 0;
		String sql = "DELETE FROM board WHERE num = ?";
				
		
		try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);){
			
			psmt.setString(1, num);
			
			res = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		return res;
	}
	
	
	/**
	 * 게시물 수정하기
	 * @param board
	 * @return
	 */
	public int update(Board board) {
		int res = 0;
		
		String sql = "update board set title=?, content=? where num=?";
		
		// 분할해서 쿼리 안먹습니다. 상단에 있는 res 반환 값만 먹어요 그러므로 따로 추가 해줘야합니다.
//		 String sql = "update board set content=? where num=?";
		// sql +=  "update board set content=? where num=?";
//		 String sql2 =  "update board set title=? where num=?";
		
		try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);){
				// PreparedStatement psmt2 = conn.prepareStatement(sql2);){
			
			// close()가 있는 객체만 try(안에 들어올수있습니다.)
			// conn.close();
			// psmt.close();
			
			// ? 로 했다면 세팅해줘야겠지요
			
			psmt.setString(1, board.getTitle());
			psmt.setString(2, board.getContent());
			psmt.setString(3, board.getNum());
			res = psmt.executeUpdate();
			
			/*
			// 같은값으로 psmt와 sql로 받아온다면 상단에 있는 res 값만 반환합니다
			psmt.setString(1, board.getContent());
			psmt.setString(2, board.getNum());
			res = psmt.executeUpdate();
			
			// insert, update, delete 실행 후 몇건이 처리 되었는지 반환
			
			psmt2.setString(1, board.getTitle());
			psmt2.setString(2, board.getNum());
			res += psmt2.executeUpdate();
			*/
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
		
	}
}
