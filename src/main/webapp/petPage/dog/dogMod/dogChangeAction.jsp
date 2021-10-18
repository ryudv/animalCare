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
		// 현재 세션 상태를 체크한다
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
		
		if(request.getParameter("dogGender") == null || request.getParameter("dogAge") == null || request.getParameter("dogType") == null
				|| request.getParameter("dogGender").equals("") || request.getParameter("dogAge").equals("") || request.getParameter("dogType").equals("")){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다')");
				script.println("history.back()");
				script.println("</script>");
			}else{
				// 정상적으로 입력이 되었다면 글 수정 로직을 수행한다
				DogDAO dogDAO = new DogDAO();
				int result = dogDAO.update(request.getParameter("dogGender"), request.getParameter("dogAge"), request.getParameter("dogType"));
				// 데이터베이스 오류인 경우
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글 수정하기에 실패했습니다')");
					script.println("history.back()");
					script.println("</script>");
				// 글 수정이 정상적으로 실행되면 알림창을 띄우고 게시판 메인으로 이동한다
				}else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('반려견 정보가 수정되었습니다')");
					script.println("location.href='dogMod.jsp'");
					script.println("</script>");
				}
			
		}
	
	%>
</body>
</html>