<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome... .</title>
    <link rel="stylesheet" href="index.css">
</head>

<body>
    <header>
        <div id="logo">Tickgotick</div>
        <ul>
            <a class="active">主页</a>
            <a href="6.1.log.jsp">登录</a>
            <a href="6.1.reg.jsp">注册</a>
            <a href="6.1.log.jsp">个人</a>
            <a href="6.1.log.jsp">清单</a>
        </ul>
    </header>
    <section>
        <img src="./images/stars.png" alt="" class="stars">
        <img src="./images/moon.png" alt="" class="moon">
        <div class="desc">Welcome!</div>
        <a href="store.jsp" class="btn">进入商店</a>
        <img src="./images/mountains_behind.png" alt="" class="mountains_behind">
        <img src="./images/mountains_front.png" alt="" class="mountains_front">
    </section>
    <script>
        const stars = document.querySelector('.stars');
        const moon = document.querySelector('.moon');
        const desc = document.querySelector('.desc');
        const btn = document.querySelector('.btn');
        const mountains_behind = document.querySelector('.mountains_behind');
        const mountains_front = document.querySelector('.mountains_front');
        window.addEventListener('scroll', function() {
            let value = window.scrollY;
            stars.style.left = value * 0.25 + 'px';
            moon.style.top = value * 1.05 + 'px';
            mountains_behind.style.top = value * 0.5 + 'px';
            desc.style.marginTop = value * 1.5 + "px";
            desc.style.marginRight = value * 2.5 + "px";
            btn.style.marginTop = value * 1.5 + "px";
        })
    </script>
    <div class="text" id="title">
        <h2>其他项目</h2>
        <p>1.tensorflow.js</p>
        <p>2.随机</p>
        <p>2.随机</p>
        <p>2.随机</p>
        <p>2.随机</p>
        <p>2.随机</p>
        <p>2.随机</p>
        <p>2.随机</p>
        <p>2.随机</p>
    </div>
</body>

</html>