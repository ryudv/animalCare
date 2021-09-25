<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="../css/defaultStyle.css">
    <link rel="stylesheet" href="loginPageStyle.css">
    <link href="https://fonts.googleapis.com/css2?family=Urbanist:wght@100;300;500;800&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/e133d6c60e.js" crossorigin="anonymous"></script>
    <script src="../mainPageScript.js"></script>
</head>
<body onload="makeCursor()">
	<div id="foot" style="position: absolute;">
		<img src="../images/foot.png" width="30px" height="30px">
	</div>
    <!-- 네비게이션 -->
    <div class="loginBtn">
        <div class="memInfo">
            <span>please login 😐</span>
        </div>
        <div class="iconBtn">
            <a href="../mainPage.jsp"><i class="fas fa-bone"></i></a>
        </div>
        <div class="memBtn">
            <a href="loginPage.jsp"><button>LOGIN</button></a>
            <a href="../joinPage/joinPage.jsp"><button>JOIN</button></a>
        </div>
    </div>

    <!-- 메인페이지 -->
    <div class="mainSection">
        <img src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pg0KPCEtLSBHZW5lcmF0b3I6IEFkb2JlIElsbHVzdHJhdG9yIDE5LjAuMCwgU1ZHIEV4cG9ydCBQbHVnLUluIC4gU1ZHIFZlcnNpb246IDYuMDAgQnVpbGQgMCkgIC0tPg0KPHN2ZyB2ZXJzaW9uPSIxLjEiIGlkPSJMYXllcl8xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCINCgkgdmlld0JveD0iMCAwIDUxMiA1MTIiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDUxMiA1MTI7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxjaXJjbGUgc3R5bGU9ImZpbGw6IzI3M0I3QTsiIGN4PSIyNTYiIGN5PSIyNTYiIHI9IjI1NiIvPg0KPHBhdGggc3R5bGU9ImZpbGw6IzEyMTE0OTsiIGQ9Ik0yOTIuMDMsNTA5LjQ2NGMxMDAuNDIxLTE0LjE0OCwxODIuMTIyLTg2LjU0NSwyMDkuODI5LTE4MS45MzJMMzYxLjkxNSwxODcuNTg5bC00OS4zNTUsMy44MzkNCglsLTYwLjA0OS02MC4wNDlsLTI0LjA5MywxOC44ODlsLTMuMTYsNC4zMWwtNDIuMjc3LDQwLjA5M2w3NC45OTMsNzQuOTkzbC0xNDQuMTk2LDYxLjU0OUwyOTIuMDMsNTA5LjQ2NHoiLz4NCjxwYXRoIHN0eWxlPSJmaWxsOiNGRjdGNEY7IiBkPSJNMTEzLjc3OCwzMzEuMjEyYzAtNTcuODIyLDQ2Ljg3NS0xMDQuNjk2LDEwNC42OTYtMTA0LjY5NlMzMjMuMTcsMjczLjM5MSwzMjMuMTcsMzMxLjIxMkgxMTMuNzc4eiINCgkvPg0KPHBhdGggc3R5bGU9ImZpbGw6I0QzNTkzMzsiIGQ9Ik0yMjAuMDg2LDIyNi41NTd2MTA0LjY1NUgzMjMuMTdDMzIzLjE3LDI3My45MywyNzcuMTYxLDIyNy40MjEsMjIwLjA4NiwyMjYuNTU3eiIvPg0KPGNpcmNsZSBzdHlsZT0iZmlsbDojRkY3RjRGOyIgY3g9IjIyMC4xNiIgY3k9IjE2NS42ODUiIHI9IjQ3LjE2MSIvPg0KPHBhdGggc3R5bGU9ImZpbGw6I0QzNTkzMzsiIGQ9Ik0yMjAuMTYyLDExOC41MTljLTAuMDI2LDAtMC4wNSwwLjAwMi0wLjA3NiwwLjAwMnY5NC4zMTdjMC4wMjYsMCwwLjA1LDAuMDAyLDAuMDc2LDAuMDAyDQoJYzI2LjA0NiwwLDQ3LjE2MS0yMS4xMTQsNDcuMTYxLTQ3LjE2MUMyNjcuMzIzLDEzOS42MzMsMjQ2LjIwOCwxMTguNTE5LDIyMC4xNjIsMTE4LjUxOXoiLz4NCjxwYXRoIHN0eWxlPSJmaWxsOiNGRkZGRkY7IiBkPSJNMzc4LjYxMywzMDQuNDk5aC0xNS41MTV2LTgwLjU1MWMwLTE3LjkzLTE0LjU4OC0zMi41MTgtMzIuNTE2LTMyLjUxOA0KCWMtMTcuOTMsMC0zMi41MTgsMTQuNTg4LTMyLjUxOCwzMi41MTh2ODAuNTUxaC0xNS41MTV2LTgwLjU1MWMwLTI2LjQ4NiwyMS41NDctNDguMDMzLDQ4LjAzMy00OC4wMzMNCgljMjYuNDg0LDAsNDguMDMxLDIxLjU0Nyw0OC4wMzEsNDguMDMzVjMwNC40OTl6Ii8+DQo8cGF0aCBzdHlsZT0iZmlsbDojRDBEMUQzOyIgZD0iTTMzMC41ODEsMTc1LjkxNGMtMC4wNTUsMC0wLjExLDAuMDAzLTAuMTY1LDAuMDAzdjE1LjUxOWMwLjA1NSwwLDAuMTA5LTAuMDA5LDAuMTY1LTAuMDA5DQoJYzE3LjkyOSwwLDMyLjUxNiwxNC41ODgsMzIuNTE2LDMyLjUxOHY4MC41NTFoMTUuNTE1di04MC41NTFDMzc4LjYxMywxOTcuNDYxLDM1Ny4wNjYsMTc1LjkxNCwzMzAuNTgxLDE3NS45MTR6Ii8+DQo8cGF0aCBzdHlsZT0iZmlsbDojRkZDNjFCOyIgZD0iTTM4Ny4zNDgsMzcyLjAzMUgyNzMuODEzYy02LjczMiwwLTEyLjE5LTUuNDU4LTEyLjE5LTEyLjE5di05MC41NWMwLTYuNzMyLDUuNDU4LTEyLjE5LDEyLjE5LTEyLjE5DQoJaDExMy41MzVjNi43MzIsMCwxMi4xOSw1LjQ1OCwxMi4xOSwxMi4xOXY5MC41NUMzOTkuNTM4LDM2Ni41NzMsMzk0LjA4LDM3Mi4wMzEsMzg3LjM0OCwzNzIuMDMxeiIvPg0KPGc+DQoJPHBhdGggc3R5bGU9ImZpbGw6I0VBQTIyRjsiIGQ9Ik0zODcuMzQ4LDI1Ny4xMDNoLTU2LjkzMnYxMTQuOTI4aDU2LjkzMmM2LjczMiwwLDEyLjE5LTUuNDU4LDEyLjE5LTEyLjE5di05MC41NQ0KCQlDMzk5LjUzOCwyNjIuNTYxLDM5NC4wOCwyNTcuMTAzLDM4Ny4zNDgsMjU3LjEwM3oiLz4NCgk8cGF0aCBzdHlsZT0iZmlsbDojRUFBMjJGOyIgZD0iTTM0Ni45NTgsMzA0LjE3OGMwLTkuMDQ1LTcuMzMyLTE2LjM3Ny0xNi4zNzctMTYuMzc3cy0xNi4zNzcsNy4zMzItMTYuMzc3LDE2LjM3Nw0KCQljMCw2LjA1OCwzLjI5OCwxMS4zMzUsOC4xODksMTQuMTY5djE4LjMzN2MwLDQuNTIyLDMuNjY3LDguMTg5LDguMTg5LDguMTg5YzQuNTIyLDAsOC4xODktMy42NjcsOC4xODktOC4xODl2LTE4LjMzNw0KCQlDMzQzLjY1OSwzMTUuNTEzLDM0Ni45NTgsMzEwLjIzNiwzNDYuOTU4LDMwNC4xNzh6Ii8+DQo8L2c+DQo8cGF0aCBzdHlsZT0iZmlsbDojRkY1NDE5OyIgZD0iTTMzMC41ODEsMjg3LjgwMWMtMC4wNTUsMC0wLjEwOSwwLjAwOS0wLjE2NSwwLjAwOXY1Ny4wNDdjMC4wNTcsMC4wMDIsMC4xMDksMC4wMTcsMC4xNjUsMC4wMTcNCgljNC41MjIsMCw4LjE4OS0zLjY2Nyw4LjE4OS04LjE4OXYtMTguMzM3YzQuODkxLTIuODMyLDguMTg5LTguMTA5LDguMTg5LTE0LjE2OUMzNDYuOTU4LDI5NS4xMzMsMzM5LjYyNSwyODcuODAxLDMzMC41ODEsMjg3LjgwMXoiDQoJLz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjwvc3ZnPg0K" />
		<form method="post" action="loginAction.jsp">
			<table>
				<tr>
					<td class="subject">ID</td>
					<td><input type="text" class='input_wh' name='userId' autocomplete='off'></td>
				</tr>
				<tr>
					<td class="subject">PASSWORD</td>
					<td><input type="password" class='input_wh' name='userPwd' autocomplete='off'></td>
				</tr>
				<tr>
					<td colspan="4" class="subject">
						<input type="submit" value="LOGIN" class='btn'>
					</td>
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