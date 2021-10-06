<%@page import="java.io.PrintWriter"%>
<%@page import="dog.DogDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="dog" class="dog.Dog" scope="page" />
<jsp:setProperty name="dog" property="dogName" />
<jsp:setProperty name="dog" property="hospitalName" />
<jsp:setProperty name="dog" property="visitDate" />
<jsp:setProperty name="dog" property="symptom" />
<jsp:setProperty name="dog" property="treatment" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	/* 등록된 반려동물만 입력할수 있도록 해야함 */
	
	PrintWriter script = response.getWriter();
	if(dog.getDogName() == null) {
		script.println("<script>");
		script.println("alert('반려견 이름을 입력하세요')");
		script.println("history.back()");
		script.println("</script>");
	} else if(dog.getHospitalName() == null) {
		script.println("<script>");
		script.println("alert('병원 이름을 입력하세요')");
		script.println("history.back()");
		script.println("</script>");
	} else if(dog.getVisitDate() == null) {
		script.println("<script>");
		script.println("alert('병원 방문일을 입력하세요')");
		script.println("history.back()");
		script.println("</script>");
 	} else if(dog.getSymptom() == null) {
		script.println("<script>");
		script.println("alert('증상을 입력하세요')");
		script.println("history.back()");
		script.println("</script>");
	} else if(dog.getTreatment() == null) {
		script.println("<script>");
		script.println("alert('진료내용을 입력하세요')");
		script.println("history.back()");
		script.println("</script>");
	} else {
		DogDAO dogDAO = new DogDAO();
		int result = dogDAO.dogHospital(dog);
		session.setAttribute("dogName", dog.getDogName());
		script.println("<script>");
		script.println("alert('진료 기록이 등록되었습니다')");
		script.println("location.href='../dogInfoAdd.jsp'");
		script.println("</script>");
		
	}
%>
</body>
</html>