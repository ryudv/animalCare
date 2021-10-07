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
	public int sign(String catName, String catGender, String catAge, String catType, String userId) {
		  String sql = "insert into cat values(?, ?, ?, ?, ?)";
		  try {
		    pstmt = conn.prepareStatement(sql);
		    pstmt.setString(1, catName);
		    pstmt.setString(2, catGender);
		    pstmt.setString(3, catAge);
		    pstmt.setString(4, catType);
		    pstmt.setString(5, userId);
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
	
	// 사료&간식 데이터베이스 전송
		public int food(Cat cat) {
			  String sql = "insert into food values(?, ?, ?, ?, ?, ?)";
			  try {
			    pstmt = conn.prepareStatement(sql);
			    pstmt.setString(1, cat.getCatName());
			    pstmt.setString(2, cat.getFoodChoice());
			    pstmt.setString(3, cat.getFoodDate());
			    pstmt.setString(4, cat.getFoodName());
			    pstmt.setString(5, cat.getPrice());
			    pstmt.setString(6, cat.getFoodContents());
			    return pstmt.executeUpdate();
			  }catch (Exception e) {
			 	e.printStackTrace();
			  }
			  return -1;
		}
		
	//  청소&목욕 데이터베이스 전송
			public int clean(Cat cat) {
				  String sql = "insert into clean values(?, ?, ?, ?)";
				  try {
				    pstmt = conn.prepareStatement(sql);
				    pstmt.setString(1, cat.getCatName());
				    pstmt.setString(2, cat.getCleanChoice());
				    pstmt.setString(3, cat.getCleanDate());
				    pstmt.setString(4, cat.getCleanContents());
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
		} 
		return list;
	}
	
	// 진료 기록을 출력
	public ArrayList<Cat> hSearch(){
		ArrayList<Cat> hList = new ArrayList<Cat>();
		try {
			String sql = "select * from hospital";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Cat cat =  new Cat();
				cat.setCatName(rs.getString("catName"));
				cat.setHospitalName(rs.getString("hospitalName"));
				cat.setVisitDate(rs.getString("visitDate"));
				cat.setSymptom(rs.getString("symptom"));
				cat.setTreatment(rs.getString("treatment"));
				hList.add(cat);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return hList;
	}
	
	// 청소&목욕 정보를 출력
		public ArrayList<Cat> cSearch(){
			ArrayList<Cat> cList = new ArrayList<Cat>();
			try {
				String sql = "select * from clean";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
					Cat cat =  new Cat();
					cat.setCatName(rs.getString("catName"));
					cat.setCleanChoice(rs.getString("cleanChoice"));
					cat.setCleanDate(rs.getString("cleanDate"));
					cat.setCleanContents(rs.getString("cleanContents"));
					cList.add(cat);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} 
			return cList;
		}
		
	// 사료&간식 정보를 출력
		public ArrayList<Cat> fSearch(){
			ArrayList<Cat> fList = new ArrayList<Cat>();
			try {
				String sql = "select * from food";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
					Cat cat =  new Cat();
					cat.setCatName(rs.getString("catName"));
					cat.setFoodChoice(rs.getString("foodChoice"));
					cat.setFoodDate(rs.getString("foodDate"));
					cat.setFoodName(rs.getString("foodName"));
					cat.setPrice(rs.getString("price"));
					cat.setFoodContents(rs.getString("foodContents"));
					fList.add(cat);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} 
			return fList;
		}
		
	// 신체 정보를 출력
		public ArrayList<Cat> bSearch(){
			ArrayList<Cat> bList = new ArrayList<Cat>();
			try {
				String sql = "select * from catBody";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
					Cat cat =  new Cat();
					cat.setCatName(rs.getString("catName"));
					cat.setRecordDate(rs.getString("recordDate"));
					cat.setWeight(rs.getString("weight"));
					cat.setDisease(rs.getString("disease"));
					cat.setOtherThings(rs.getString("otherThings"));
					bList.add(cat);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} 
			return bList;
		}
	
	// 반려묘 정보 수정
	public int update(String catName, String catGender, String catAge, String catType) {
		String sql = "update cat set catName = ?, catGender = ?, catAge = ?, catType = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, catName);
			pstmt.setString(2, catGender);
			pstmt.setString(3, catAge);
			pstmt.setString(4, catType);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	

}
