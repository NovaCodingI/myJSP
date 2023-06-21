package fileupload;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DBConnPool;

public class FileDao {

	public FileDao() {
		// TODO Auto-generated constructor stub
	}
	
	// 파일 정보를 저장 합니다.
	public int insertFile(FileDto dto) {
		int res = 0;

		// conn
		// 쿼리
		// 쿼리실행
		
		String query = "INSERT INTO myfile (idx, name, title, cate, ofile, sfile, postdate) "
				+ "VALUES (seq_number_num.NEXTVAL, ?, ?, ?, ?, ?, sysdate)";
		
		try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(query);) {
			
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getCate());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile()); // sfile 열에 대한 값을 바인딩
			
			res = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}
		
	
	// 파일 목록을 조회 합니다.
	public List<FileDto> getFileList() {
		List<FileDto> list = new ArrayList<FileDto>();
		
		// conn
		// 쿼리
		// 쿼리실행
		// 결과집합 담기
		
		String query = "SELECT * FROM myfile ORDER BY idx DESC";
		
		try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(query);) {
			ResultSet rs = psmt.executeQuery(); // 쿼리실행
			
			while(rs.next()) { // 목록 안의 파일 수 만큼 반복
			
			// DTO에 저장
			FileDto fileDto = new FileDto();
			fileDto.setIdx(rs.getString(1));
			fileDto.setName(rs.getString(2));
			fileDto.setTitle(rs.getString(3));
			fileDto.setCate(rs.getString(4));
			fileDto.setOfile(rs.getString(5));
			fileDto.setSfile(rs.getString(6));
			fileDto.setPostdate(rs.getString(7));
			
			list.add(fileDto); // 목록에 추가
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

}
