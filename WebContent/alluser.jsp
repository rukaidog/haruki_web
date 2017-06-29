<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
<head>
<title>Leader Board</title>
 <link rel="stylesheet" type="text/css" href="css/alluser.css"/> 
</head>
<body>

	<h1>ALL USERS</h1>
	<p>order by register date</p>
	<button type="button" onclick="javascript:history.back(-1);">BACK</button>
	<table>
		<tr>
			<td></td>
		</tr>
	</table>
	<table  class="imagetable" border="1" width="60%" align="center">
		<tr>
			<th>NO.</th>
			<th colspan=2>Player</th>
			<!-- 头像也要 -->
			<th>Age</th>
			<th>RegisterDate</th>
			<th>Time</th>
		</tr>
			<jsp:useBean id="loginCntrl" class="com.haruki.lab.login.impl.LoginControllerImpl" scope="page" />
			<%request.setAttribute("alluser",loginCntrl.showAllUser());%>
		
		<c:forEach var="row" items="${alluser}" varStatus="st">
			<tr>
				<td><c:out value="${st.index +1}" /></td>			
				<td><c:out value="${row.userName}" /></td>
				<td><c:out value="${row.gender}" /></td>
				<td><c:out value="${row.age}" /></td>
				<td><c:out value="${row.registerDate}" /></td>
				<td><c:out value="${row.registerTime}" /></td>
			</tr>
		</c:forEach>
	</table>
	<table align="center">
		<tr>
			<td><button type="button" onclick="javascript:history.back(-1);">BACK</button></td>
		</tr>
	</table>
</body>
</html>