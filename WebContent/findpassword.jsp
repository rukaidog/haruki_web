<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>ForgetPassword</title>
<link rel="stylesheet"  type="text/css" href="css/findpassword.css" />
</head>
<body>
	<form action="changepassword.jsp" name="indexform" id="indexform"
		method="post">
		<div style="margin: 30px auto; width: 80%;">
			<div>
				<h1>Welcome to OP.GG</h1>
			</div>
			<div class="findpassword">
				<table>
					<TR>
						<th colspan="2">Confirm E-mail</th>
					</TR>
					<tr>
						<td class="prompt">Username:</td>
						<td><input type="text" name="username" class="input" required /></td>
					</tr>
					<tr>
						<td class="prompt">E-mail:</td>
						<td><input type="text" name="email" class="input" required /></td>
					</tr>
					<tr>
						<td><button type="button" class="back"
								onclick="window.location.href='login.jsp'">Back</button></td>
						<td><input type="submit" class="submit" value="Next">
						</td>
					</tr>
					<a href="findpassword.jsp" class="forgot">Forgot your password?</a>
				</table>
			</div>
		</div>
	</form>
</body>
</html>