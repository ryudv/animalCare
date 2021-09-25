package pro_user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	private Connection conn; 
	private PreparedStatement pstmt; 
	private ResultSet rs; 
	
	public UserDAO() {
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
	
	// 로그인 화면에서 데이터베이스에 접근
	public int login(String userId, String userPwd) {
		String sql = "select userPwd from pro_user where userId = ?";
		try {
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery(); 
			if(rs.next()) {
				if(rs.getString(1).equals(userPwd)) {
					return 1; //로그인 성공
				}else
					return 0; //비밀번호 틀림
			}
			return -1; //아이디 없음
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -2; //오류
	}
	
	// 회원가입폼에서 데이터베이스에 회원정보가 전송
	public int join(Pro_user pro_user) {
		  String sql = "insert into pro_user values(?, ?, ?, ?, ?)";
		  try {
		    pstmt = conn.prepareStatement(sql);
		    pstmt.setString(1, pro_user.getUserId());
		    pstmt.setString(2, pro_user.getUserPwd());
		    pstmt.setString(3, pro_user.getUserPwd2());
		    pstmt.setString(4, pro_user.getUserName());
		    pstmt.setString(5, pro_user.getUserEmail());
		    return pstmt.executeUpdate();
		  }catch (Exception e) {
		 	e.printStackTrace();
		  }
		  return -1;
		}
		
}
