<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%-- <jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" /> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//현재 세션 상태를 체크한다
	String userId = null;
	if(session.getAttribute("userId") != null){
		userId = (String)session.getAttribute("userId");
	}
	// 로그인을 한 사람만 글을 쓸 수 있도록 코드를 수정한다
	if(userId == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요합니다.')");
		script.println("location.href='../../../loginPage/loginPage.jsp'");
		script.println("</script>");
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='catList.jsp'");
		script.println("</script>");
	}
%>
</body>
</html>