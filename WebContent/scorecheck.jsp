<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>  
<% 
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>score check</title>
</head>
<body>
<jsp:useBean id="loginCntrl" class="com.haruki.lab.login.impl.LoginControllerImpl" scope="page" />


 <%
 if("POST".equalsIgnoreCase(request.getMethod())) {
	 String username = request.getParameter("username");
     Integer score = Integer.parseInt(request.getParameter("score"));
//("score") != null &&!request.getParameter("score").equals("") ? Integer.parseInt(request.getParameter("score")) : null;

	 loginCntrl.snake(username, score);
	 response.setHeader("refresh", "0;url=leaderboard.jsp");
 } else {
	 out.println("<script> alert('Invalid method of request.') </script>");
 }
     %>  
</body>
</html>