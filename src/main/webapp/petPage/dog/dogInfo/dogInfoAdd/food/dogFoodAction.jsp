<%@page import="java.io.PrintWriter"%>
<%@page import="dog.DogDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="dog" class="dog.Dog" scope="page" />
<jsp:setProperty name="dog" property="dogName" />
<jsp:setProperty name="dog" property="foodChoice" />
<jsp:setProperty name="dog" property="foodDate" />
<jsp:setProperty name="dog" property="foodName" />
<jsp:setProperty name="dog" property="price" />
<jsp:setProperty name="dog" property="foodContents" />
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
	} else if(dog.getFoodChoice() == null) {
		script.println("<script>");
		script.println("alert('사료, 간식 목록 중 한가지를 체크하세요')");
		script.println("history.back()");
		script.println("</script>");		
	} else if(dog.getFoodDate() == null) {
		script.println("<script>");
		script.println("alert('구매일을 입력하세요')");
		script.println("history.back()");
		script.println("</script>");
 	} else if(dog.getFoodName() == null) {
		script.println("<script>");
		script.println("alert('사료 or 간식 이름을 입력하세요')");
		script.println("history.back()");
		script.println("</script>");
 	} else {
 		DogDAO dogDAO = new DogDAO();
		int result = dogDAO.dogFood(dog);
		session.setAttribute("dogName", dog.getDogName());
		script.println("<script>");
		script.println("alert('사료&간식 정보가 등록되었습니다')");
		script.println("location.href='../dogInfoAdd.jsp'");
		script.println("</script>");
	}
%>
</body>
</html>