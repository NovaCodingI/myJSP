package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletContext;

public class ConnectionUtil {

	public ConnectionUtil() {
		
	}
	
	/**
	 * DB Connection을 반환 합니다.
	 * @return
	 */
	public static Connection getConnection() {
		// ip가 변경될수도 있고.. port가 변경될수도있고.. 소스에 박혀있는건 권장되지 않습니다.
		// 접속정보가 바뀌게 된다면 컴파일도 다시해서 올려야됩니다. 보통 설정파일 따로 관리하므로 외부파일로 빼놓습니다.
		// 접속정보
		//								@ip:port:sid
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String id = "jsp";
		String pw = "1234";
		
		Connection conn = null;
		
		// 커넥션 생성하는 로직작성
		try {
			// 1. 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// 2. 커넥션 생성
			conn = DriverManager.getConnection(url, id, pw);
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.err.println("라이브러리 로드중 오류가 발생 하였습니다.");
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return conn;
	}
	
	/**
	 * web.xml 파일의 컨텍스트 초기화 매개변수를 읽어서
	 * DB접속정보를 설정
	 * 톰켓이 실행될때 설정파일 읽어 들여서 application은 웹으로부터 읽어오는데.. 웹서버가 실행된다음 Test 할수있는거다
	 * @param application
	 * @return
	 */
	public static Connection getConnection(ServletContext application) {
		Connection conn = null;
		
		String driver = application.getInitParameter("OracleDriver");
		String url = application.getInitParameter("OracleUrl");
		String id = application.getInitParameter("OracleId");
		String pw = application.getInitParameter("OraclePw");
		
		/*
		System.out.println(driver);
		System.out.println(url);
		System.out.println(id);
		System.out.println(pw);
		*/
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, id, pw);
			
			
		} catch (ClassNotFoundException e) {
			System.err.println("라이브러리 로드 실패");
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		return conn;
	}
	
	/**
	 * 커넥션 생성 테스트
	 * @param args
	 */
	public static void main(String[] args) {
		String sql = "select to_char(sysdate,'yyyy-mm-dd') today from dual";

		// 자원을 생성할때 자동으로 닫게해주는것은 try( 안에 생성 )
		try (Connection con = getConnection();
				PreparedStatement psmt = con.prepareStatement(sql);){
			
			// 쿼리의 실행결과 가져오기
			ResultSet rs = psmt.executeQuery(); // 쿼리문 실행
			
			rs.next();
			String today = rs.getString(1);
			// rs.getString("today"); // 숫자로 표현하여 첫번째 조회되는 컬럼 혹은 컬럼명을 적어주어도 된다.
			
			System.out.println("오늘 날짜 : " + today);
			
			rs.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	public static void close(Connection conn) {

		try {
			if(conn != null && conn.isClosed()) conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void close(Connection conn, Statement stmt) {
	
		try {
			if(conn != null && conn.isClosed()) conn.close();
			if(stmt != null && stmt.isClosed()) stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void close(Connection conn, Statement stmt, ResultSet rs) {
	
		try {
			if(conn != null && conn.isClosed()) conn.close();
			if(stmt != null && stmt.isClosed()) stmt.close();
			if(rs != null && rs.isClosed()) rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
