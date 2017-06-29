<%@page import="com.haruki.lab.login.impl.ForgotPasswordUserCheck"%>
<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>  
<% 
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%> 

<jsp:useBean id="loginCntrl" class="com.haruki.lab.login.impl.LoginControllerImpl" scope="page" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Change password</title>
</head>
<body>
 <%     
            String username = request.getParameter("username");    
            String email = request.getParameter("email");
            String password = "";
            
            ForgotPasswordUserCheck rs = loginCntrl.checkUserInfo(username, email);
            if(rs == ForgotPasswordUserCheck.USER_CHECK_OK) {
            	request.getRequestDispatcher("newpassword.jsp").forward(request, response);
            }else {
            	out.print("<script language='javaScript'> alert('Username and email were not matched!');</script>");
                response.setHeader("refresh", "0;url=findpassword.jsp");	
            }
     %>  
</body>
</html>