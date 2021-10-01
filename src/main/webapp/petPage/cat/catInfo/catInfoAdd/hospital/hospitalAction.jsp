<%@page import="java.io.PrintWriter"%>
<%@page import="cat.CatDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="cat" class="cat.Cat" scope="page" />
<jsp:setProperty name="cat" property="catName" />
<jsp:setProperty name="cat" property="hospitalName" />
<jsp:setProperty name="cat" property="visitDate" />
<jsp:setProperty name="cat" property="symptom" />
<jsp:setProperty name="cat" property="treatment" />
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
	if(cat.getCatName() == null) {
		script.println("<script>");
		script.println("alert('반려묘 이름을 입력하세요')");
		script.println("history.back()");
		script.println("</script>");
	} else if(cat.getHospitalName() == null) {
		script.println("<script>");
		script.println("alert('병원 이름을 입력하세요')");
		script.println("history.back()");
		script.println("</script>");
	} else if(cat.getVisitDate() == null) {
		script.println("<script>");
		script.println("alert('병원 방문일을 입력하세요')");
		script.println("history.back()");
		script.println("</script>");
 	} else if(cat.getSymptom() == null) {
		script.println("<script>");
		script.println("alert('증상을 입력하세요')");
		script.println("history.back()");
		script.println("</script>");
	} else if(cat.getTreatment() == null) {
		script.println("<script>");
		script.println("alert('진료내용을 입력하세요')");
		script.println("history.back()");
		script.println("</script>");
	} else {
		CatDAO catDAO = new CatDAO();
		int result = catDAO.hospital(cat);
		session.setAttribute("catName", cat.getCatName());
		script.println("<script>");
		script.println("alert('진료 기록이 등록되었습니다')");
		script.println("location.href='hospital.jsp'");
		script.println("</script>");
		
	}
%>
</body>
</html>