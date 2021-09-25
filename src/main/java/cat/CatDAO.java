package cat;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import cat.Cat;

public class CatDAO {
	private Connection conn; 
	private PreparedStatement pstmt; 
	private ResultSet rs; 
	
	public CatDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
			String user = "system";
			String pwd = "oracle";
			conn = DriverManager.getConnection(url,user,pwd);
			System.out.println("오라클연결성공");
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("오라클연결실패");
		}
	}
	
	
	// 신규등록에서 데이터베이스에 반려묘 정보가 전송
	public int sign(Cat cat) {
		  String sql = "insert into cat values(?, ?, ?, ?, ?)";
		  try {
		    pstmt = conn.prepareStatement(sql);
		    pstmt.setString(1, cat.getCatName());
		    pstmt.setString(2, cat.getCatGender());
		    pstmt.setString(3, cat.getCatAge());
		    pstmt.setString(4, cat.getCatType());
		    pstmt.setString(5, cat.getCatWeight());
		    return pstmt.executeUpdate();
		  }catch (Exception e) {
		 	e.printStackTrace();
		  }
		  return -1;
		}
	
}
