<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购买成功</title>
	<link rel="stylesheet" type="text/css" href="6.1.css.css" />
	<link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
</head>
<body>
	<div id="bigBox">
			<h1>加入购物车成功</h1>
				<br />
				<a href = "goods.jsp">继续购物</a><br/>
				<a href = "list2.jsp">查看购物车</a>
			</div>
		</div>
		
	<%
    request.setCharacterEncoding("utf-8");
   		String gname=request.getParameter("gname");
   		Integer gnum=Integer.parseInt(request.getParameter("gnum"));
   		Map<String, Integer> goods=(Map)session.getAttribute("goods");
   		if(goods==null){
   			Map<String, Integer> goods1= new HashMap<String, Integer>();
   			goods1.put(gname,gnum);
   			session.setAttribute("goods", goods1);
   			out.print(goods1);
   			}
   		//有的话就在原来的基础上改，很弱智...
   		else{
   		if(gname!=null){
   				boolean exist=goods.containsKey(gname);
   				//判断是否已经买过这玩意...
   				out.print(exist);
   				//买过的话，就在加上之前的数量
   				if(exist){
   					Integer exnum=goods.get(gname);
   					Integer afnum=exnum+gnum;
   					goods.put(gname,afnum);
   		   			out.print(goods);
   						}
   				//没买过，直接put
   				else{
   				goods.put(gname,gnum);
   					}
   				}
   			}
   		
   		Integer gpri=Integer.parseInt(request.getParameter("gpri"));
   		Integer totalpri=(Integer)session.getAttribute("totalpri");
   		if(totalpri==null){
   			session.setAttribute("totalpri", gpri*gnum);
   		}
   		else{
   			totalpri=totalpri+gpri*gnum;
   			session.setAttribute("totalpri", totalpri);
   		}
   		
    %>

</body>
</html>