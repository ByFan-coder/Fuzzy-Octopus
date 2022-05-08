<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登出</title>
	<link rel="stylesheet" type="text/css" href="6.1.css.css" />
	<link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
</head>
<body>

	<div id="bigBox">
			<h1>Log out</h1>
			<div class="inputBox">
				<form action="index.jsp" method="post">
					<h1>登出成功</h1>
					<span>将在</span><span id="time"></span><span>s后跳转到首页</span>
					<br>
					<input type="submit" class="inputButton" value="跳转，现在！" />
				</form>
			</div>
		</div>
<script>
    var second=5;
    var time = document.getElementById("time");
    function show() {
        second--;
        if(second==0){
            //跳转页面
            location.href="index.jsp";
        }
        //用来动态设置里面的内容
        time.innerHTML=second+"";

    }
    //用来实现这个一秒实现一次这个方法
    setInterval(show,1000);
</script>

	<% 
	session.removeAttribute("log");
	session.removeAttribute("goods");
	session.removeAttribute("totalpri");
	%>
</body>
</html>
