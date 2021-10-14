package dog;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import cat.Cat;

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
	
	// 반려견 신체기록 기록 데이터베이스 전송
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
			  String sql = "insert into dogFood values(?, ?, ?, ?, ?, ?)";
			  try {
			    pstmt = conn.prepareStatement(sql);
			    pstmt.setString(1, dog.getDogName());
			    pstmt.setString(2, dog.getFoodChoice());
			    pstmt.setString(3, dog.getFoodDate());
			    pstmt.setString(4, dog.getFoodName());
			    pstmt.setString(5, dog.getPrice());
			    pstmt.setString(6, dog.getFoodContents());
			    return pstmt.executeUpdate();
			  }catch (Exception e) {
			 	e.printStackTrace();
			  }
			  return -1;
		}
		
	// 사료&간식 데이터베이스 전송
			public int dogClean(Dog dog) {
				  String sql = "insert into dogClean values(?, ?, ?, ?)";
				  try {
				    pstmt = conn.prepareStatement(sql);
				    pstmt.setString(1, dog.getDogName());
				    pstmt.setString(2, dog.getCleanChoice());
				    pstmt.setString(3, dog.getCleanDate());
				    pstmt.setString(4, dog.getCleanContents());
				    return pstmt.executeUpdate();
				  }catch (Exception e) {
				 	e.printStackTrace();
				  }
				  return -1;
			}
	
	
	// 반려견 기본 정보를 출력
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
			} 
			return list;
		}
		
		// 진료 기록을 출력
		public ArrayList<Dog> hSearch(){
			ArrayList<Dog> hList = new ArrayList<Dog>();
			try {
				String sql = "select * from dogHospital";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
					Dog dog =  new Dog();
					dog.setDogName(rs.getString("dogName"));
					dog.setHospitalName(rs.getString("hospitalName"));
					dog.setVisitDate(rs.getString("visitDate"));
					dog.setSymptom(rs.getString("symptom"));
					dog.setTreatment(rs.getString("treatment"));
					hList.add(dog);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} 
			return hList;
		}
		
		// 청소&목욕 정보를 출력
			public ArrayList<Dog> cSearch(){
				ArrayList<Dog> cList = new ArrayList<Dog>();
				try {
					String sql = "select * from dogClean";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						Dog dog =  new Dog();
						dog.setDogName(rs.getString("dogName"));
						dog.setCleanChoice(rs.getString("cleanChoice"));
						dog.setCleanDate(rs.getString("cleanDate"));
						dog.setCleanContents(rs.getString("cleanContents"));
						cList.add(dog);
					}
				} catch (Exception e) {
					e.printStackTrace();
				} 
				return cList;
			}
			
		// 사료&간식 정보를 출력
			public ArrayList<Dog> fSearch(){
				ArrayList<Dog> fList = new ArrayList<Dog>();
				try {
					String sql = "select * from dogFood";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						Dog dog =  new Dog();
						dog.setDogName(rs.getString("dogName"));
						dog.setFoodChoice(rs.getString("foodChoice"));
						dog.setFoodDate(rs.getString("foodDate"));
						dog.setFoodName(rs.getString("foodName"));
						dog.setPrice(rs.getString("price"));
						dog.setFoodContents(rs.getString("foodContents"));
						fList.add(dog);
					}
				} catch (Exception e) {
					e.printStackTrace();
				} 
				return fList;
			}
			
		// 신체 정보를 출력
			public ArrayList<Dog> bSearch(){
				ArrayList<Dog> bList = new ArrayList<Dog>();
				try {
					String sql = "select * from dogBody";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						Dog dog =  new Dog();
						dog.setDogName(rs.getString("dogName"));
						dog.setRecordDate(rs.getString("recordDate"));
						dog.setWeight(rs.getString("weight"));
						dog.setDisease(rs.getString("disease"));
						dog.setOtherThings(rs.getString("otherThings"));
						bList.add(dog);
					}
				} catch (Exception e) {
					e.printStackTrace();
				} 
				return bList;
			}
		
		// 반려견 정보 수정
		public int update(String dogGender, String dogAge, String dogType) {
			String sql = "update dog set dogGender = ?, dogAge = ?, dogType = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dogGender);
				pstmt.setString(2, dogAge);
				pstmt.setString(3, dogType);
				return pstmt.executeUpdate();
			}catch (Exception e) {
				e.printStackTrace();
			}
			return -1;
		}
		
		// 반려견 정보 삭제
		public int delete(String dogName) {
			String sql = "delete from dog where dogName = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dogName);
				return pstmt.executeUpdate();
			}catch (Exception e) {
				e.printStackTrace();
			}
			return -1; 
		}
	

}
