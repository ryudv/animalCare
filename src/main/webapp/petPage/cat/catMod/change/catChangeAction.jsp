<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="cat.CatDAO" %>
<%@ page import="cat.Cat" %>
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
		
		if(request.getParameter("catName") == null || request.getParameter("catGender") == null || request.getParameter("catAge") == null || request.getParameter("catType") == null
				|| request.getParameter("catName").equals("") || request.getParameter("catGender").equals("") || request.getParameter("catAge").equals("") || request.getParameter("catType").equals("")){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다')");
				script.println("history.back()");
				script.println("</script>");
			}else{
				// 정상적으로 입력이 되었다면 글 수정 로직을 수행한다
				CatDAO catDAO = new CatDAO();
				int result = catDAO.update(request.getParameter("catName"), request.getParameter("catGender"), request.getParameter("catAge"), request.getParameter("catType"));
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
					script.println("alert('반려묘 정보가 수정되었습니다')");
					script.println("location.href='catChange.jsp'");
					script.println("</script>");
				}
			
		}
	
	%>
</body>
</html>