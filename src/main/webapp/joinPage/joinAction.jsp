<%@page import="java.io.PrintWriter"%>
<%@page import="pro_user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="pro_user" class="pro_user.Pro_user" scope="page" />
<jsp:setProperty name="pro_user" property="userId" />
<jsp:setProperty name="pro_user" property="userPwd" />
<jsp:setProperty name="pro_user" property="userPwd2" />
<jsp:setProperty name="pro_user" property="userName" />
<jsp:setProperty name="pro_user" property="userEmail" />
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
	
	if(pro_user.getUserId() == null) {
		script.println("<script>");
		script.println("alert('아이디를 입력하세요')");
		script.println("history.back()");
		script.println("</script>");
	} else if(pro_user.getUserPwd() == null) {
		script.println("<script>");
		script.println("alert('비밀번호를 입력하세요')");
		script.println("history.back()");
		script.println("</script>");
	} else if(pro_user.getUserPwd2() == null) {
		script.println("<script>");
		script.println("alert('비밀번호를 한번 더 입력하세요')");
		script.println("history.back()");
		script.println("</script>");
 	} else if(!(pro_user.getUserPwd().equals(pro_user.getUserPwd2()))) {
		script.println("<script>");
		script.println("alert('비밀번호가 틀렸습니다')");
		script.println("history.back()");
		script.println("</script>"); 
	} else if(pro_user.getUserName() == null) {
		script.println("<script>");
		script.println("alert('이름을 입력하세요')");
		script.println("history.back()");
		script.println("</script>");
	} else if(pro_user.getUserEmail() == null) {
		script.println("<script>");
		script.println("alert('이메일을 입력하세요')");
		script.println("history.back()");
		script.println("</script>");
	} else {
		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(pro_user);
		if(result == -1){
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다')");
			script.println("history.back()");
			script.println("</script>");
		}else {
			session.setAttribute("userId", pro_user.getUserId());
			
			script.println("<script>");
			script.println("alert('회원가입 성공')");
			script.println("location.href='../mainPage.jsp'");
			script.println("</script>");
		}
	}
%>
</body>
</html>