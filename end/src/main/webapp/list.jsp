<%@ page language="java" import="java.util.ArrayList"  pageEncoding="UTF-8"%>
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
	<link rel="stylesheet" type="text/css" href="radiobutton.css">

  </head>
  
  <body>
    <div align ="center">
    <h2 align="center">欢迎光临新华书店</h2>
    <a href ="g1.jsp">文学类图书</a>&nbsp&nbsp&nbsp&nbsp
    <a href ="g2.jsp">学习类图书</a><br>
    <p>我的购物车</p><br>
	<form action="" method="post">
<%
	@SuppressWarnings("unchecked")
	ArrayList<String> l = (ArrayList<String>)session.getAttribute("books");
	if(l!=null){
		for(int i = 0 ; i < l.size() ; i++){
%>
		<label class="radiobutton_container">
			Max
			<input type="checkbox" name="<%=l.get(i)%>">
			<span class="radiobutton_mark"></span>
		</label>

<%
			out.print("商品"+(i+1)+":"+l.get(i)+"<br>");
		}
	}
	
%>
		<input type="submit" value="删除">
	</form>
<%
	@SuppressWarnings("unchecked")
	ArrayList<String> m = (ArrayList<String>)session.getAttribute("books");
	if(m!=null){
		for(int i = 0 ; i < m.size() ; i++){
			request.setCharacterEncoding("utf-8");
			String dl = request.getParameter(m.get(i));//分别拿到多选返回值
			if(dl!=null&&dl.equals("on")){
				%>
				<h3 align="center">
				您刚才删除了商品<span>
				<%out.print(m.get(i));%>
				</span>,请问,你还想做什么?<br>
			</h3><%
				m.remove(i);
				i = i-1;
			}
		}
		session.setAttribute("books", m);
	}

		out.print(session.getAttribute("log"));
%>
    </div>
  </body>
</html>
