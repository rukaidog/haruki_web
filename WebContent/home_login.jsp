<%@page import="com.haruki.lab.web.SessionUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%
	SessionUtils.checkUserLogin(request, response);
%>
<%
	response.addHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.addHeader("Cache-Control", "pre-check=0, post-check=0");
	response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="css/bootstrap.min.css">
<title>HomePage</title>
<link rel="stylesheet"  type="text/css" href="css/home_login.css" />
</head>
<body>
	<div class="container">
		<div class="jumbotron">
			<h1 style="font-family: verdana; color: purple">OP.GG Game
				Center</h1>
			<p id="halo" onclick="this.innerHTML='WELCOME'"
				onmouseover="style.color='red'" onmouseout="style.color='blue'"
				onmousedown="style.color='yellow'">Welcome to HOME PAGE</p>
			<table align="right">
				<tr>
				</tr>
				<tr>
					<td><p style="font-family: -webkit-pictograph; color: orange">
							Welcome <span style="font-family: cursive; color: crimson"><c:choose>
									<c:when test="${empty sessionScope.username}">user</c:when>
									<c:otherwise>
										<c:out value="${sessionScope.username}"></c:out>
									</c:otherwise>
								</c:choose></span>!!!
						</p></td>
					<td>
						<div class="dropdown">
							<button class="dropbtn" >
								<c:choose>
									<c:when test="${empty sessionScope.picUrl }">
										<img border="0" src="img/indexphoto.jpg" width="60px"
											height="60px" id="index" name="picture" />
									</c:when>
									<c:otherwise>
										<img border="0"
											src='<c:out value="${sessionScope.picUrl}"></c:out>'
											width="60px" height="60px" id="index" name="picture" />
									</c:otherwise>
								</c:choose>
							</button>
							<div class="dropdown-content">
								<button onclick="changepic(1)">
									<img border="0" src="img/1.gif" width="60px" height="60px"
										alt="Chrysanthemum" />
								</button>
								<!-- 菊花 -->
								<button onclick="changepic(2)">
									<img border="0" src="img/2.gif" width="60" height="60"
										alt="QuestionMark" />
								</button>
								<!-- 问号 -->
								<button onclick="changepic(3)">
									<img border="0" src="img/3.gif" width="60" height="60"
										alt="Hydrangea" />
								</button>
								<!-- 八仙花 -->
								<button onclick="changepic(4)">
									<img border="0" src="img/4.gif" width="60" height="60"
										alt="Jellyfish" />
								</button>
								<!-- 水母 -->
								<button onclick="changepic(5)">
									<img border="0" src="img/5.gif" width="60" height="60"
										alt="Lighthouse" />
								</button>
								<!-- 灯塔 -->
								<button onclick="changepic(6)">
									<img border="0" src="img/6.gif" width="60" height="60"
										alt="Penguin" />
								</button>
								<!-- 企鹅 -->
								<button onclick="changepic(7)">
									<img border="0" src="img/7.gif" width="60" height="60"
										alt="Koala" />
								</button>
								<!-- 考拉 -->
								<button onclick="changepic(8)">
									<img border="0" src="img/8.gif" width="60" height="60"
										alt="Desert" />
								</button>
								<!-- 沙漠 -->
								<button onclick="changepic(9)">
									<img border="0" src="img/9.gif" width="60" height="60"
										alt="Tulip" />
								</button>
								<!-- 郁金香 -->
							</div>
						</div>
					</td>
				</tr>
			</table>
		
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="introduce">
				<h2>opGG</h2>
				<p><b>Snake (video game)</b></p>
				<p>The Snake design dates back to the arcade game Blockade,
					developed and published by Gremlin in 1976.</p>
				<p>was cloned as Bigfoot Bonkers the same year. In 1977, Atari
					released two Blockade-inspired titles: the arcade game Dominos and
					Atari 2600 game Surround. Surround was one of the nine Atari 2600
					(VCS) launch titles in the United States and was also sold by Sears
					under the name Chase. That same year, a similar game was launched
					for the Bally Astrocade as Checkmate.</p>
			</div>
			<div class="nav">
				<table align="center">			
					<tr>
						<td><button style="height: 80px; width: 200px;" type="button"
								onclick="window.location.href='snakegame.jsp'">Start
								Game</button></td>
								
								<td style="padding-left:5px;padding-right:5px;"><p style="font-family: cursive; color: blue"
								id="loginsession">
								userID:
								<c:choose>
									<c:when test="${empty sessionScope.username}">Not logged in</c:when>
									<c:otherwise>
										<c:out value="${sessionScope.username}"></c:out>
									</c:otherwise>
								</c:choose>
							</p></td>
							
							
					</tr>
					<tr>
						<td><button style="height: 80px; width: 200px;" type="button"
								onclick="window.location.href='leaderboard.jsp'">Leaderboard</button></td>
					</tr>
					<tr>
						<td><button style="height: 80px; width: 200px;" type="button"
								onclick="window.location.href='help.jsp?index=name_pic'">Help</button></td>
					</tr>
					<tr>
						<td><button style="height: 80px; width: 200px;" type="button"
								onclick="document.getElementById('logoutFrm').submit()">Log
								Out</button></td>
					</tr>
				</table>
			</div>			
			<jsp:useBean id="loginCntrl" class="com.haruki.lab.login.impl.LoginControllerImpl" scope="page" />
			<%  
			request.setAttribute("top5score",loginCntrl.showTop5Score());%>
			<div class="scoreList">
				<h2>Top 5 Ranking</h2>
<table>
			<tr>
				<th align="left" style="font-family: cursive; font-size: 1.3em">No.</th>
				<th align="left" style="font-family: cursive; font-size: 1.3em">Player</th>
				<th align="left" style="font-family: cursive; font-size: 1.3em">Score</th>
			</tr>
			<c:forEach var="row" items="${top5score}" varStatus="st">
				<tr>
					<td style="height: 25px; width: 150px; font-family: cursive; "
						align="left" ><c:out value="${st.index +1}" /></td>
					<td style="height: 25px; width: 150px; font-family: cursive;"
						align="left"><c:out value="${row.userName}" /></td>
					<td style="height: 25px; width: 150px; font-family: cursive;"
						align="left"><c:out value="${row.score}" /></td>
				</tr>
			</c:forEach>
		</table>
			</div>
		</div>
	</div>
	<form action="logout.jsp" method="post" id="logoutFrm"></form>
</body>
<script>
	function changepic(name_pic) {
		document.getElementById("index").src = "img/" + name_pic + ".gif";
		var img = new Image();
		img.src = "picStore.jsp?picUrl=" + "img/" + name_pic + ".gif";
	}
</script>
</html>