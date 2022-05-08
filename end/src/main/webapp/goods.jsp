<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>商品列表</title>
    <!-- 字体图标 -->
    <link rel="stylesheet" href="goods.css">
    <!-- 自己写的样式 -->
    <link rel="stylesheet" href="goods.reset.css">
</head>
<body>
    <div id="main" class="main">
        <div id="topBar" class="topBar">
            <span>排序</span>
            <a class="sortBtn" href="javascript:;" sortFlag="time">
                <span>上架时间</span>
                <div class="arrows">
                    <b class="iconfont icon-shang arrowUp"></b>
                    <b class="iconfont icon-xiajiantou arrowDown"></b>
                </div>
            </a>
            <a class="sortBtn" href="javascript:;" sortFlag="hot">
                <span>热度</span>
                <div class="arrows">
                    <b class="iconfont icon-shang arrowUp"></b>
                    <b class="iconfont icon-xiajiantou arrowDown"></b>
                </div>
            </a>
            <a class="sortBtn" href="javascript:;" sortFlag="price">
                <span>价格</span>
                <div class="arrows">
                    <b class="iconfont icon-shang arrowUp"></b>
                    <b class="iconfont icon-xiajiantou arrowDown"></b>
                </div>
            </a>
            <p class="goodsList" id="goodsList"></p>
        </div>
        <!-- 图片列表 -->

        <ul class="lists" id="lists">
        </ul>

    </div>

</body>
</html>
<script src="goods1.js"></script>