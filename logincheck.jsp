<%@page import="com.haruki.lab.login.impl.LoginCheckResult"%>
<%@page import="java.util.SortedMap"%>
<%@page import="com.haruki.lab.db.rs.Result"%>
<%@ page import="java.sql.*" language="java"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>check</title>
</head>
<body>
	<jsp:useBean id="loginCntrl"
		class="com.haruki.lab.login.impl.LoginControllerImpl" scope="page" />
	<%
		String username = (String) request.getParameter("username");
		String password = (String) request.getParameter("password");
		LoginCheckResult r = loginCntrl.login(username, password);

		switch (r) {

		case USER_NOT_FOUND:
			out.print("<script language='javaScript'> alert('Username incorrect');</script>");
			response.setHeader("refresh", "0;url=login.jsp");

			break;
		case USER_CHECK_OK:
			session.setAttribute("username",username);
			loginCntrl.loginSession(username, session.getId());
			response.sendRedirect("loginsuccess.jsp");
			
			
			break;

		case USER_CHECK_NG:
			out.print("<script language='javaScript'> alert('Password incorrect');</script>");
			response.setHeader("refresh", "0;url=login.jsp");
			break;
		}

	%>






</body>
</html>