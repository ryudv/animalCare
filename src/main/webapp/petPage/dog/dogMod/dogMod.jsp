<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dog.DogDAO" %>
<%@ page import="dog.Dog" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html;charset=utf-8"); %>
<jsp:useBean id="dog" class="dog.DogDAO"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>반려동물 관리 프로그램</title>
    <link rel="stylesheet" href="../../../css/defaultStyle.css">
    <link rel="stylesheet" href="dogModStyle.css">
    <link href="https://fonts.googleapis.com/css2?family=Urbanist:wght@100;300;500;800&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/e133d6c60e.js" crossorigin="anonymous"></script>
    <script src="../../../mainPageScript.js"></script>
</head>
<body onload="makeCursor()">
	<div id="foot" style="position: absolute;">
		<img src="../../../images/foot.png" width="30px" height="30px">
	</div>
	<script type="text/javascript">
		function keywordCheck(){
			 if(document.frm.searchName.value==''){ 
				 alert("반려견 이름을 입력하세요"); 
				 document.frm.searchName.focus(); 
				 return false; 
			 }
		 else return true;
		}
	</script>
	<%
		String userId = null;
		if(session.getAttribute("userId") != null) {
			userId = (String)session.getAttribute("userId");
		}
	%>
    <div class="loginBtn">
        <div class="memInfo">
            <span>welcome, <%=userId %> 😊</span>
        </div>
        <div class="iconBtn">
            <a href="../../../mainPage.jsp"><i class="fas fa-bone"></i></a>
        </div>
        <div class="memBtn">
            <a href="../../../loginPage/logoutAction.jsp"><button>LOGOUT</button></a>
        </div>
    </div>
    
	<!-- 메인페이지 -->
    <div class="mainSection">
		<img src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pg0KPCEtLSBHZW5lcmF0b3I6IEFkb2JlIElsbHVzdHJhdG9yIDE5LjAuMCwgU1ZHIEV4cG9ydCBQbHVnLUluIC4gU1ZHIFZlcnNpb246IDYuMDAgQnVpbGQgMCkgIC0tPg0KPHN2ZyB2ZXJzaW9uPSIxLjEiIGlkPSJDYXBhXzEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4Ig0KCSB2aWV3Qm94PSIwIDAgNTEyIDUxMiIgc3R5bGU9ImVuYWJsZS1iYWNrZ3JvdW5kOm5ldyAwIDAgNTEyIDUxMjsiIHhtbDpzcGFjZT0icHJlc2VydmUiPg0KPGNpcmNsZSBzdHlsZT0iZmlsbDojMDBCQUZGOyIgY3g9IjI1NiIgY3k9IjI1NiIgcj0iMjU2Ii8+DQo8cGF0aCBzdHlsZT0iZmlsbDojMDA4Q0MzOyIgZD0iTTEwNC45NjcsMjE4LjA4NUwzNzEuNDMsNDg0LjU0OEM0NTQuODI0LDQ0Mi4zNDUsNTEyLDM1NS44NTQsNTEyLDI1Ng0KCWMwLTE3LjY2OS0xLjc5LTM0LjkyLTUuMTk5LTUxLjU4MWwtOTcuOTY0LTk3Ljk2NUwxMDQuOTY3LDIxOC4wODV6Ii8+DQo8cGF0aCBzdHlsZT0iZmlsbDojRTBFMEUwOyIgZD0iTTEwMi45MjIsNDYxLjIwOEMxNDUuNjE4LDQ5My4xMDksMTk4LjYwMyw1MTIsMjU2LDUxMmM1OS44MjcsMCwxMTQuODU4LTIwLjUyNywxNTguNDQyLTU0LjkxNw0KCUwzNTAuMjUsMzI0aC0xODguNUwxMDIuOTIyLDQ2MS4yMDh6Ii8+DQo8cGF0aCBzdHlsZT0iZmlsbDojQzBDMEMwOyIgZD0iTTQxNC40NDIsNDU3LjA4M0wzNTAuMjUsMzI0aC05NC4yOTh2MTg4YzAuMDE2LDAsMC4wMzIsMCwwLjA0OCwwDQoJQzMxNS44MjcsNTEyLDM3MC44NTgsNDkxLjQ3Myw0MTQuNDQyLDQ1Ny4wODN6Ii8+DQo8cGF0aCBzdHlsZT0iZmlsbDojRTBFMEUwOyIgZD0iTTExNS43MDgsMjIxLjI0MUwxMTUuNzA4LDIyMS4yNDFjLTEwLjk3NywwLTE5Ljg3NS04Ljg5OC0xOS44NzUtMTkuODc1di03OS40OTkNCgljMC0xMC45NzcsOC44OTgtMTkuODc1LDE5Ljg3NS0xOS44NzVoNTkuNjI1YzE2LjM3OCwwLDI1LjcyNywxOC42OTgsMTUuOSwzMS44bC01OS42MjUsNzkuNDk5DQoJQzEyNy44NTQsMjE4LjI5NiwxMjEuOTY0LDIyMS4yNDEsMTE1LjcwOCwyMjEuMjQxeiIvPg0KPHBhdGggc3R5bGU9ImZpbGw6I0MwQzBDMDsiIGQ9Ik0zOTYuMjkyLDIyMS4yNDJMMzk2LjI5MiwyMjEuMjQyYzEwLjk3NywwLDE5Ljg3NS04Ljg5OCwxOS44NzUtMTkuODc1di03OS40OTkNCgljMC0xMC45NzctOC44OTgtMTkuODc1LTE5Ljg3NS0xOS44NzVoLTU5LjYyNWMtMTYuMzc4LDAtMjUuNzI3LDE4LjY5Ny0xNS45LDMxLjhsNTkuNjI1LDc5LjQ5OQ0KCUMzODQuMTQ2LDIxOC4yOTYsMzkwLjAzNiwyMjEuMjQyLDM5Ni4yOTIsMjIxLjI0MnoiLz4NCjxwYXRoIHN0eWxlPSJmaWxsOiNGRkZGRkY7IiBkPSJNMjU2LDM4Ni41ODZMMjU2LDM4Ni41ODZjLTY3LjkxNywwLTEyMi45NzUtNTUuMDU4LTEyMi45NzUtMTIyLjk3NXYtNDYuMTYNCgljMC02Ny45MTcsNTUuMDU4LTEyMi45NzUsMTIyLjk3NS0xMjIuOTc1bDAsMGM2Ny45MTcsMCwxMjIuOTc1LDU1LjA1OCwxMjIuOTc1LDEyMi45NzV2NDYuMTYNCglDMzc4Ljk3NSwzMzEuNTI4LDMyMy45MTcsMzg2LjU4NiwyNTYsMzg2LjU4NnoiLz4NCjxwYXRoIHN0eWxlPSJmaWxsOiNFMEUwRTA7IiBkPSJNMjU2LDk0LjQ3NkwyNTYsOTQuNDc2Yy0wLjAxNiwwLTAuMDMyLDAuMDAxLTAuMDQ4LDAuMDAxdjI5Mi4xMDljMC4wMTYsMCwwLjAzMiwwLjAwMSwwLjA0OCwwLjAwMQ0KCWwwLDBjNjcuOTE3LDAsMTIyLjk3NS01NS4wNTgsMTIyLjk3NS0xMjIuOTc1di00Ni4xNkMzNzguOTc1LDE0OS41MzQsMzIzLjkxNyw5NC40NzYsMjU2LDk0LjQ3NnoiLz4NCjxnPg0KCTxwYXRoIHN0eWxlPSJmaWxsOiNCM0IzQjM7IiBkPSJNMzAzLjg1NiwxMDQuMTM1Yy0xNC40MTMsMjAuOTIyLTI0LjgyOCw3NS43MTMtMjQuODI4LDkxLjY5OQ0KCQljLTAuMDAxLDE5Ljg5NiwxNi4xMjksMzYuMDI1LDM2LjAyNSwzNi4wMjVjMTQuNTU0LDAsNDcuMjMtOC42MzUsNjMuNzQxLTIxLjA1N0MzNzYuMjM0LDE2Mi43MywzNDYuMDY3LDEyMS45ODQsMzAzLjg1NiwxMDQuMTM1eiINCgkJLz4NCgk8cGF0aCBzdHlsZT0iZmlsbDojQjNCM0IzOyIgZD0iTTEzMS4xMTcsMzk1LjQ0OGMyOC4yNTgsMzQuMjg4LDczLjY2Niw1Ni41MzQsMTI0Ljg4Myw1Ni41MzRsMCwwDQoJCWM1Mi42ODQsMCw5OS4yMzQtMjMuNTMsMTI3LjI4MS01OS41MDJsLTE0Ljk5Mi0zMS4wODNjLTI4LjI1NywyNi41NDktNjguMTE0LDQzLjA5Ni0xMTIuMjg4LDQzLjA5NmwwLDANCgkJYy00My40MzUsMC04Mi42ODUtMTYuMDA1LTExMC44NDktNDEuNzc4TDEzMS4xMTcsMzk1LjQ0OHoiLz4NCjwvZz4NCjxwYXRoIHN0eWxlPSJmaWxsOiM5OTk5OTk7IiBkPSJNMzY4LjI4OCwzNjEuMzk3Yy0yOC4yNTcsMjYuNTQ5LTY4LjExNCw0My4wOTYtMTEyLjI4OCw0My4wOTZsMCwwYy0wLjAxNiwwLTAuMDMyLDAtMC4wNDgsMHY0Ny40ODgNCgljMC4wMTYsMCwwLjAzMiwwLjAwMSwwLjA0OCwwLjAwMWwwLDBjNTIuNjg0LDAsOTkuMjM0LTIzLjUzLDEyNy4yODEtNTkuNTAyTDM2OC4yODgsMzYxLjM5N3oiLz4NCjxwYXRoIHN0eWxlPSJmaWxsOiMzMzMzMzM7IiBkPSJNMjk0LjExNiwyODIuNzIyYzAsOC4zMDMtNi43NTUsMTUuMDU4LTE1LjA1OSwxNS4wNThjLTguMzAzLDAtMTUuMDU4LTYuNzU1LTE1LjA1OC0xNS4wNTh2LTIzLjM0OQ0KCWwxOC40NjgtMTguNDljNi4xMjItNi4xMywxLjc4Ny0xNi42MDItNi44NzItMTYuNTk3bC0zOS4xOTIsMC4wMjNjLTguNjU4LDAuMDA1LTEyLjk5NCwxMC40ODItNi44NzIsMTYuNjA1TDI0OCwyNTkuMzgzdjIzLjM0DQoJYzAsOC4zMDMtNi43NTUsMTUuMDU4LTE1LjA1OCwxNS4wNThzLTE1LjA1OC02Ljc1NS0xNS4wNTgtMTUuMDU4aC0xNmMwLDE3LjEyNSwxMy45MzMsMzEuMDU4LDMxLjA1OCwzMS4wNTgNCgljOS4xNCwwLDE3LjM2OS0zLjk2OCwyMy4wNTgtMTAuMjcyYzUuNjg4LDYuMzA0LDEzLjkxOCwxMC4yNzIsMjMuMDU4LDEwLjI3MmMxNy4xMjYsMCwzMS4wNTktMTMuOTMzLDMxLjA1OS0zMS4wNThoLTE2LjAwMVYyODIuNzIyDQoJeiIvPg0KPHBhdGggc3R5bGU9ImZpbGw6IzFBMUExQTsiIGQ9Ik0yOTQuMTE2LDI4Mi43MjJjMCw4LjMwMy02Ljc1NSwxNS4wNTgtMTUuMDU5LDE1LjA1OGMtOC4zMDMsMC0xNS4wNTgtNi43NTUtMTUuMDU4LTE1LjA1OHYtMjMuMzQ5DQoJbDE4LjQ2OC0xOC40OWM2LjEyMi02LjEzLDEuNzg3LTE2LjYwMi02Ljg3Mi0xNi41OTdsLTIwLjIzOSwwLjAxMnY3OS44ODdjMC4yMTUtMC4yMjUsMC40MzQtMC40NDYsMC42NDMtMC42NzcNCgljNS42ODgsNi4zMDQsMTMuOTE4LDEwLjI3MiwyMy4wNTgsMTAuMjcyYzE3LjEyNiwwLDMxLjA1OS0xMy45MzMsMzEuMDU5LTMxLjA1OEwyOTQuMTE2LDI4Mi43MjJMMjk0LjExNiwyODIuNzIyeiIvPg0KPGNpcmNsZSBzdHlsZT0iZmlsbDojMzMzMzMzOyIgY3g9IjE5Ny43MSIgY3k9IjE5NS44NCIgcj0iMTEuNDEzIi8+DQo8Y2lyY2xlIHN0eWxlPSJmaWxsOiMxQTFBMUE7IiBjeD0iMzE0LjI5IiBjeT0iMTk1Ljg0IiByPSIxMS40MTMiLz4NCjxwb2x5Z29uIHN0eWxlPSJmaWxsOiNGRkIzNDQ7IiBwb2ludHM9IjI1Niw0OTYgMjIxLjU2Miw0NjEuNTYyIDI1Niw0MjcuMTA5IDI5MC40MzksNDYxLjU0NyAiLz4NCjxwb2x5Z29uIHN0eWxlPSJmaWxsOiNGRjk0NTE7IiBwb2ludHM9IjI5MC40MzgsNDYxLjU0NyAyNTYsNDI3LjEwOSAyNTUuOTUyLDQyNy4xNTcgMjU1Ljk1Miw0OTUuOTUyIDI1Niw0OTYgIi8+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8L3N2Zz4NCg==" />
		<form name="frm" method="post" action="search.jsp" onsubmit="return keywordCheck()">
			<table>
            	<tr>
            		<td colspan=2><span>write down your pet name</span></td>
            	</tr>
				<tr>
					<td><input type="text" name="searchName"></td>
					<td><input type="submit" value="SEARCH"></td>
				</tr>
			</table>
		</form>
    </div>

    <!-- sns공유 버튼 -->
    <div class="snsBtn">
        <a target="blank" href="http://www.facebook.com/share.php" title="페이스북에 공유"><i class="fab fa-facebook-square"></i></a>
        <a target="blank" href="http://twitter.com/share" title="트위터에 공유"><i class="fab fa-twitter-square"></i></a>
        <a target="blank" href="https://instagram.com" title="인스타그램에 공유"><i class="fab fa-instagram-square"></i></a>
    </div>
</body>
</html>