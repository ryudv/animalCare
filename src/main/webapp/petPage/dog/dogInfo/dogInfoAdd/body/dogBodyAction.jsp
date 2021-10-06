<%@page import="java.io.PrintWriter"%>
<%@page import="dog.DogDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="dog" class="dog.Dog" scope="page" />
<jsp:setProperty name="dog" property="dogName" />
<jsp:setProperty name="dog" property="recordDate" />
<jsp:setProperty name="dog" property="weight" />
<jsp:setProperty name="dog" property="disease" />
<jsp:setProperty name="dog" property="otherThings" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	PrintWriter script = response.getWriter();
	if(dog.getDogName() == null) {
		script.println("<script>");
		script.println("alert('반려견 이름을 입력하세요')");
		script.println("history.back()");
		script.println("</script>");
	} else if(dog.getRecordDate() == null) {
		script.println("<script>");
		script.println("alert('작성일을 입력하세요')");
		script.println("history.back()");
		script.println("</script>");
	} else if(dog.getWeight() == null) {
		script.println("<script>");
		script.println("alert('몸무게를 입력하세요')");
		script.println("history.back()");
		script.println("</script>");
 	} else if(dog.getDisease() == null) {
		script.println("<script>");
		script.println("alert('질환을 입력하세요')");
		script.println("history.back()");
		script.println("</script>");
	} else if(dog.getOtherThings() == null) {
		script.println("<script>");
		script.println("alert('기타 내용을 입력하세요')");
		script.println("history.back()");
		script.println("</script>");
	} else {
		DogDAO dogDAO = new DogDAO();
		int result = dogDAO.dogBody(dog);
		session.setAttribute("dogName", dog.getDogName());
		script.println("<script>");
		script.println("alert('신체 정보가 등록되었습니다')");
		script.println("location.href='../dogInfoAdd.jsp'");
		script.println("</script>");
	}
%>
</body>
</html>