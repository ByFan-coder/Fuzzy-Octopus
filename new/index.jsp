<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
* {
    padding: 0;
    margin: auto;
}
a {
    text-decoration: none;
    color: #ffffff;
}
.header {
    width: 100%;
    height: 100px;
    background-color: rgb(198, 195, 212);
    text-align: center;
    line-height: 100px;
    color: #865a5a;
}
.section_left {
    width: 16%;
    height: 1000px;
    float: left;
    background-color: rgb(173, 145, 145);
}
.section_left ul li {
    list-style: none;
    width: 100%;
    height: 50px;
    border-bottom: 1px solid #ffffff;
    text-align: center;
    line-height: 50px;
}
.sidebar_right {
    width: 78%;
    float: right;
    height: 980px;
    background-color: rgb(105, 90, 90);
    margin-right: 3%;
    margin-top: 15px;
    text-align: center;
    line-height: 470px;
    border-radius: 10px;
    color: #e6cdcd;
}
.footer {
    width: 100%;
    height:100px;
    background-color: rgb(190, 195, 216);
    clear: both;
    text-align: center;
    line-height: 100px;
    color: #925959;
}
</style>
</head>
<html>
<body>
    <header class="header">
        <h1>我是头部</h1>
    </header>
    <!-- 左侧导航栏 -->
    <section class="section_left">
        <ul>
            <li>
                <a href="#/">这是默认菜单</a>
            </li>
            <li>
                <a href="#/html">HTML学习</a>
            </li>
            <li>
                <a href="#/css">CSS学习</a>
            </li>
            <li>
                <a href="#/javascript">Javascript学习</a>
            </li>
        </ul>
    </section>
    <!-- 右侧内容显示区域 -->
    <sidebar class="sidebar_right">
        <h1>我是默认内容</h1>
    </sidebar>
    <!-- 底部 -->
    <footer class="footer">
        <h1>我是底部</h1>
    </footer>
<script>
(function(){
    var Router = function () {
        this.routes = {};//保存路由
        this.curUrl = '';//获取当前的hash值
    }
    Router.prototype.init = function () {
        //hashchange事件，当hash变化时，调用reloadPage方法
        //第一个this指向window，bind里面的this指向调用这个函数的对象，具体使用方法可以百度
        window.addEventListener('hashchange', this.reloadPage.bind(this));
    }
 
    Router.prototype.reloadPage = function () {
        this.curUrl = location.hash.substring(1) || '/';//获取当前hash的值（去掉#）
        this.routes[this.curUrl]();      //运行当前hsah值对应的函数
    }
 
    Router.prototype.map = function( key, callback ){ //保存路由对应的函数：
        this.routes[key] = callback;  //key表示hash的值（去掉#），callback表示当前hash对应的函数
    } 
    window.oRou = Router;
})
 
(function(){
    var Router = function () {
        this.routes = {};//保存路由
        this.curUrl = '';//获取当前的hash值
    }
    Router.prototype.init = function () {
        //hashchange事件，当hash变化时，调用reloadPage方法
        //第一个this指向window，bind里面的this指向调用这个函数的对象，具体使用方法可以百度
        window.addEventListener('hashchange', this.reloadPage.bind(this));
    }
 
    Router.prototype.reloadPage = function () {
        this.curUrl = location.hash.substring(1) || '/';//获取当前hash的值（去掉#）
        this.routes[this.curUrl]();      //运行当前hsah值对应的函数
    }
 
    Router.prototype.map = function( key, callback ){ //保存路由对应的函数：
        this.routes[key] = callback;  //key表示hash的值（去掉#），callback表示当前hash对应的函数
    } 
    window.oRou = Router;
})
 
 
var oRouter2 = new oRou();
oRouter2.init();
oRouter2.map('/',function () {
    var oSidebar = document.querySelector("sidebar");
    oSidebar.innerHTML = '我是主页';
})
 
oRouter2.map('/html',function () {
    var oSidebar = document.querySelector("sidebar");
    oSidebar.innerHTML = '我是html页面';
})
 
oRouter2.map('/css',function () {
    var oSidebar = document.querySelector("sidebar");
    oSidebar.innerHTML = '我是css页面';
})
 
oRouter2.map('/javascript',function () {
    var oSidebar = document.querySelector("sidebar");
    oSidebar.innerHTML = '我是javascript页面';
})
</script>
</body>
</html>