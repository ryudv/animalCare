<%@page import="java.io.PrintWriter"%>
<%@page import="cat.CatDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="cat" class="cat.Cat" scope="page" />
<jsp:setProperty name="cat" property="catName" />
<jsp:setProperty name="cat" property="foodChoice" />
<jsp:setProperty name="cat" property="foodDate" />
<jsp:setProperty name="cat" property="foodName" />
<jsp:setProperty name="cat" property="price" />
<jsp:setProperty name="cat" property="foodContents" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	PrintWriter script = response.getWriter();
	if(cat.getCatName() == null) {
		script.println("<script>");
		script.println("alert('반려묘 이름을 입력하세요')");
		script.println("history.back()");
		script.println("</script>");
	} else if(cat.getFoodChoice() == null) {
		script.println("<script>");
		script.println("alert('사료, 간식 목록 중 한가지를 체크하세요')");
		script.println("history.back()");
		script.println("</script>");		
	} else if(cat.getFoodDate() == null) {
		script.println("<script>");
		script.println("alert('구매일을 입력하세요')");
		script.println("history.back()");
		script.println("</script>");
 	} else if(cat.getFoodName() == null) {
		script.println("<script>");
		script.println("alert('사료 or 간식 이름을 입력하세요')");
		script.println("history.back()");
		script.println("</script>");
 	} else if(cat.getFoodContents() == null) {
 		script.println("<script>");
		script.println("alert('기타 내용을 입력하세요')");
		script.println("history.back()");
		script.println("</script>");
 	} else {
		CatDAO catDAO = new CatDAO();
		int result = catDAO.food(cat);
		session.setAttribute("catName", cat.getCatName());
		script.println("<script>");
		script.println("alert('사료&간식 정보가 등록되었습니다')");
		script.println("location.href='../catInfoAdd.jsp'");
		script.println("</script>");
	}
%>
</body>
</html>