<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dog.DogDAO" %>
<%@ page import="dog.Dog" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html;charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
		DogDAO dogDAO = new DogDAO();
		int result = dogDAO.delete(request.getParameter("dogName"));
		if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('정보 삭제하기에 실패했습니다')");
			script.println("history.back()");
			script.println("</script>");
		}else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('반려견 정보가 삭제되었습니다')");
			script.println("location.href='../dogMod.jsp'");
			script.println("</script>");
		}
	%>
</body>
</html>