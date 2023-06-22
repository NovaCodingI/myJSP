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
//	public List<MVCBoardDTO> getList(String searchField, String searchWord){
	public List<MVCBoardDTO> getList(){
		List<MVCBoardDTO> list = new ArrayList<MVCBoardDTO>();
		
		String sql = "SELECT * FROM mvcboard ORDER BY idx DESC";
		
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
	public int totalCount() {
		
		int res = 0;
		
		return res;
		
	}
	
	
	
}
