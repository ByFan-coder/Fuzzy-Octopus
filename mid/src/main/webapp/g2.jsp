<%@ page language="java" import="java.util.ArrayList" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP '7.3.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type ="text/css">
input{
background:pink;
border:0px solid #c00;
}
</style>
  </head>
  
  <body>
    <div align ="center">
    <h2 align="center">欢迎光临新华书店</h2>
    <p>*****书籍列表*****</p>
    <form action=""method="post">
    <input type="text" name="book" value="《通信原理》&nbsp&nbsp&nbsp&nbsp曹丽娜 &nbsp&nbsp&nbsp 78.5元" size="40" maxlength="200" readonly>
    <input type="submit"name="add" value ="加入购物车" height="2">
    </form>
    <form action=""method="post">
    <input type="text" name="book" value="《软件工程导论》&nbsp&nbsp&nbsp&nbsp张海藩 &nbsp&nbsp&nbsp 15.8元" size="40" maxlength="200" readonly>
    <input type="submit"name="add" value ="加入购物车" height="2">
    </form>
    <form action=""method="post">
    <input type="text" name="book" value="《无线传感器网络》&nbsp&nbsp&nbsp&nbsp孙利民 &nbsp&nbsp&nbsp 79.2元" size="40" maxlength="200" readonly>
    <input type="submit"name="add" value ="加入购物车" height="2">
    </form>
    <%
   request.setCharacterEncoding("utf-8");
   		String[]book=request.getParameterValues("book");
   		ArrayList books=(ArrayList)session.getAttribute("books");
   		if(books==null){
   			books=new ArrayList();
   			session.setAttribute("books", books);
   			}
   		if(book!=null){
   			out.println("<script type='text/javascript'>alert('加入购物车成功！');</script>");
   			for(int i=0;i<book.length;i++){
   				books.add(book[i]);}	
   			}
    %>
    <br>
    <input type ="button" value="查看我的购物车" onClick="location.href='list.jsp'"><br>
    </div>
  </body>
</html>