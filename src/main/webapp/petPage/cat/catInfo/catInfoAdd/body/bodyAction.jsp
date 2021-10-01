<%@page import="java.io.PrintWriter"%>
<%@page import="cat.CatDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="cat" class="cat.Cat" scope="page" />
<jsp:setProperty name="cat" property="catName" />
<jsp:setProperty name="cat" property="recordDate" />
<jsp:setProperty name="cat" property="weight" />
<jsp:setProperty name="cat" property="disease" />
<jsp:setProperty name="cat" property="otherThings" />
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
	} else if(cat.getRecordDate() == null) {
		script.println("<script>");
		script.println("alert('작성일을 입력하세요')");
		script.println("history.back()");
		script.println("</script>");
	} else if(cat.getWeight() == null) {
		script.println("<script>");
		script.println("alert('몸무게를 입력하세요')");
		script.println("history.back()");
		script.println("</script>");
 	} else if(cat.getDisease() == null) {
		script.println("<script>");
		script.println("alert('질환을 입력하세요')");
		script.println("history.back()");
		script.println("</script>");
	} else if(cat.getOtherThings() == null) {
		script.println("<script>");
		script.println("alert('기타 내용을 입력하세요')");
		script.println("history.back()");
		script.println("</script>");
	} else {
		CatDAO catDAO = new CatDAO();
		int result = catDAO.catBody(cat);
		session.setAttribute("catName", cat.getCatName());
		script.println("<script>");
		script.println("alert('신체 정보가 등록되었습니다')");
		script.println("location.href='../catInfoAdd.jsp'");
		script.println("</script>");
	}
%>
</body>
</html>