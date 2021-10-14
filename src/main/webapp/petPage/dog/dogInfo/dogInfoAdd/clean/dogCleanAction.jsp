<%@page import="java.io.PrintWriter"%>
<%@page import="dog.DogDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="dog" class="dog.Dog" scope="page" />
<jsp:setProperty name="dog" property="dogName" />
<jsp:setProperty name="dog" property="cleanChoice" />
<jsp:setProperty name="dog" property="cleanDate" />
<jsp:setProperty name="dog" property="cleanContents" />
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
	} else if(dog.getCleanChoice() == null) {
		script.println("<script>");
		script.println("alert('목욕, 청소 목록 중 한가지를 체크하세요')");
		script.println("history.back()");
		script.println("</script>");		
	} else if(dog.getCleanDate() == null) {
		script.println("<script>");
		script.println("alert('날짜를 입력하세요')");
		script.println("history.back()");
		script.println("</script>");
 	} else {
 		DogDAO dogDAO = new DogDAO();
		int result = dogDAO.dogClean(dog);
		session.setAttribute("dogName", dog.getDogName());
		script.println("<script>");
		script.println("alert('목욕&청소 정보가 등록되었습니다')");
		script.println("location.href='../dogInfoAdd.jsp'");
		script.println("</script>");
	}
%>
</body>
</html>