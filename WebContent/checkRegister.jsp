<%@page import="com.haruki.lab.login.impl.RegisterUser"%>
<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>  
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  
  <jsp:useBean id="loginCntrl" class="com.haruki.lab.login.impl.LoginControllerImpl" scope="page" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>  
  <head>  
    <base href="<%=basePath%>">      
    <title>Success!</title>  
    <meta http-equiv="pragma" content="no-cache">  
    <meta http-equiv="cache-control" content="no-cache">  
    <meta http-equiv="expires" content="0">      
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">  
    <meta http-equiv="description" content="This is my page">  
    <!-- 
    <link rel="stylesheet" type="text/css" href="styles.css"> 
    -->  
  </head>  
  <body>  
    <%        
            String user = request.getParameter("username");    
            String pwd = request.getParameter("password");  
            String email = request.getParameter("email");
            String gender = request.getParameter("gender");
            String age = request.getParameter("age");
            
            String[] colors = request.getParameterValues("color");  
            RegisterUser rs = loginCntrl.register( user,  pwd,  email,  gender,  age,  colors);
           
            if(rs == RegisterUser.USER_REGISTER_NG) {
            	 out.println("<script language='javascript'>alert('该用户已存在，请重新注册！');window.location.href='signup.jsp';</script>");
                }else{                        
                 out.println("<script language='javascript'>alert('用户注册成功！');window.location.href='login.jsp';</script>");    
                        
                }
                
     %>  
  </body>  
</html>  