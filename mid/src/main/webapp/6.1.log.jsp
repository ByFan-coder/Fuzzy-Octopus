<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登陆页面</title>
	<link rel="stylesheet" type="text/css" href="6.1.css.css" />
	<link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
</head>
<body>
	<div id="bigBox">
			<h1>LOGIN</h1>
			<div class="inputBox">
				<form action="check.jsp" method="post">
					<div class="inputText">
						<i class="fa fa-user-circle" style="color: whitesmoke;"></i>
						<input type="text" placeholder="Your id..." name="id"/>
					</div>
					<div class="inputText">
						<i class="fa fa-key" style="color: whitesmoke;"></i>
						<input type="password" placeholder="Your password..." name="pw"/>
					</div>
					<input type="submit" class="inputButton" value="LOGIN" />
				</form>
				<br />
				<a href = "6.1.reg.jsp">Don't have a account?Sign up one</a>
			</div>
		</div>
		

</body>
</html>
