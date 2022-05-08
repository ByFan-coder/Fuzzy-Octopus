<%@ page language="java" import="java.util.*,java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>生成订单</title>
<style>
body
{
	margin:0px;
	background: url("bg.png") no-repeat;
	background-size:100% 100%;
	background-attachment:fixed;
}
#customers
{
	font-family:"Trebuchet MS", Arial, Helvetica, sans-serif;
    margin:0 auto;
	width:80%;
	border-collapse:collapse;
}
#customers td, #customers th 
{
	font-size:1em;
	border:1px solid #373e98;
	padding:20px 14px 20px 14px;
    color:#373e98
}
#customers th 
{
	font-size:1.1em;
	text-align:left;
	padding-top:10px;
	padding-bottom:10px;
	background-color:#647297;
	color:#ffffff;
}
#customers tr.alt td 
{
	color:#000000;
	background-color:#cfced5;
    color:#484d92
}
</style>
	
</head>
<body>

<%   
		String expri=request.getParameter("gpri"); 
		String user=(String)session.getAttribute("user");
		if(expri!=null){
			Integer gpri=Integer.parseInt(expri); 
			Map<String, Integer> goods=(Map)session.getAttribute("goods");
			Integer totalpri=(Integer)session.getAttribute("totalpri");

        String glist = "none";
          
        java.util.Date date=new java.util.Date();   
        String datetime=new Timestamp(date.getTime()).toString();  
  
        try   
        {   
            /** 连接数据库参数 **/  
            String driverName = "com.mysql.jdbc.Driver"; //驱动名称  
            String DBUser = "root"; //mysql用户名  
            String DBPasswd = "whatthehell"; //mysql密码  
            String DBName = "webexp"; //数据库名  
          
            String connUrl = "jdbc:mysql://localhost/" + DBName + "?user=" + DBUser + "&password=" + DBPasswd;  
            Class.forName(driverName).newInstance();  
            Connection conn = DriverManager.getConnection(connUrl);  
            Statement stmt = conn.createStatement();  
            stmt.executeQuery("SET NAMES UTF8");  
			if(goods!=null){
				for (Map.Entry<String, Integer> entry : goods.entrySet()) {
					glist=glist+entry.getKey()+"："+entry.getValue()+"件";
				}
            String insert_sql = "insert into goods values('" + user + "','" + datetime + "','" + glist + "','" + totalpri + "')";  
            try {   
                stmt.execute(insert_sql);   
            }catch(Exception e)     {  
            	out.print("错误");
                e.printStackTrace();  
            }  
			}
            //rs.close();             
            stmt.close();                 
            conn.close();   
        }catch (Exception e) {  
                e.printStackTrace();  
        } 
	}
		
		
		
		
        try {  
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/webexp"; //数据库名
            String username = "root";  //数据库用户名
            String password = "whatthehell";  //数据库用户密码
            Connection conn = DriverManager.getConnection(url, username, password);  //连接状态

            if(conn != null){  
                out.print("<br />");            
                Statement stmt = null;  
                ResultSet rs = null;  
                String sql = "SELECT *FROM goods where user = '" + user + "';";  //查询语句
                stmt = conn.createStatement();  
                rs = stmt.executeQuery(sql);  
                while (rs.next()) {  

                 	%> 
<table id="customers">
<tr>
  <th>用户</th>
  <th>时间</th>
  <th>商品</th>
  <th>总价</th>
</tr>
<tr>
<td><%=rs.getString("user")%></td>
<td><%=rs.getString("time")%></td>
<td><%=rs.getString("list")%></td>
<td><%=rs.getString("price")%></td>
</tr>
</table>
 <%
                         }
            }  
        }catch (Exception e) {        
            out.print("数据库连接异常！");  
        }  

		%>			

</body>
</html>