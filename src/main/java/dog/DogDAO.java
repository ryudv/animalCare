package dog;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DogDAO {
	private Connection conn; 
	private PreparedStatement pstmt; 
	private ResultSet rs; 
	
	public DogDAO() {
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
	public int dogSign(String dogName, String dogGender, String dogAge, String dogType, String userId) {
		  String sql = "insert into dog values(?, ?, ?, ?, ?)";
		  try {
		    pstmt = conn.prepareStatement(sql);
		    pstmt.setString(1, dogName);
		    pstmt.setString(2, dogGender);
		    pstmt.setString(3, dogAge);
		    pstmt.setString(4, dogType);
		    pstmt.setString(5, userId);
		    return pstmt.executeUpdate();
		  }catch (Exception e) {
		 	e.printStackTrace();
		  }
		  return -1;
	}
	
	// 병원 진료 기록 데이터베이스 전송
	public int dogHospital(Dog dog) {
		  String sql = "insert into dogHospital values(?, ?, ?, ?, ?)";
		  try {
		    pstmt = conn.prepareStatement(sql);
		    pstmt.setString(1, dog.getDogName());
		    pstmt.setString(2, dog.getHospitalName());
		    pstmt.setString(3, dog.getVisitDate());
		    pstmt.setString(4, dog.getSymptom());
		    pstmt.setString(5, dog.getTreatment());
		    return pstmt.executeUpdate();
		  }catch (Exception e) {
		 	e.printStackTrace();
		  }
		  return -1;
	}
	
	// 반려묘 신체기록 기록 데이터베이스 전송
	public int dogBody(Dog dog) {
		  String sql = "insert into dogBody values(?, ?, ?, ?, ?)";
		  try {
		    pstmt = conn.prepareStatement(sql);
		    pstmt.setString(1, dog.getDogName());
		    pstmt.setString(2, dog.getRecordDate());
		    pstmt.setString(3, dog.getWeight());
		    pstmt.setString(4, dog.getDisease());
		    pstmt.setString(5, dog.getOtherThings());
		    return pstmt.executeUpdate();
		  }catch (Exception e) {
		 	e.printStackTrace();
		  }
		  return -1;
	}
	
	// 청소&목욕 데이터베이스 전송
		public int dogFood(Dog dog) {
			  String sql = "insert into dogFood values(?, ?, ?, ?, ?, ?, ?)";
			  try {
			    pstmt = conn.prepareStatement(sql);
			    pstmt.setString(1, dog.getDogName());
			    pstmt.setString(2, dog.getFoodChoice1());
			    pstmt.setString(3, dog.getFoodChoice2());
			    pstmt.setString(4, dog.getFoodDate());
			    pstmt.setString(5, dog.getFoodName());
			    pstmt.setString(6, dog.getPrice());
			    pstmt.setString(7, dog.getFoodContents());
			    return pstmt.executeUpdate();
			  }catch (Exception e) {
			 	e.printStackTrace();
			  }
			  return -1;
		}
		
	// 사료&간식 데이터베이스 전송
			public int dogClean(Dog dog) {
				  String sql = "insert into dogClean values(?, ?, ?, ?, ?)";
				  try {
				    pstmt = conn.prepareStatement(sql);
				    pstmt.setString(1, dog.getDogName());
				    pstmt.setString(2, dog.getCleanChoice1());
				    pstmt.setString(3, dog.getCleanChoice2());
				    pstmt.setString(4, dog.getCleanDate());
				    pstmt.setString(5, dog.getCleanContents());
				    return pstmt.executeUpdate();
				  }catch (Exception e) {
				 	e.printStackTrace();
				  }
				  return -1;
			}
	
	// 반려묘 기본 정보를 출력
	public ArrayList<Dog> DogInfo(){
		ArrayList<Dog> list = new ArrayList<Dog>();
		try {
			String sql = "select * from dog";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Dog dog =  new Dog();
				dog.setDogName(rs.getString("dogName"));
				dog.setDogGender(rs.getString("dogGender"));
				dog.setDogAge(rs.getString("dogAge"));
				dog.setDogType(rs.getString("dogType"));
				list.add(dog);
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
	
	// 검색한 반려묘 정보를 출력
	
	// 반려묘 정보 수정
	public int update(String catName, String catGender, String catAge, String catType) {
		String sql = "update cat set catName = ?, catGender = ?, catGender = ?, catType = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, catName);
			pstmt.setString(2, catGender);
			pstmt.setString(3, catGender);
			pstmt.setString(3, catType);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	

}
