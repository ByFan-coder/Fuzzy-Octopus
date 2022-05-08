<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人中心</title>
	<link rel="stylesheet" type="text/css" href="6.1.css.css" />
	<link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
</head>
<body>
	<div id="bigBox">
			<h1>LOGIN</h1>
			<div class="inputBox">
				<form action="logout.jsp" method="post">
					<input type="submit" class="inputButton" name="option" value="登出" />
				</form>
				<form action="getorder.jsp" method="post">
					<input type="submit" class="inputButton" name="option" value="查看我的历史订单" />
				</form>
			</div>
		</div>


</body>
</html>