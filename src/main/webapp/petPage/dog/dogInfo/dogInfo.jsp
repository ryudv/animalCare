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
    <link rel="stylesheet" href="../../../css/defaultStyle.css">
    <link rel="stylesheet" href="dogInfoStyle.css">
    <link href="https://fonts.googleapis.com/css2?family=Urbanist:wght@100;300;500;800&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/e133d6c60e.js" crossorigin="anonymous"></script>
    <script src="../../../mainPageScript.js"></script>
</head>
<body onload="makeCursor()">
	<div id="foot" style="position: absolute;">
		<img src="../../../images/foot.png" width="30px" height="30px">
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
            <a href="../../../mainPage.jsp"><i class="fas fa-bone"></i></a>
        </div>
        <div class="memBtn">
            <a href="../../../loginPage/loginPage.jsp"><button>LOGIN</button></a>
            <a href="../../../joinPage/joinPage.jsp"><button>JOIN</button></a>
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
            <a href="../../../mainPage.jsp"><i class="fas fa-bone"></i></a>
        </div>
        <div class="memBtn">
            <a href="../../../loginPage/logoutAction.jsp"><button>LOGOUT</button></a>
        </div>
    </div>
    <%
		}
	%>
    
	<!-- 메인페이지 -->
    <div class="mainSection">

    </div>

    <!-- sns공유 버튼 -->
    <div class="snsBtn">
        <a target="blank" href="http://www.facebook.com/share.php" title="페이스북에 공유"><i class="fab fa-facebook-square"></i></a>
        <a target="blank" href="http://twitter.com/share" title="트위터에 공유"><i class="fab fa-twitter-square"></i></a>
        <a target="blank" href="https://instagram.com" title="인스타그램에 공유"><i class="fab fa-instagram-square"></i></a>
    </div>
</body>
</html>