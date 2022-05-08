<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>购物车</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="list2.css">

  </head>
  
<header>
    <div id="logo">Tickgotick</div>
    <ul>
            <a href="index.jsp">主页</a>
            <a href="6.1.log.jsp">登录</a>
            <a href="6.1.reg.jsp">注册</a>
            <a href="center.jsp">个人</a>
            <a href="list.jsp">订单</a>
    </ul>
</header>
  
  <body>
    <div>
    <br/>    <br/>
    <h2 align="center">购物车</h2>

	<form action="" method="post">
<%
	@SuppressWarnings("unchecked")
	Map<String, Integer> goods=(Map)session.getAttribute("goods");
	Integer totalpri=(Integer)session.getAttribute("totalpri");
	if(goods!=null){
		for (Map.Entry<String, Integer> entry : goods.entrySet()) {
%>
		<p>——————————————————————————————————————————————————————————————————————</p>
		<label class="radiobutton_container">
			<input type="checkbox" name="<%=entry.getKey()%>">
			<span class="radiobutton_mark"></span>


<%
			out.print("商品"+ entry.getKey() +":&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp总计"+entry.getValue()+"件<br/>		</label>");
		}
	}
	
%>
		<p>——————————————————————————————————————————————————————————————————————</p>
		<input type="submit" value="删除">
	</form>
	<form action="getorder.jsp" method="post">
		<span>总价格：</span>
		<input type="text" name="gpri" value="<%=totalpri%>" readonly>
		<span>元</span>
		<input type="submit" value="结账">
	</form>
<%
	@SuppressWarnings("unchecked")
	Map<String, Integer> goods1=(Map)session.getAttribute("goods");
	Map<String, Integer> repri=(Map)session.getAttribute("repri");
	Integer totalpri1=(Integer)session.getAttribute("totalpri");
	if(goods1!=null){
		for (Map.Entry<String, Integer> entry : goods1.entrySet()) {
			request.setCharacterEncoding("utf-8");
			String dl = request.getParameter(entry.getKey());//分别拿到多选返回值
			if(dl!=null&&dl.equals("on")){
				%>
				<h3 align="center">
				您从购物车中删除了商品<span>
				<%out.print(entry.getKey());%>
			</h3>
			<%
				Integer grepri=repri.get(entry.getKey());
				Integer con_grepri=grepri*entry.getValue();
				out.print("删除总价"+con_grepri);
				totalpri=totalpri-con_grepri;
				goods1.remove(entry.getKey());
			}
			else{
				out.print(dl);
			}
		}
		session.setAttribute("goods", goods1);
		session.setAttribute("totalpri",totalpri);
	}

%>
    </div>
  </body>
</html>