<%@page import="java.io.PrintWriter"%>
<%@page import="cat.CatDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="cat" class="cat.Cat" scope="page" />
<jsp:setProperty name="cat" property="catName" />
<jsp:setProperty name="cat" property="catGender" />
<jsp:setProperty name="cat" property="catAge" />
<jsp:setProperty name="cat" property="catType" />
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
	PrintWriter script = response.getWriter();
	
	if(session.getAttribute("userId") != null){
		userId = (String)session.getAttribute("userId");
	}
	
	if(cat.getCatName() == null) {
		script.println("<script>");
		script.println("alert('반려묘 이름을 입력하세요')");
		script.println("history.back()");
		script.println("</script>");
	} else if(cat.getCatGender() == null) {
		script.println("<script>");
		script.println("alert('반려묘 성별을 선택하세요')");
		script.println("history.back()");
		script.println("</script>");
	} else if(cat.getCatAge() == null) {
		script.println("<script>");
		script.println("alert('반려묘 나이를 입력하세요')");
		script.println("history.back()");
		script.println("</script>");
 	} else if(cat.getCatType() == null) {
		script.println("<script>");
		script.println("alert('반려묘 품종을 입력하세요')");
		script.println("history.back()");
		script.println("</script>");
	} else {
		CatDAO catDAO = new CatDAO();
		int result = catDAO.sign(cat.getCatName(), cat.getCatGender(), cat.getCatAge(), cat.getCatType(), userId);
		if(result == -1){
			script.println("<script>");
			script.println("alert('이미 등록된 이름입니다')");
			script.println("history.back()");
			script.println("</script>");
		}else {
			session.setAttribute("catName", cat.getCatName());
			
			script.println("<script>");
			script.println("alert('반려묘 정보가 등록되었습니다')");
			script.println("location.href='../../catPage.jsp'");
			script.println("</script>");
		}
	}
%>
</body>
</html>