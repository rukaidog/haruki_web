<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="css/search.css" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Search</title>
</head>
<jsp:useBean id="loginCntrl"
	class="com.haruki.lab.login.impl.LoginControllerImpl" scope="page" />

<body>
<button type="button" onclick="javascript:history.back(-1);">BACK</button>
	<%
		String username = request.getParameter("username");
		if (!loginCntrl.search(username)) {
			out.print("<script language='javaScript'> alert('USER NOT FOUND!');</script>");
			response.setHeader("refresh", "0;url=leaderboard.jsp");
		} else {
			request.setAttribute("ui", loginCntrl.findUserByName(username));
			request.setAttribute("loginSessions", loginCntrl.searchHistory(username));
			request.setAttribute("scores", loginCntrl.searchScore(username));
	%>
<fieldset>
<legend>User Details</legend>
	<table  class="table1" border="5" width="60%" align="center">
		<tr>
			<th>User</th>
			<th>gender</th>
			<!-- 头像也要 -->
			<th>age</th>
			<th>RegisterDate</th>
		</tr>
		<tr>
			<td><c:out value="${ui.userName}" /></td>
			<td><c:out value="${ui.gender}" /></td>
			<td><c:out value="${ui.age}" /></td>
			<td><c:out value="${ui.registerDate}" /></td>
		</tr>
	</table>
	<br />
	<table  class="altrowstable" id="alternatecolor" border="1" width="60%" align="center">
		<tr>
			<th align="left">Player</th>
			<th align="left">Score</th>
			<th align="left">Game Time</th>
		</tr>
		<c:forEach var="row" items="${scores}">
			<tr>
				<td><c:out value="${row.userName}" /></td>
				<td><c:out value="${row.score}" /></td>
				<td><c:out value="${row.gameTime}" /></td>
			</tr>
		</c:forEach>
	</table>
	<table class="table3" border="0" width="30%" align="center">
		<tr>
			<th align="left">User</th>
			<th align="left"><a name="Logincheck">Login Date/Time Record</a></th>
		</tr>
		<c:forEach var="row" items="${loginSessions}">
			<tr>
				<td><c:out value="${row.userName}" /></td>
				<td><c:out value="${row.loginTime}" /></td>
			</tr>
		</c:forEach>
		<%
			}
		%>
	</table>
		</fieldset>
</body>
<script>
function altRows(id){
	if(document.getElementsByTagName){  	
		var table = document.getElementById(id);  
		var rows = table.getElementsByTagName("tr"); 	 
		for(i = 0; i < rows.length; i++){          
			if(i % 2 == 0){
				rows[i].className = "evenrowcolor";
			}else{
				rows[i].className = "oddrowcolor";
			}      
		}
	}
}
window.onload=function(){
	altRows('alternatecolor');
}
</script>
</html>