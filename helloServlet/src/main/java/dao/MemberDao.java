package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.ConnectionUtil;
import dto.Member;

public class MemberDao {

	
	public MemberDao() {
		// TODO Auto-generated constructor stub
	}
	
	// PreparedStatement 는 ? 로 주어도 된다.
	/**
	 * 로그인
	 * 아이디/비밀번호가 일치하는 회원을 조회 합니다.
	 * 
	 * 회원이 존재하는경우 Member 객체 반환
	 * 		존재하지 않는경우 null 반환
	 * 		
	 * @param id : 입력한 회원id
	 * @param pw : 입력한 회원pw
	 * @return
	 */
	public Member login(String id, String pw) {
		Member member = null;
		
		/* 공백을 잘 확인해야한다 에러!!
		 String sql =
			"select * from member" 
				// + "where id = '"+id+"' and pass='"+pw+"'";
			+ "where id = ? and pass= ?";
		*/
		String sql = "select * from member where id = ? and pass = ?";

		
		
		// 외부에서 생성하고있는 자원을 사용하고있기때문에 자원을 반납해야합니다.
		// 리소스/자원을 자동으로 반환, close()를 자동으로 해줍니다.
		try (Connection con = ConnectionUtil.getConnection();
				PreparedStatement psmt = con.prepareStatement(sql);) {
			
			psmt.setString(1, id);
			psmt.setString(2, pw);
			 
			// psmt.setString(1, id.toLowerCase());
			// psmt.setString(2, pw.toLowerCase());

			
			ResultSet rs = psmt.executeQuery();
			
			// 아이디/비밀번호가 일치 하는 회원이 있으면 조회
			if(rs.next()) {
				String loginId = rs.getString("id");
				String name = rs.getString("name");
				String regidate = rs.getString("regidate");
				member = new Member(loginId, "", name, regidate);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return member;
	}
	
	/**
	 * 회원등록
	 * @param member
	 * @return 몇건이 처리 되었는지 반환
	 */
	public int insert(Member member) {
		
		int i = 0;
		String sql = "insert into member values (?, ?, ?, sysdate)";
		
		
		try (Connection conn = ConnectionUtil.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);){
			
			psmt.setString(1, member.getId());
			psmt.setString(2, member.getPw());
			psmt.setString(3, member.getName());
			
			i = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return i;
		
	}
}
