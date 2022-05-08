<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
    <meta charset="UTF-8">
    <title>商品详情</title>
    <link rel="stylesheet" href="goodsin.css">
</head>
<body>

<% 
	String goodsin=request.getParameter("goods");
	String goodsinpri=request.getParameter("goodspri");
	Map<String, Integer> repri= new HashMap<String, Integer>();
		repri.put("Machine_learning",123);
		repri.put("Statistics",321);
		repri.put("Operating_system",456);
		repri.put("Pointers_on_C",654);
		repri.put("Arduino",789);
		repri.put("Polaris",987);
		repri.put("Java_web",12);
		repri.put("Database",21);
		repri.put("TOFEL",1234);
		repri.put("Innovator",4321);
		session.setAttribute("repri", repri);
		out.print(repri);
%>

  <div id="header" style="height:80%">
<figure class="sample">

  <img src="img/<%=goodsin%>.jpg" alt="sample1" />
  <div class="title">
    <div>
      <h2>商品序号</h2>
      <h4>'<%=goodsin%>'</h4>
    </div>
  </div>
  <figcaption>
    <p>一长串的商品介绍</p>
  </figcaption>
  <a href="#"></a>
</figure>
</div>

<div id="header" style="height:20%">
<form action="gorder.jsp" method="post">
<div class="parent">
  <input type="text" name="gname" value='<%=goodsin%>' readonly>
  <input type="text" name="gpri" value='<%=goodsinpri%>' readonly>
  <br/>
  <div class="child">
  <input id="type" type="text" name="gnum" list="typelist" placeholder="请选择商品数量">
  <datalist id="typelist">
      <option>1</option>
      <option>2</option>
      <option>3</option>
      <option>4</option>
      <option>5</option>
  </datalist>
  <input type="submit" class="a" value="加入购物车">
  <div>
</form>
</div>
</div>

  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js'></script><script src="goodsinscript.js"></script>
</body>
</html>
