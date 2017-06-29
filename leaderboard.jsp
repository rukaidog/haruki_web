<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
<head>
<title>Leader Board</title>
<link rel="stylesheet" type="text/css" href="css/leaderboard.css" />
</head>

<script>
	//function searchPage(e){window.event.keyCode == 70 && event.ctrlKey}
</script>

<body>

	<h1>Leader board</h1>
	<p style="font-family: cursive; color: orange; font-size: 1.5em">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Top
		30 Players Shown</p>
	<p style="font-family: NotethisRegular">
		Click <a href="alluser.jsp">HERE</a> to view all users
	</p>
	
	<p style="font-size: 1.5em">
		<a style="text-decoration: none" href="home_login.jsp">&nbsp;<b>HOME</b></a>
	</p>
	<div class="panel">
		<div class="wrap">
			<form id="searchform" name="searchForm" action="search.jsp"
				method="post">
				<input type="text" placeholder="Please enter username" id="username"
					name="username" required />
				<button type="submit" value="Search">Search</button>
			</form>
		</div>
	</div>
	<table>
		<tr>
			<td><button type="button" onclick="javascript:history.back(-1);">BACK</button></td>
		</tr>
	</table>
<div style="margin-left:200px;">
	<div style="width: 70%; hight: 100%; float: right;">
		<table>
			<tr>
				<th align="left" style="font-family: cursive; font-size: 1.5em">Player</th>
				<!-- 头像也要 -->
				<th align="left" style="font-family: cursive; font-size: 1.5em">Score</th>
				<th align="left" style="font-family: cursive; font-size: 1.5em">Time</th>
			</tr>
			
			<jsp:useBean id="loginCntrl" class="com.haruki.lab.login.impl.LoginControllerImpl" scope="page" />
			<%request.setAttribute("leaderboard",loginCntrl.showAllScore());%>
			<c:forEach var="row" items="${leaderboard}">
				<tr>
					<td style="height: 50px; width: 150px; font-family: cursive;"
						align="left"><c:out value="${row.userName}" /></td>
					<td style="height: 50px; width: 150px; font-family: cursive;"
						align="left"><c:out value="${row.score}" /></td>
					<td style="height: 50px; width: 300px;"><c:out
							value="${row.gameTime}" /></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div style="width: 30%; hight: 100%;align:right;">
		<table style="align:right;">
			<tr>
				<th align="right" style="font-family: cursive; font-size: 1.5em">NO.</th>
			</tr>
			<tr>
				<td
					style="height: 50px; width: 150px; font-family: cursive; color: blue; font-size: 1.2em"
					align="right"><b>1.</b></td>
			</tr>
			<tr>
				<td
					style="height: 50px; width: 150px; font-family: cursive; color: green; font-size: 1.1em"
					align="right"><b>2.</b></td>
			</tr>
			<tr>
				<td
					style="height: 50px; width: 150px; font-family: cursive; color: purple; font-size: 1.1em"
					align="right"><b>3.</b></td>
			</tr>
			<tr>
				<td
					style="height: 50px; width: 150px; font-family: cursive; color:rgb(120, 46, 201);"
					align="right"><b>4.</b></td>
			</tr>
			<tr>
				<td
					style="height: 50px; width: 150px; font-family: cursive; color: rgb(120, 46, 201);"
					align="right"><b>5.</b></td>
			</tr>
			<tr>
				<td
					style="height: 50px; width: 150px; font-family: cursive; color: rgb(110, 24, 189);"
					align="right">6.</td>
			</tr>
			<tr>
				<td
					style="height: 50px; width: 150px; font-family: cursive; color:rgb(110, 24, 189);"
					align="right">7.</td>
			</tr>
			<tr>
				<td
					style="height: 50px; width: 150px; font-family: cursive; color: rgb(110, 24, 189);"
					align="right">8.</td>
			</tr>
			<tr>
				<td
					style="height: 50px; width: 150px; font-family: cursive; color: rgb(110, 24, 189);"
					align="right">9.</td>
			</tr>
			<tr>
				<td
					style="height: 50px; width: 150px; font-family: cursive; color: rgb(110, 24, 189);"
					align="right">10.</td>
			</tr>
			<tr>
				<td style="height: 50px; width: 150px; font-family: cursive; color:darkblue"
					align="right">11.</td>
			</tr>
			<tr>
				<td style="height: 50px; width: 150px; font-family: cursive;color:darkblue"
					align="right">12.</td>
			</tr>
			<tr>
				<td style="height: 50px; width: 150px; font-family: cursive;color:darkblue"
					align="right">13.</td>
			</tr>
			<tr>
				<td style="height: 50px; width: 150px; font-family: cursive;color:darkblue"
					align="right">14.</td>
			</tr>
			<tr>
				<td style="height: 50px; width: 150px; font-family: cursive;color:darkblue"
					align="right">15.</td>
			</tr>
			<tr>
				<td style="height: 50px; width: 150px; font-family: cursive;color:darkblue"
					align="right">16.</td>
			</tr>
			<tr>
				<td style="height: 50px; width: 150px; font-family: cursive;color:darkblue"
					align="right">17.</td>
			</tr>
			<tr>
				<td style="height: 50px; width: 150px; font-family: cursive;color:darkblue"
					align="right">18.</td>
			</tr>
			<tr>
				<td style="height: 50px; width: 150px; font-family: cursive;color:darkblue"
					align="right">19.</td>
			</tr>
			<tr>
				<td style="height: 50px; width: 150px; font-family: cursive;color:darkblue"
					align="right">20.</td>
			</tr>
			<tr>
				<td style="height: 50px; width: 150px; font-family: cursive;color:darkblue"
					align="right">21.</td>
			</tr>
			<tr>
				<td style="height: 50px; width: 150px; font-family: cursive;color:darkblue"
					align="right">22.</td>
			</tr>
			<tr>
				<td style="height: 50px; width: 150px; font-family: cursive;color:darkblue"
					align="right">23.</td>
			</tr>
			<tr>
				<td style="height: 50px; width: 150px; font-family: cursive;color:darkblue"
					align="right">24.</td>
			</tr>
			<tr>
				<td style="height: 50px; width: 150px; font-family: cursive;color:darkblue"
					align="right">25.</td>
			</tr>
			<tr>
				<td style="height: 50px; width: 150px; font-family: cursive;color:darkblue"
					align="right">26.</td>
			</tr>
			<tr>
				<td style="height: 50px; width: 150px; font-family: cursive;color:darkblue"
					align="right">27.</td>
			</tr>
			<tr>
				<td style="height: 50px; width: 150px; font-family: cursive;color:darkblue"
					align="right">28.</td>
			</tr>
			<tr>
				<td style="height: 50px; width: 150px; font-family: cursive;color:darkblue"
					align="right">29.</td>
			</tr>
			<tr>
				<td style="height: 50px; width: 150px; font-family: cursive;color:darkblue"
					align="right">30.</td>
			</tr>
		</table>
	</div>
	</div>
	<table>
		<tr>

			<td><button type="button" onclick="javascript:history.back(-1);">BACK</button></td>
		</tr>
	</table>
</body>

</html>