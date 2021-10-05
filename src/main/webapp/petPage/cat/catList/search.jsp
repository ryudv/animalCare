<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="cat.CatDAO" %>
<%@ page import="cat.Cat" %>
<jsp:useBean id="cat" class="cat.CatDAO"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String searchName;
	searchName = request.getParameter("searchName");
	if(searchName == null || searchName.trim().equals("")) {
%>

	<script>
		alert("반려묘 이름을 검색하세요.");
		history.back();
	</script>	

<%
	} else {
		ArrayList<Cat> list = cat.CatInfo();
		for(Cat cc : list) {
			if(cc.getCatName().equals(searchName)) {
				%>
					<%= cc.getCatName() %>
												
				<%
				return;
			} else {
				%>
				
				<script>
					alert("등록되지 않은 이름입니다");
					history.back();
				</script>	
				
				<%
				return;
			}
		}
%>
		
<%
	}
%>

</body>
</html>