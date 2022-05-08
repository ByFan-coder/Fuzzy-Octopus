<%@ page language="java" import="java.util.*,java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
	<link rel="stylesheet" type="text/css" href="6.1.css.css" />
	
</head>
<body>

<%   
        String lid=request.getParameter("id"); //从表单获得   
        String lpw=request.getParameter("pw"); //从表单获得  
        String state = "1";
          
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
            String insert_sql = "insert into log values('" + lid + "','" + lpw + "')";  
            String query_sql = "select * from log";  
            try {   
                stmt.execute(insert_sql);   
            }catch(Exception e)     {  
            	out.print("您输入的用户名已被使用，请重新输入");
            	state="0";
                e.printStackTrace();  
            }  
 
            //rs.close();             
            stmt.close();                 
            conn.close();   
        }catch (Exception e) {  
                e.printStackTrace();  
        }   
if(state == "1"){
%> 
	<div id="bigBox">
			<h1>SUCCESS!</h1>
			<div class="inputBox">
			<br />
			<a href = "6.1.log.jsp">欢迎！请点此登陆</a> 
			<br /><br />
			<div class="ss">
			<span>Nice to meet you,</span><span id="demo"></span><span>.</span>
			<br />
			<span>Please remember your id and password.</span>
			</div>
			</div>
		</div>


<script>
document.getElementById("demo").innerHTML = '<%=lid%>';
</script>

<% }%>			

</body>
</html>