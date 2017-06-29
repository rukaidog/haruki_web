<%@page import="com.haruki.lab.web.SessionUtils"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <% SessionUtils.checkUserLogin(request, response); %>
       <%
 response.addHeader("Pragma", "no-cache");
 response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
 response.addHeader("Cache-Control", "pre-check=0, post-check=0");
 response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>BYE</title>
<%
  String currentUserName = null;
  if(com.haruki.lab.web.SessionUtils.checkUserLogin(request, response)) {
	currentUserName = (String) session.getAttribute("username");
	session.invalidate();
	response.setHeader("refresh", "2;url=home.jsp");
  }
	
%>
<style>
body {
	background-image:url(img/homeBG4.jpg);
	background-repeat: repeat;
	 background-position:center;
	 background-size:cover;
}
</style>
</head>
<body>
<br/>
<br/>
<br/>
<br/>
<% if(currentUserName != null) { %>
 	<h1 align="center" style="font-family: cursive; color: purple">Bye <%=currentUserName %></h1>
 <%} %>
 	<p align="center" style="font-family:-webkit-pictograph;color:blue">Redirect to home after 2 seconds.</p>
</body>

 
</html>