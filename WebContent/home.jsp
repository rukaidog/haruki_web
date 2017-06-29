<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="css/bootstrap.min.css">
<title>HomePage</title>
<link rel="stylesheet" type="text/css" href="css/home.css" />
</head>
<body>
	<div class="container">
		<div class="jumbotron">
			<h1 style="font-family: verdana; color: purple">OP.GG Game
				Center</h1>
			<p id="halo" onclick="this.innerHTML='WELCOME'"
				onmouseover="style.color='red'" onmouseout="style.color='blue'">Welcome
				to HOME PAGE</p>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<h2>opGG</h2>
				<p>Snake (video game)</p>
				<p>The Snake design dates back to the arcade game Blockade,
					developed and published by Gremlin in 1976.</p>
				<p>was cloned as Bigfoot Bonkers the same year. In 1977, Atari
					released two Blockade-inspired titles: the arcade game Dominos and
					Atari 2600 game Surround. Surround was one of the nine Atari 2600
					(VCS) launch titles in the United States and was also sold by Sears
					under the name Chase. That same year, a similar game was launched
					for the Bally Astrocade as Checkmate.</p>
			</div>
			<div class="col-md-4">
				<table border="0" align="center">
					<tr>
						<td><span style="font-family: cursive; color: blue"> <c:choose>
									<c:when test="${empty sessionScope.username}">Not logged in</c:when>
									<c:otherwise>
										<c:out value="${sessionScope.username}"></c:out>
									</c:otherwise>
								</c:choose>
						</span></td>
					</tr>
				</table>
				<div class="nav">
					<table>
						<tr>
							<td style="font-family: cursive; font-size: 1.5em"><button
									style="height: 80px; width: 200px;" type="button"
									onclick="window.location.href='login.jsp'">Log In</button></td>
						</tr>
						<tr>
							<td style="font-family: cursive; font-size: 1.5em"><button
									style="height: 80px; width: 200px;" type="button"
									onclick="window.location.href='signup.jsp'">Sign Up</button></td>
						</tr>
						<tr>
						</tr>
						<tr>
							<td style="font-family: cursive; font-size: 1.4em"><button
									style="height: 80px; width: 200px;" type="button"
									onclick="window.location.href='leaderboard.jsp'">Leaderboard</button></td>
						</tr>
						<tr>
							<td style="font-family: cursive; font-size: 1.5em"><button
									style="height: 80px; width: 200px;" type="button"
									onclick="window.location.href='help.jsp'">Help</button></td>
						</tr>
					</table>
				</div>
			</div>
			<jsp:useBean id="loginCntrl"
				class="com.haruki.lab.login.impl.LoginControllerImpl" scope="page" />
			<%
				request.setAttribute("top5score", loginCntrl.showTop5Score());
			%>
			<div class="scorelist">
				<h2 style="font-family: cursive; color: green; padding-bottom: 10px">Top
					5 Ranking</h2>
				<table>
					<tr>
						<th align="left" style="font-family: cursive; font-size: 1.3em">No.</th>
						<th align="left" style="font-family: cursive; font-size: 1.3em">Player</th>
						<th align="left" style="font-family: cursive; font-size: 1.3em">Score</th>
					</tr>
					<c:forEach var="row" items="${top5score}" varStatus="st">
						<tr>
							<td style="height: 40px; width: 150px; font-family: cursive;"
								align="left"><c:out value="${st.index +1}" /></td>
							<td style="height: 40px; width: 150px; font-family: cursive;"
								align="left"><c:out value="${row.userName}" /></td>
							<td style="height: 40px; width: 150px; font-family: cursive;"
								align="left"><b><c:out value="${row.score}" /></b></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>