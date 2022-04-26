<%@ page language="java" import="java.util.*,java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登陆页面</title>
	<link rel="stylesheet" type="text/css" href="6.1.css.css" />
	
</head>
<body>

 <%  
 String lid=request.getParameter("id"); //从表单获得   
 String lpw=request.getParameter("pw"); //从表单获得  
        try {  
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/webexp"; //数据库名
            String username = "root";  //数据库用户名
            String password = "whatthehell";  //数据库用户密码
            Connection conn = DriverManager.getConnection(url, username, password);  //连接状态

            if(conn != null){  
                out.print("数据库连接成功！");  
                out.print("<br />");            
                Statement stmt = null;  
                ResultSet rs = null;  
                String sql = "SELECT *FROM log where id = '" + lid + "';";  //查询语句
                stmt = conn.createStatement();  
                rs = stmt.executeQuery(sql);  
                while (rs.next()) {  
                 out.println(rs.getString("pw"));
                 if(lpw.equals(rs.getString("pw"))){
                     session.setAttribute("log", "1");
                 	%> 
                 	<div id="bigBox">
                 			<h1>SUCCESS!</h1>
                 			<div class="inputBox">
                 			<br />
                 			<a href = "store.jsp">Welcome! Click here to jump</a> 
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
                 <%
                         }
                 else{          	
                 	%>
                 	        <div id="bigBox">
                 			<h1>登陆失败!</h1>
                 			<div class="inputBox">
                 			<br />
                 			<a href = "https://tympanus.net/Development/RainEffect/index3.html">Welcome! Click here to jump</a> 
                 			<br /><br />
                 			<div class="ss">
                 			<span>请输入正确的账号密码或进行注册。</span><span>.</span>
                 			<br />
                 			<span>Please remember your id and password.</span>
                 			</div>
                 			</div>
                 		</div>
                 			
                 	<%
             }
            }  
            }
            else{  
                out.print("连接失败！");  
            }  
        }catch (Exception e) {        
            out.print("数据库连接异常！");  
        }  

%>		

</body>
</html>