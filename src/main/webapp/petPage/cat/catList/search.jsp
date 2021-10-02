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
	String catName;
	catName = request.getParameter("catName");
	if(catName==null||catName.trim().equals("")){
%>

	<script>
		alert("반려묘 이름을 검색하세요.");
		history.back();
	</script>
	
<%
	} else {
		%>
		<script>
		location.href="catListPrint.jsp";
	</script>
<%
	} 
		%>
<%-- 		ArrayList<Cat> list = cat.CatInfo();
		for(Cat dto : list){
%>
			<%=dto.getCatName() %>
			<%=dto.getCatGender() %>
			<%=dto.getCatAge() %>
			<%=dto.getCatType() %>
	<%
		}
	%>
<%
	} 
%> --%>
</body>
</html>