<%@ page import="java.sql.*" language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>login</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <link rel="stylesheet" type="text/css" href="css/login.css"/> 
</head>
<body style="font-family:verdana">
	<form id="indexform" name="indexForm" action="logincheck.jsp"
		method="post">
		<div  style="margin: 30px auto; width: 80%;">
			<div>
				<h1>Welcome to OP.GG</h1>
			</div>
			<div class="login">
				<table>
					<tr>
						<th colspan="3">Log In</th>
						<!--<td size="10">remember me</td>	 -->
					</tr>
					<tr>
						<td class="prompt">Username:</td>
						<td><input type="text" class="input" name="username"
							placeholder="please enter" size="16" maxlength="" required /></td>
						<!--	<td><input type="checkbox" name="remember" checked/></td> -->
					</tr>
					<tr>
						<td class="prompt">Password:</td>
						<td><input type="password" class="input" name="password"
							placeholder="please enter" size="16" maxlength="10" required /></td>
						<td><input type="reset" class="reset" name="clear"
							value="Reset" /></td>
					</tr>
					<tr>
						<td colspan=1><button type="button" class="cancel"
								onclick="window.location.href='home.jsp'" style="color: white">Cancel</button></td>
						<td><input type="submit" class="submit" value="Submit"
							style="color: white"></td>
					</tr>
					<a href="findpassword.jsp" class="forgot">Forgot your password?</a>
				</table>
				<p class="yet">
					Not a register member yet? <a href="signup.jsp" class="join">join us</a>
				</p>
			</div>
		</div>
	</form>
</body>
</html>