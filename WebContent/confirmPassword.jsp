<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>  
<% 
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Change password</title>
</head>
<body>
<jsp:useBean id="loginCntrl" class="com.haruki.lab.login.impl.LoginControllerImpl" scope="page" />

 <%        
            String password = request.getParameter("password1");    
            String confimpwd = request.getParameter("password2");
            String email = request.getParameter("email");
            String username = request.getParameter("username");
            
            loginCntrl.resetPassword(username, password);
            out.println("<script language='javascript'>alert('密码更改成功！');</script>");    
            response.setHeader("refresh", "0;url=changepwdsuccess.jsp");
     %>  
</body>
</html>