<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>반려동물 관리 프로그램</title>
    <link rel="stylesheet" href="../css/defaultStyle.css">
    <link rel="stylesheet" href="petPageStyle.css">
    <link href="https://fonts.googleapis.com/css2?family=Urbanist:wght@100;300;500;800&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/e133d6c60e.js" crossorigin="anonymous"></script>
    <script src="../mainPageScript.js"></script>
</head>
<body onload="makeCursor()">
	<div id="foot" style="position: absolute;">
		<img src="../images/foot.png" width="30px" height="30px">
	</div>
	<%
		// 메인페이지로 이동시 세션에 값이 담겨있는지 체크
		String userId = null;
		if(session.getAttribute("userId") != null) {
			userId = (String)session.getAttribute("userId");
		}
	%>
	<%
		//로그인하지 않았을때 보여지는 화면
		if(userId == null) {
	%>
    <!-- 네비게이션 -->
    <div class="loginBtn">
        <div class="memInfo">
            <span>please login 😐</span>
        </div>
        <div class="iconBtn">
            <a href="../mainPage.jsp"><i class="fas fa-bone"></i></a>
        </div>
        <div class="memBtn">
            <a href="../loginPage/loginPage.jsp"><button>LOGIN</button></a>
            <a href="../joinPage/joinPage.jsp"><button>JOIN</button></a>
        </div>
    </div>
    <%
		//로그인 했을때 보여지는 화면
		} else {
	%>
    <div class="loginBtn">
        <div class="memInfo">
            <span>welcome, <%=userId %> 😊</span>
        </div>
        <div class="iconBtn">
            <a href="../mainPage.jsp"><i class="fas fa-bone"></i></a>
        </div>
        <div class="memBtn">
            <a href="../loginPage/logoutAction.jsp"><button>LOGOUT</button></a>
        </div>
    </div>
    <%
		}
	%>
	<!-- 메인페이지 -->
    <div class="mainSection">
    	<img src="data:image/svg+xml;base64,PHN2ZyBpZD0iQ2FwYV8xIiBlbmFibGUtYmFja2dyb3VuZD0ibmV3IDAgMCA1MTIgNTEyIiBoZWlnaHQ9IjUxMiIgdmlld0JveD0iMCAwIDUxMiA1MTIiIHdpZHRoPSI1MTIiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PGc+PGc+PGc+PGc+PGc+PGc+PGc+PHBhdGggZD0ibTEwNS42MzkgNDYzLjIxMmMtNjQuMDE5LTQ2LjUzNS0xMDUuNjM5LTEyMi4wMTMtMTA1LjYzOS0yMDcuMjEyIDAtMTQxLjM4NSAxMTQuNjE1LTI1NiAyNTYtMjU2czI1NiAxMTQuNjE1IDI1NiAyNTZjMCA4NS4yMDQtNDEuNjI1IDE2MC42ODUtMTA1LjY0OSAyMDcuMjE5eiIgZmlsbD0iI2MzODc3OCIvPjwvZz48L2c+PC9nPjwvZz48L2c+PC9nPjxwYXRoIGQ9Im0yNzguMjk3IDQ2My4yMTYgMTI4LjA1NC4wMDNjNjQuMDI0LTQ2LjUzNCAxMDUuNjQ5LTEyMi4wMTUgMTA1LjY0OS0yMDcuMjE5IDAtMjAuNzA5LTIuNDU5LTQwLjg0NC03LjEwMS02MC4xMjhsLTEwNy40OTQtMTA3LjQ5NHoiIGZpbGw9IiNhNjVkNGUiLz48Zz48cGF0aCBkPSJtMTA1LjYzOCA0NjMuMjExYzQyLjIxOCAzMC42ODggOTQuMTc2IDQ4Ljc4OSAxNTAuMzYyIDQ4Ljc4OXMxMDguMTQ0LTE4LjEwMSAxNTAuMzYyLTQ4Ljc4OWwtMzEuNzc0LTEwOC4zMzZoLTIzNy4xNzZ6IiBmaWxsPSIjZTllZGY1Ii8+PC9nPjxnPjxwYXRoIGQ9Im00MDYuMzYyIDQ2My4yMTEtMzEuNzc0LTEwOC4zMzZoLTExOC45NDR2MTU3LjEyMWMuMTE5IDAgLjIzNy4wMDQuMzU2LjAwNCA1Ni4xODYgMCAxMDguMTQ0LTE4LjEwMSAxNTAuMzYyLTQ4Ljc4OXoiIGZpbGw9IiNjZGQyZTEiLz48L2c+PGc+PHBhdGggZD0ibTEyMy42NTMgMTk5LjQ1MS05LjA1OC0xMTEuMDczIDEwOC42OTkgNDQuMDI5eiIgZmlsbD0iI2U5ZWRmNSIvPjwvZz48Zz48cGF0aCBkPSJtMzg4LjM0NyAxOTkuNDUxIDkuMDU4LTExMS4wNzMtMTA4LjY5OSA0NC4wMjl6IiBmaWxsPSIjY2RkMmUxIi8+PC9nPjxnPjxwYXRoIGQ9Im0zNzQuNTg4IDM1NC44NzVjLTcyLjc3IDQ0LjU5NC0xNjQuNDA2IDQ0LjU5NC0yMzcuMTc2IDAgMC0xNS4zNDggMC0zMC42OTcgMC00Ni4wNDUgNzIuNzcgNDQuNTk0IDE2NC40MDYgNDQuNTk0IDIzNy4xNzYgMHoiIGZpbGw9IiNmZjk1MDAiLz48L2c+PGc+PHBhdGggZD0ibTI1NS42NDQgMzQyLjI3MnY0Ni4wNDVjNDEuMjIuMDY0IDgyLjQ1NC0xMS4wODEgMTE4Ljk0NC0zMy40NDIgMC0xNS4zNDggMC0zMC42OTcgMC00Ni4wNDUtMzYuNDkgMjIuMzYxLTc3LjcyNCAzMy41MDctMTE4Ljk0NCAzMy40NDJ6IiBmaWxsPSIjZmU2YTE2Ii8+PC9nPjxnPjxwYXRoIGQ9Im0xMTIuOTAxIDI0MS42OTljMC03My4wMSA2NC4wNjgtMTMyLjE5NyAxNDMuMDk5LTEzMi4xOTdzMTQzLjA5OSA1OS4xODcgMTQzLjA5OSAxMzIuMTk3LTY0LjA2OCAxMTQuNDgtMTQzLjA5OSAxMTQuNDgtMTQzLjA5OS00MS40Ny0xNDMuMDk5LTExNC40OHoiIGZpbGw9IiNmZmYiLz48L2c+PGc+PHBhdGggZD0ibTI1NiAxMDkuNTAyYy0uMTE5IDAtLjIzNy4wMDQtLjM1Ni4wMDR2MjQ2LjY2OWMuMTE5IDAgLjIzNy4wMDMuMzU2LjAwMyA3OS4wMzIgMCAxNDMuMDk5LTQxLjQ2OSAxNDMuMDk5LTExNC40NzlzLTY0LjA2Ny0xMzIuMTk3LTE0My4wOTktMTMyLjE5N3oiIGZpbGw9IiNlOWVkZjUiLz48L2c+PGc+PGc+PGNpcmNsZSBjeD0iMTc5LjM0IiBjeT0iMjIzLjQ3MSIgZmlsbD0iIzYzNjk3OCIgcj0iMTQuODIxIi8+PC9nPjxnPjxjaXJjbGUgY3g9IjMzMi42NiIgY3k9IjIyMy40NzEiIGZpbGw9IiM0MTQ5NTIiIHI9IjE0LjgyMSIvPjwvZz48L2c+PHBhdGggZD0ibTI5Mi44NjEgMjI2LjAxNWgtNzMuNzIybDI1LjM2MSAyNS4zNnY2NS42MjJoMjN2LTY1LjYyMnoiIGZpbGw9IiM2MzY5NzgiLz48cGF0aCBkPSJtMjU1LjY0NCAyMjYuMDE1djkwLjk4MmgxMS44NTZ2LTY1LjYyMmwyNS4zNjEtMjUuMzZ6IiBmaWxsPSIjNDE0OTUyIi8+PGc+PGVsbGlwc2UgY3g9IjI1NiIgY3k9IjQwMS43ODkiIGZpbGw9IiNmZmNlMDAiIHJ4PSIyNy4zNjYiIHJ5PSIyNy4zNjciIHRyYW5zZm9ybT0ibWF0cml4KC4xNTQgLS45ODggLjk4OCAuMTU0IC0xODAuNDc1IDU5Mi43MzUpIi8+PC9nPjxnPjxwYXRoIGQ9Im0yNTYgMzc0LjQyM2MtLjExOSAwLS4yMzcuMDA3LS4zNTYuMDA5djU0LjcxNWMuMTE5LjAwMS4yMzcuMDA5LjM1Ni4wMDkgMTUuMTE0IDAgMjcuMzY3LTEyLjI1MiAyNy4zNjctMjcuMzY2IDAtMTUuMTE1LTEyLjI1My0yNy4zNjctMjcuMzY3LTI3LjM2N3oiIGZpbGw9IiNmZGJhMTIiLz48L2c+PC9nPjwvc3ZnPg==" />
	    <div class="section1">
	        <div class="addCat">
	        	<form name='frm' method="post" action="cat/catAdd/catAddAction.jsp">
	        		<button type="submit" title="반려묘 신규 등록">
	        			<i class="fas fa-folder-plus"></i><br><h4>ADD</h4>
	        		</button>
	        	</form>
	        </div>
	        <div class="modCat">
	        	<form name='frm' method="post" action="cat/catMod/catModAction.jsp">
	        		<button type="submit" title="반려묘 정보 수정">
	        			<i class="fas fa-eraser"></i><br><h4>MODIFY</h4>
	        		</button>
	        	</form>	        	
	        </div>
	    </div>
	    <div class="section2">
	        <div class="listCat">
	        	<form name='frm' method="post" action="cat/catList/catListAction.jsp">
	        		<button type="submit" title="반려묘 조회">
	        			<i class="far fa-edit"></i><br><h4>LIST</h4>
	        		</button>
	        	</form>	      	
	        </div>
	        <div class="infoCat">
	        	<form name='frm' method="post" action="cat/catInfo/catInfoAction.jsp">
	        		<button type="submit" title="반려묘 정보 추가">
	        			<i class="far fa-list-alt"></i><br><h4>INFO</h4>
	        		</button>
	        	</form>	        	
	        </div>
    	</div>
    </div>

    <!-- sns공유 버튼 -->
    <div class="snsBtn">
        <a target="blank" href="http://www.facebook.com/share.php" title="페이스북에 공유"><i class="fab fa-facebook-square"></i></a>
        <a target="blank" href="http://twitter.com/share" title="트위터에 공유"><i class="fab fa-twitter-square"></i></a>
        <a target="blank" href="https://instagram.com" title="인스타그램에 공유"><i class="fab fa-instagram-square"></i></a>
    </div>
</body>
</html>