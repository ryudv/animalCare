package cat;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
	
	// 기본 정보 데이터베이스 전송
	public int sign(Cat cat) {
		  String sql = "insert into cat values(?, ?, ?, ?)";
		  try {
		    pstmt = conn.prepareStatement(sql);
		    pstmt.setString(1, cat.getCatName());
		    pstmt.setString(2, cat.getCatGender());
		    pstmt.setString(3, cat.getCatAge());
		    pstmt.setString(4, cat.getCatType());
		    return pstmt.executeUpdate();
		  }catch (Exception e) {
		 	e.printStackTrace();
		  }
		  return -1;
	}
	
	// 병원 진료 기록 데이터베이스 전송
	public int hospital(Cat cat) {
		  String sql = "insert into hospital values(?, ?, ?, ?, ?)";
		  try {
		    pstmt = conn.prepareStatement(sql);
		    pstmt.setString(1, cat.getCatName());
		    pstmt.setString(2, cat.getHospitalName());
		    pstmt.setString(3, cat.getVisitDate());
		    pstmt.setString(4, cat.getSymptom());
		    pstmt.setString(5, cat.getTreatment());
		    return pstmt.executeUpdate();
		  }catch (Exception e) {
		 	e.printStackTrace();
		  }
		  return -1;
	}
	
	// 반려묘 신체기록 기록 데이터베이스 전송
	public int catBody(Cat cat) {
		  String sql = "insert into catBody values(?, ?, ?, ?, ?)";
		  try {
		    pstmt = conn.prepareStatement(sql);
		    pstmt.setString(1, cat.getCatName());
		    pstmt.setString(2, cat.getRecordDate());
		    pstmt.setString(3, cat.getWeight());
		    pstmt.setString(4, cat.getDisease());
		    pstmt.setString(5, cat.getOtherThings());
		    return pstmt.executeUpdate();
		  }catch (Exception e) {
		 	e.printStackTrace();
		  }
		  return -1;
	}
	
	// 청소&목욕 데이터베이스 전송
		public int food(Cat cat) {
			  String sql = "insert into food values(?, ?, ?, ?, ?, ?, ?)";
			  try {
			    pstmt = conn.prepareStatement(sql);
			    pstmt.setString(1, cat.getCatName());
			    pstmt.setString(2, cat.getFoodChoice1());
			    pstmt.setString(3, cat.getFoodChoice2());
			    pstmt.setString(4, cat.getFoodDate());
			    pstmt.setString(5, cat.getFoodName());
			    pstmt.setString(6, cat.getPrice());
			    pstmt.setString(7, cat.getFoodContents());
			    return pstmt.executeUpdate();
			  }catch (Exception e) {
			 	e.printStackTrace();
			  }
			  return -1;
		}
		
	// 사료&간식 데이터베이스 전송
			public int clean(Cat cat) {
				  String sql = "insert into clean values(?, ?, ?, ?, ?)";
				  try {
				    pstmt = conn.prepareStatement(sql);
				    pstmt.setString(1, cat.getCatName());
				    pstmt.setString(2, cat.getCleanChoice1());
				    pstmt.setString(3, cat.getCleanChoice2());
				    pstmt.setString(4, cat.getCleanDate());
				    pstmt.setString(5, cat.getCleanContents());
				    return pstmt.executeUpdate();
				  }catch (Exception e) {
				 	e.printStackTrace();
				  }
				  return -1;
			}
	
	// 반려묘 기본 정보를 출력
	public ArrayList<Cat> CatInfo(){
		ArrayList<Cat> list = new ArrayList<Cat>();
		try {
			String sql = "select * from cat";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Cat cat =  new Cat();
				cat.setCatName(rs.getString("catName"));
				cat.setCatGender(rs.getString("catGender"));
				cat.setCatAge(rs.getString("catAge"));
				cat.setCatType(rs.getString("catType"));
				list.add(cat);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return list;
	}
	

}
