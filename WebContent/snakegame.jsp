<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>SNAKY SNAKE!</title>
<link rel="stylesheet" type="text/css" href="css/snake.css" />
<script src="js/snake.js" type="text/javascript"></script>
</head>
<body>
	<form id="scoreFrm" action="scorecheck.jsp" method="post">
		<input type="hidden" id="username" name="username"
			value='<c:out value="${sessionScope.username}"></c:out>'> <input
			type="hidden" id="score" name="score">
	</form>
	<div id="page">
		<div id="yard">
			<canvas id="canvas" height="600px" width="800px"></canvas>
		</div>
		<div id="help">
			<div id="mark">
				Score: <span id="scoreVal"></span>
			</div>
			<div id="helper">
				<table>
					<tr>
						<td></td>
						<td><button onclick="keydown(38);">Up</button></td>
						<td></td>
					</tr>
					<tr>
						<td><button onclick="keydown(37);">Left</button></td>
						<td><button onclick="keydown(80);" id="pause">Pause</button></td>
						<td><button onclick="keydown(39);">Right</button></td>
					</tr>
					<tr>
						<td></td>
						<td><button onclick="keydown(40);">Down</button></td>
						<td></td>
					</tr>
				</table>
				<a href="snakegame.jsp">Play Again</a>
			</div>
			<a href="home_login.jsp">Home</a>
		</div>
	</div>
	<div style="text-align: center;"></div>
	<div id="txt"></div>

</body>
</html>