<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册页面</title>
	<link rel="stylesheet" type="text/css" href="6.1.css.css" />
	<link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
</head>
<body>
	<div id="bigBox">
			<h1>REGISTER</h1>
			<div class="inputBox">
				<form action="reg.jsp" method="post">
					<div class="inputText">
						<i class="fa fa-user-circle" style="color: whitesmoke;"></i>
						<input type="text" id="id" name="id" placeholder="Your id..">
					</div>
					<div class="inputText">
						<i class="fa fa-key" style="color: whitesmoke;"></i>
						<input type="password" id="pw" name="pw" placeholder="Your password..">
					</div>
					<input type="submit" onclick="myFunction()" class="inputButton" value="REGISTER" />
				</form>
			</div>
		</div>
		

<p id="demo"></p>  
	
<script>
function myFunction() {
    var x, text;

    x = document.getElementById("id").value;
    if (x.length>20) {
        text = "error,please input the correct id!";
    } else {
        text = "Success!";
    }
    document.getElementById("demo").innerHTML = text;
}
</script>
</body>
</html>
