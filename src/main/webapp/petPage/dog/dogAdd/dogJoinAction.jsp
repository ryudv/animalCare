<%@page import="java.io.PrintWriter"%>
<%@page import="dog.DogDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="dog" class="dog.Dog" scope="page" />
<jsp:setProperty name="dog" property="dogName" />
<jsp:setProperty name="dog" property="dogGender" />
<jsp:setProperty name="dog" property="dogAge" />
<jsp:setProperty name="dog" property="dogType" />
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
	
	if(dog.getDogName() == null) {
		script.println("<script>");
		script.println("alert('반려견 이름을 입력하세요')");
		script.println("history.back()");
		script.println("</script>");
	} else if(dog.getDogGender() == null) {
		script.println("<script>");
		script.println("alert('반려견 성별을 선택하세요')");
		script.println("history.back()");
		script.println("</script>");
	} else if(dog.getDogAge() == null) {
		script.println("<script>");
		script.println("alert('반려견 나이를 입력하세요')");
		script.println("history.back()");
		script.println("</script>");
 	} else if(dog.getDogType() == null) {
		script.println("<script>");
		script.println("alert('반려견 품종을 입력하세요')");
		script.println("history.back()");
		script.println("</script>");
	} else {
		DogDAO dogDAO = new DogDAO();
		int result = dogDAO.dogSign(dog.getDogName(), dog.getDogGender(), dog.getDogAge(), dog.getDogType(), userId);
		if(result == -1){
			script.println("<script>");
			script.println("alert('이미 등록된 이름입니다')");
			script.println("history.back()");
			script.println("</script>");
		}else {
			session.setAttribute("dogName", dog.getDogName());
			
			script.println("<script>");
			script.println("alert('반려견 정보가 등록되었습니다')");
			script.println("location.href='../../dogPage.jsp'");
			script.println("</script>");
		}
	}
%>
</body>
</html>