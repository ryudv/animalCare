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
    <link rel="stylesheet" href="css/defaultStyle.css">
    <link rel="stylesheet" href="css/mainPageStyle.css">
    <link href="https://fonts.googleapis.com/css2?family=Urbanist:wght@100;300;500;800&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/e133d6c60e.js" crossorigin="anonymous"></script>
    <script src="mainPageScript.js"></script>
</head>
<body onload="makeCursor()">
	<div id="foot" style="position: absolute;">
		<img src="images/foot.png" width="30px" height="30px">
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
            <a href="mainPage.jsp"><i class="fas fa-bone"></i></a>
        </div>
        <div class="memBtn">
            <a href="loginPage/loginPage.jsp"><button>LOGIN</button></a>
            <a href="joinPage/joinPage.jsp"><button>JOIN</button></a>
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
            <a href="mainPage.jsp"><i class="fas fa-bone"></i></a>
        </div>
        <div class="memBtn">
            <a href="loginPage/logoutAction.jsp"><button>LOGOUT</button></a>
        </div>
    </div>
    <%
		}
	%>
	<!-- 메인페이지 -->
    <div class="mainSection">
        <!-- 타이틀 -->
        <div class="title">
            <h1>Animal Care</h1>
            <div class="heartIcon">
                <i class="fas fa-heartbeat"></i>
            </div>
        </div>
        <!-- 버튼 -->
        <div class="petBtn">
           <a href="petPage/catPage.jsp">
          	   <button title="반려묘" onmouseenter="mainZoomIn()" onmouseleave="mainZoomOut()">
               <img src="data:image/svg+xml;base64,PHN2ZyBpZD0iQ2FwYV8xIiBlbmFibGUtYmFja2dyb3VuZD0ibmV3IDAgMCA1MTIgNTEyIiBoZWlnaHQ9IjUxMiIgdmlld0JveD0iMCAwIDUxMiA1MTIiIHdpZHRoPSI1MTIiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PGc+PHBhdGggZD0ibTM2Ny4wMzEgNTEyYzQzLjAzMS01NC41OTctMTkuMjctMjU2LTE5LjI3LTI1Ni00LjgzMyAwLTE3Ny44NzggMC0xODIuNjI1IDAgMCAwLTYyLjMwMiAyMDEuNDAzLTE5LjI3IDI1NnoiIGZpbGw9IiM4MzgzODMiLz48cGF0aCBkPSJtMzQ3Ljc2MSAyNTZjLTEuMzI2IDAtMTUuMzI4IDAtMzUuMDQyIDAgMCAwIDYyLjMwMiAyMDEuNDAzIDE5LjI3MSAyNTZoMzUuMDQyYzQzLjAzMS01NC41OTctMTkuMjcxLTI1Ni0xOS4yNzEtMjU2eiIgZmlsbD0iIzVhNWE1YSIvPjxwYXRoIGQ9Im0xNTEuMzM1IDMwNy4xMDFjMjguNTQ2IDIxLjUwNCA2NC45NzQgMzQuNDA0IDEwNC42NjUgMzQuNDA0IDQwLjA0MiAwIDc2Ljc2OC0xMy4xMjMgMTA1LjQyNS0zNC45Ny03LjI3NC0yOS44NzctMTMuNjY0LTUwLjUzNS0xMy42NjQtNTAuNTM1LTQuODMyIDAtMTc3Ljg3OCAwLTE4Mi42MjUgMCAwIDAtNi40NzEgMjAuOTIxLTEzLjgwMSA1MS4xMDF6IiBmaWxsPSIjZmZmMGFkIi8+PHBhdGggZD0ibTM0Ny43NjEgMjU2Yy0xLjMyNiAwLTE1LjMyOCAwLTM1LjA0MiAwIDAgMCA2LjM5IDIwLjY1OCAxMy42NjQgNTAuNTM1LTI0LjQyMiAxOC42MTktNTQuNzA2IDMwLjg5NC04Ny45MDYgMzQuMTE3IDUuNzU5LjU2IDExLjYwNC44NTMgMTcuNTI0Ljg1MyA0MC4wNDIgMCA3Ni43NjgtMTMuMTIzIDEwNS40MjUtMzQuOTctNy4yNzUtMjkuODc3LTEzLjY2NS01MC41MzUtMTMuNjY1LTUwLjUzNXoiIGZpbGw9IiNmZmUxNzciLz48cGF0aCBkPSJtMzA5LjU4OSA0NC4yODEgNzkuNjMzLTQzLjMwN2M1LjI4NC0yLjg3MyAxMS43MTguOTUxIDExLjcxOCA2Ljk2NnYxNTYuMTQ5bC05MS4zNS02Mi44OHYtNTYuOTI4eiIgZmlsbD0iIzgzODM4MyIvPjxwYXRoIGQ9Im0xOTguMjcgNDIuMDI5LTc1LjQ5Mi00MS4wNTRjLTUuMjg0LTIuODczLTExLjcxOC45NTEtMTEuNzE4IDYuOTY2djE0MS4wNjRjMCA2LjM4NyA3LjE2NSAxMC4xNTMgMTIuNDI1IDYuNTMybDc1LjQ5MS01MS45NjRjMi4xNS0xLjQ4IDMuNDMzLTMuOTIyIDMuNDMzLTYuNTMydi00OC4wNDZjLjAwMi0yLjkwNS0xLjU4Ny01LjU3OC00LjEzOS02Ljk2NnoiIGZpbGw9IiM4MzgzODMiLz48ZWxsaXBzZSBjeD0iMjU2IiBjeT0iMTY4LjgzOSIgZmlsbD0iIzljOWM5YyIgcng9IjE0NC45MzkiIHJ5PSIxMzQuMDIxIi8+PHBhdGggZD0ibTIyMi4wMjcgMjY4LjQyM2MtMTkuMDA5IDAtMzQuNDE5LTE1LjQxLTM0LjQxOS0zNC40MTkgMC0xNS4wMzQgMTIuMTg3LTI3LjIyMSAyNy4yMjEtMjcuMjIxaDQxLjYxNnYyNy4yMjFjLjAwMSAxOS4wMS0xNS40MDkgMzQuNDE5LTM0LjQxOCAzNC40MTl6IiBmaWxsPSIjY2VjZWNlIi8+PHBhdGggZD0ibTI5MC40MTkgMjY4LjQyM2MxOS4wMDkgMCAzNC40MTktMTUuNDEgMzQuNDE5LTM0LjQxOSAwLTE1LjAzNC0xMi4xODctMjcuMjIxLTI3LjIyMS0yNy4yMjFoLTQxLjYxN3YyNy4yMjFjMCAxOS4wMSAxNS40MSAzNC40MTkgMzQuNDE5IDM0LjQxOXoiIGZpbGw9IiNjZWNlY2UiLz48cGF0aCBkPSJtMzg5LjIyMi45NzUtMjMuMzI1IDEyLjY4NXYxMjYuMzA5bDM1LjA0MyAyNC4xMjF2LTE1Ni4xNDljLS4wMDEtNi4wMTUtNi40MzUtOS44NC0xMS43MTgtNi45NjZ6IiBmaWxsPSIjNWE1YTVhIi8+PHBhdGggZD0ibTI1NiAzNC44MThjLTUuOTMxIDAtMTEuNzc3LjMzNy0xNy41MjEuOTc3IDcxLjc4NCA3Ljk5OSAxMjcuNDE4IDY0LjUxIDEyNy40MTggMTMzLjA0NCAwIDY4LjUzMy01NS42MzQgMTI1LjA0NC0xMjcuNDE4IDEzMy4wNDQgNS43NDQuNjQgMTEuNTkuOTc3IDE3LjUyMS45NzcgODAuMDQ4IDAgMTQ0Ljk0LTYwLjAwNCAxNDQuOTQtMTM0LjAyMS0uMDAxLTc0LjAxOC02NC44OTItMTM0LjAyMS0xNDQuOTQtMTM0LjAyMXoiIGZpbGw9IiM4MzgzODMiLz48Y2lyY2xlIGN4PSIyNTYiIGN5PSIzMzkuNTkyIiBmaWxsPSIjZmZjMzQ0IiByPSIzNi43MzIiLz48cGF0aCBkPSJtMjk3LjYxNiAyMDYuNzg0aC0yOS4yMDJjMTUuMDM0IDAgMjcuMjIxIDEyLjE4NyAyNy4yMjEgMjcuMjIxdi4wMDFjMCAxMy43ODgtOC4xMSAyNS42NzYtMTkuODE3IDMxLjE3IDQuNDMzIDIuMDggOS4zOCAzLjI0OSAxNC42MDEgMy4yNDloLjAwMWMxOS4wMDkgMCAzNC40MTktMTUuNDEgMzQuNDE5LTM0LjQxOXYtLjAwMWMtLjAwMi0xNS4wMzQtMTIuMTg5LTI3LjIyMS0yNy4yMjMtMjcuMjIxeiIgZmlsbD0iI2JmYmZiZiIvPjxwYXRoIGQ9Im0yNTYgMjIyLjQwN2M4LjIxNyAwIDE1LjI4Ny03LjYwNCAxOC40MzQtMTguNTE2IDEuODM2LTYuMzY1LTIuODk3LTEyLjcyOS05LjUyMi0xMi43MjloLTE3LjgyNmMtNi42MjUgMC0xMS4zNTggNi4zNjQtOS41MjIgMTIuNzI5IDMuMTQ5IDEwLjkxMSAxMC4yMTkgMTguNTE2IDE4LjQzNiAxOC41MTZ6IiBmaWxsPSIjNDQ0Ii8+PHBhdGggZD0ibTI1NiAzMDIuODZjLTUuMTkgMC0xMC4xMjUgMS4wODItMTQuNjAxIDMuMDI0IDEzLjAyMSA1LjY0OCAyMi4xMzEgMTguNjEyIDIyLjEzMSAzMy43MDggMCAxNS4wOTctOS4xMSAyOC4wNi0yMi4xMzEgMzMuNzA4IDQuNDc2IDEuOTQyIDkuNDExIDMuMDI0IDE0LjYwMSAzLjAyNCAyMC4yODcgMCAzNi43MzItMTYuNDQ2IDM2LjczMi0zNi43MzJzLTE2LjQ0NS0zNi43MzItMzYuNzMyLTM2LjczMnoiIGZpbGw9IiNmZWIxMzciLz48Zz48cGF0aCBkPSJtMTk3LjUyMyAxODAuMjgyYy00LjI2OCAwLTcuNzI2LTMuNDU5LTcuNzI2LTcuNzI2di0yNC43MjRjMC00LjI2OCAzLjQ1OS03LjcyNiA3LjcyNi03LjcyNiA0LjI2OCAwIDcuNzI2IDMuNDU5IDcuNzI2IDcuNzI2djI0LjcyNGMuMDAxIDQuMjY3LTMuNDU4IDcuNzI2LTcuNzI2IDcuNzI2eiIgZmlsbD0iIzQ0NCIvPjwvZz48Zz48cGF0aCBkPSJtMzE1LjQwMyAxODAuMjgyYy00LjI2OCAwLTcuNzI2LTMuNDU5LTcuNzI2LTcuNzI2di0yNC43MjRjMC00LjI2OCAzLjQ1OS03LjcyNiA3LjcyNi03LjcyNnM3LjcyNiAzLjQ1OSA3LjcyNiA3LjcyNnYyNC43MjRjMCA0LjI2Ny0zLjQ1OSA3LjcyNi03LjcyNiA3LjcyNnoiIGZpbGw9IiM0NDQiLz48L2c+PC9nPjwvc3ZnPg==" />
               <h4>cat</h4>
              </button>
           </a>
           <a href="petPage/dogPage.jsp">
               <button title="반려견" onmouseenter="mainZoomIn()" onmouseleave="mainZoomOut()"> 
               <img src="data:image/svg+xml;base64,PHN2ZyBpZD0iQ2FwYV8xIiBlbmFibGUtYmFja2dyb3VuZD0ibmV3IDAgMCA1MTIgNTEyIiBoZWlnaHQ9IjUxMiIgdmlld0JveD0iMCAwIDUxMiA1MTIiIHdpZHRoPSI1MTIiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PGc+PHBhdGggZD0ibTMxMS43OSAzNzYuNDQ1aC0xMTIuNDE0Yy0yMy43NyAwLTQ1LjU3OC04LjM5NS02Mi42MjUtMjIuMzc5LTExLjI4MiAzMy44NzUtMzEuNTU3IDEwMS41NDktMzQuMzczIDE1Ny45MzRoMzA0Ljk3Yy0yLjc5My01NS45MDctMjIuNzQxLTEyMi44ODUtMzQuMDc3LTE1Ny4wMzktMTYuODc3IDEzLjQzNi0zOC4yMzMgMjEuNDg0LTYxLjQ4MSAyMS40ODR6IiBmaWxsPSIjZTE5OTc0Ii8+PGc+PHBhdGggZD0ibTM3NS41NzIgMzUzLjA5N2MtOC42OTYgNy4zNTctMTguNjgzIDEzLjIzMy0yOS41NjggMTcuMjUzIDExLjQxNyAzNi41MTcgMjYuNzAyIDkzLjIzNyAyOS4xMiAxNDEuNjVoMzUuMTQ1Yy0yLjg0NC01Ni45My0yMy40ODQtMTI1LjM2My0zNC42OTctMTU4LjkwM3oiIGZpbGw9IiNkYzg3NTgiLz48L2c+PHBhdGggZD0ibTM3NS41NzIgMzUzLjA5N2MtMTcuMjEzIDE0LjU2Mi0zOS40NjkgMjMuMzQ4LTYzLjc4MiAyMy4zNDhoLTExMi40MTRjLTIzLjc3IDAtNDUuNTc4LTguMzk1LTYyLjYyNS0yMi4zNzktMy4yODEgOS44NTItNy4zMjQgMjIuNTc0LTExLjQ3NSAzNy4wMzQgMTguMDE3IDE1LjM3NCA0MS4zODYgMjQuNjYgNjYuOTI2IDI0LjY2aDExNy43OTZjMjkuNjAyIDAgNTYuMjg4LTEyLjQ3MSA3NS4xMDEtMzIuNDQyLTMuNDc0LTExLjcwNy02Ljc4NC0yMi4wMTQtOS41MjctMzAuMjIxeiIgZmlsbD0iI2U1Mzk1MCIvPjxwYXRoIGQ9Im0zNDYuMDA1IDM3MC4zNWMtLjAwMSAwLS4wMDEgMC0uMDAyIDAgMy4xNzcgMTAuMTYyIDYuNjUzIDIxLjg5MSAxMC4wNjkgMzQuNTY3IDEwLjkyMS01LjQ2MiAyMC43MzgtMTIuODAyIDI5LjAyNy0yMS42LS4wMDMtLjAxMS0uMDA3LS4wMjItLjAxLS4wMzMtMy40Ny0xMS42OTMtNi43NzctMjEuOTg4LTkuNTE4LTMwLjE4OC04LjQwNSA3LjExLTE4LjMyOSAxMy4xMDMtMjkuNTY2IDE3LjI1NHoiIGZpbGw9IiNjYTJlNDMiLz48cGF0aCBkPSJtMzk0LjEzNiAxNjQuMTMyYzYuOTQ5LS4yNzUgMTMuOTAyLTIuNDc0IDIwLjAyMi02Ljc1OWwyMi4zMzEtMTUuNjM2YzE2Ljk5Mi0xMS44OTggMjEuMTIyLTM1LjMxOCA5LjIyNC01Mi4zMWwtNTEuNDAyLTczLjQwN2MtNi45OTUtOS45OS0xNy45NzMtMTUuNTI4LTI5LjI4Ni0xNS45ODItNi45NzYuMjYxLTEzLjk2IDIuNDU3LTIwLjEwNCA2Ljc1OWwtMjguOTI3IDIwLjI1NWMzMC43MTEgMTEuOTA5IDUyLjQ5NiA0MS43MiA1Mi40OTYgNzYuNjM3djQ4Ljk4NmM2Ljg4MSA3LjE1NSAxNi4xNDkgMTEuMDk1IDI1LjY0NiAxMS40NTd6IiBmaWxsPSIjNWE1YTVhIi8+PHBhdGggZD0ibTE5OS4zNzYgMTc4LjgxNmgxMTIuNDE0YzIxLjA5OSAwIDQwLjY1IDYuNjE3IDU2LjcwMSAxNy44ODR2LTkzLjAxMmMwLTQ1LjM5My0zNi43OTgtODIuMTkxLTgyLjE5MS04Mi4xOTFoLTYwLjgyNWMtNDUuMzkzIDAtODIuMTkxIDM2Ljc5OC04Mi4xOTEgODIuMTkxdjkyLjU4OWMxNS45MzUtMTEuMDA3IDM1LjI1OS0xNy40NjEgNTYuMDkyLTE3LjQ2MXoiIGZpbGw9IiNlMTk5NzQiLz48cGF0aCBkPSJtMzExLjc5IDM3Ni40NDVoLTExMi40MTRjLTU0LjU3MyAwLTk4LjgxNC00NC4yNDEtOTguODE0LTk4LjgxNHM0NC4yNDEtOTguODE0IDk4LjgxNC05OC44MTRoMTEyLjQxNGM1NC41NzMgMCA5OC44MTQgNDQuMjQxIDk4LjgxNCA5OC44MTRzLTQ0LjI0IDk4LjgxNC05OC44MTQgOTguODE0eiIgZmlsbD0iI2VjYmJhMyIvPjxnPjxnPjxwYXRoIGQ9Im0xOTYuMDkxIDE1OS42ODNjLTQuMjggMC03Ljc0OS0zLjQ2OS03Ljc0OS03Ljc0OXYtMjQuNzk2YzAtNC4yOCAzLjQ2OS03Ljc0OSA3Ljc0OS03Ljc0OXM3Ljc0OSAzLjQ2OSA3Ljc0OSA3Ljc0OXYyNC43OTZjMCA0LjI4LTMuNDY5IDcuNzQ5LTcuNzQ5IDcuNzQ5eiIgZmlsbD0iIzVhNWE1YSIvPjwvZz48Zz48cGF0aCBkPSJtMzE0LjMxNCAxNTkuNjgzYy00LjI4IDAtNy43NDktMy40NjktNy43NDktNy43NDl2LTI0Ljc5NmMwLTQuMjggMy40NjktNy43NDkgNy43NDktNy43NDlzNy43NDkgMy40NjkgNy43NDkgNy43NDl2MjQuNzk2YzAgNC4yOC0zLjQ2OSA3Ljc0OS03Ljc0OSA3Ljc0OXoiIGZpbGw9IiM1YTVhNWEiLz48L2c+PC9nPjxwYXRoIGQ9Im0xNDMuMjg0IDEwMy42ODhjMC0zNC45NzIgMjEuODUzLTY0LjgyMyA1Mi42NC03Ni42OTRsLTI4Ljg0Ni0yMC4xOThjLTE2Ljk5Mi0xMS44OTgtNDAuNDEyLTcuNzY4LTUyLjMxIDkuMjI0bC01MS40MDEgNzMuNDA3Yy0xMS44OTggMTYuOTkyLTcuNzY4IDQwLjQxMiA5LjIyNCA1Mi4zMWwyMi4zMzEgMTUuNjM3YzE1LjI3NCAxMC42OTUgMzUuNzM3IDguNDMyIDQ4LjM2Mi00LjQ3NXoiIGZpbGw9IiM1YTVhNWEiLz48Zz48cGF0aCBkPSJtMjg2LjMgMjEuNDk3aC0zNS4xNDVjNDUuMzkzIDAgODIuMTkxIDM2Ljc5OCA4Mi4xOTEgODIuMTkxdjc3LjUwNmMxMi44MzEgMi44NTcgMjQuNzI4IDguMTk0IDM1LjE0NSAxNS41MDZ2LTkzLjAxMmMwLTQ1LjM5Mi0zNi43OTgtODIuMTkxLTgyLjE5MS04Mi4xOTF6IiBmaWxsPSIjZGM4NzU4Ii8+PC9nPjxwYXRoIGQ9Im00NDguNjMyIDg5LjQyNy01MS40LTczLjQwN2MtMTAuOTk1LTE1LjcwMy0zMS44MjYtMjAuNDEtNDguMzM1LTExLjY0NiA1LjA5OCAyLjY5NCA5LjY1NSA2LjU5OCAxMy4xOSAxMS42NDZsNTEuNDAxIDczLjQwOGMxMS44OTggMTYuOTkyIDcuNzY5IDQwLjQxMi05LjIyNCA1Mi4zMWwtMjIuMzMxIDE1LjYzNmMtMS4yOS45MDQtMi42MjEgMS43MDctMy45NzcgMi40MjcgMTIuMDYxIDYuMzc2IDI3LjE3OCA1LjkzNiAzOS4xMjItMi40MjdsMjIuMzMxLTE1LjYzNmMxNi45OTItMTEuODk5IDIxLjEyMi0zNS4zMTkgOS4yMjMtNTIuMzExeiIgZmlsbD0iIzQ0NCIvPjxwYXRoIGQ9Im0zMTEuNzkgMTc4LjgxNmgtMzQuMDdjNTQuNTczIDAgOTguODE0IDQ0LjI0IDk4LjgxNCA5OC44MTR2LjAwMWMwIDU0LjU3My00NC4yNCA5OC44MTQtOTguODE0IDk4LjgxNGgzNC4wN2M1NC41NzMgMCA5OC44MTQtNDQuMjQgOTguODE0LTk4LjgxNHYtLjAwMWMwLTU0LjU3My00NC4yNC05OC44MTQtOTguODE0LTk4LjgxNHoiIGZpbGw9IiNlOGFkOGMiLz48cGF0aCBkPSJtMTk0LjU5NCAyMDQuMTRjLTIxLjg5IDAtMzkuNjM0IDE3Ljc0NS0zOS42MzQgMzkuNjM0IDAgMjcuNjc3IDIyLjQzNiA1MC4xMTQgNTAuMTE0IDUwLjExNGgyMi42MzRjMTUuMTc3IDAgMjcuNDgtMTIuMzAzIDI3LjQ4LTI3LjQ4IDAtNy4xMDUgMC01NS42OTYgMC02Mi4yNjgtNjAuOTc2IDAgMS4xODEgMC02MC41OTQgMHoiIGZpbGw9IiNmNGQ3YzgiLz48cGF0aCBkPSJtMzE1Ljc4MSAyMDQuMTRjMjEuODkgMCAzOS42MzQgMTcuNzQ1IDM5LjYzNCAzOS42MzQgMCAyNy42NzctMjIuNDM2IDUwLjExNC01MC4xMTQgNTAuMTE0aC0yMi42MzRjLTE1LjE3NyAwLTI3LjQ4LTEyLjMwMy0yNy40OC0yNy40OCAwLTcuMTA1IDAtNTUuNjk2IDAtNjIuMjY4eiIgZmlsbD0iI2Y0ZDdjOCIvPjxwYXRoIGQ9Im0yNTUuNzQyIDIyNi45NjdjMTIuNjYzIDAgMjMuNTU4LTExLjcxOSAyOC40MDgtMjguNTM0IDIuODI5LTkuODA5LTQuNDY0LTE5LjYxNi0xNC42NzMtMTkuNjE2aC0yNy40N2MtMTAuMjA5IDAtMTcuNTAzIDkuODA3LTE0LjY3MyAxOS42MTYgNC44NSAxNi44MTUgMTUuNzQ1IDI4LjUzNCAyOC40MDggMjguNTM0eiIgZmlsbD0iIzVhNWE1YSIvPjxwYXRoIGQ9Im0xODguNjAxIDIxLjg2NmMtNDEuNzk0IDMuODcxLTc0LjUxOSAzOS4wMTgtNzQuNTE5IDgxLjgyMnY2MC4zOThjMTAuNjc4LjY2NiAyMS40MjctMy4yMzggMjkuMjAyLTExLjE4OHYtNDkuMjExYzAtMzQuOTcyIDIxLjg1My02NC44MjMgNTIuNjQtNzYuNjk1eiIgZmlsbD0iIzQ0NCIvPjwvZz48L3N2Zz4=" />
               <h4>dog</h4>
               </button>
           </a>
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