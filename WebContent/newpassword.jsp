<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>ChangePassword</title>
<link rel="stylesheet"  type="text/css" href="css/newpassword.css" />
</head>
<body>
		<form action="confirmPassword.jsp" name="indexform" id="indexform" method="post" onsubmit="return check();">
		<div  style="margin: 30px auto; width: 80%;">
			<div>
				<h1>Welcome to OP.GG</h1>
			</div>
	<div class="newpassword">
			<table>
				<tr>
					<th colspan="2">Change your password</th>
				</tr>
				<tr>
					<td class="prompt">Username:</td>
					<td><input type="text" class="input" value="${param.username}"
						disabled /></td>
					<input type="hidden" id="username" name="username" class="input"
						value="${param.username}">
				<tr>
				<tr>
					<td class="prompt">New Password:</td>
					<td><input type="password" name="password1" id="password1"
						class="input" required /></td>
				</tr>
				<tr>
					<td class="prompt">Confirm Password:</td>
					<td><input type="password" name="password2" id="password2"
						onblur="check()" class="input" required /></td>
					<td><span id="warning"> </span></td>
				</tr>
				<tr>
					<td><button type="button"
							onclick="window.location.href='login.jsp'" class="cancel">Cancel</button></td>
					<td><input type="submit" value="Submit" class="submit"></td>
				</tr>
				<a href="findpassword.jsp" class="forgot">Forgot your password?</a>
			</table>
	</div>
	</div>
		</form>
	<script>
		function check() {
			if (document.getElementById("password1").value != document
					.getElementById("password2").value) {
				document.getElementById("warning").innerHTML = "<font color='red'>The passwords you entered must be the same</font>";
				return false;
			} else {
				document.getElementById("warning").innerHTML = "   ";
				return true;
			}
		}
	</script>
</body>
</html>