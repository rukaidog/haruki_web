<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SignUpPage</title>
<link rel="stylesheet" type="text/css" href="css/sign.css"/>
</head>
<body style="font-family: verdana">
<form action="checkRegister.jsp" id="msform" method="post">
    <!-- progressbar -->
    <ul id="progressbar">
        <li class="active">Account Setup</li>
        <li>Personal Details</li>
        <li>Register Protocol</li>
    </ul>
    <!-- fieldsets -->
    <fieldset> 
        <h2>Create your account</h2>
        <h3 style="font-size: 8">('*': required)</h3>
	<!--  <form action="checkRegister.jsp" method="post">-->
		<table>
			<tr>
				<td>*Username:</td>
				<!--用户名-->
				<td><input type="text" name="username" placeholder=" size: 3~10 " maxlength="10" required id="username" /></td>
				<td class="warnings"><span id="usernameMsg"><font color="grey"></font></span></td>
			</tr>
			<tr>
				<td>*Password:</td>
				<!--密码-->
				<td><input type="password" name="password" placeholder="size: 3~10" maxlength="10" required id="password1" /></td>
				<td class="warnings"><span id="password1Msg"><font color="red"></font></span></td>
			</tr>
			<tr>
				<td>*Confirm password:</td>
				<!--确认密码-->
				<td><input type="password" name="confirmpass" maxlength="10" required id="password2" onblur="check();" /></td>
				<td class="warnings"><span id="password2Msg"><font color="red"></font></span></td>
			</tr>
			<tr>
				<td>*E-mail:</td>
				<!--邮箱-->
				<td><input type="text" id="email" name="email" required onblur="checkemail();" /></td>
				<td class="warnings"><span id="emailMsg"><font color="red"></font></span></td>
			</tr>
			<tr>
				<td colspan="2">&nbsp; (in case of forgetting password)</td>
			</tr>
			</table><table>
      <input type="button" name="next" class="action-button" onclick="return clickCancel()" value="cancel" style="margin-right:150px;color:rgb(52, 70, 88);">
      <input type="button" name="next" class="next action-button" value="Next">
			</table>	
			 </fieldset>
			 <fieldset>
        <h2>Personal Details</h2>
        <h3 style="font-size:15px;">We will never sell it</h3>
						
		<input type="button" name="previous" class="previous action-button" value="Previous" style="margin-right:150px;">   
  <input type="button" name="next" class="next action-button" value="Next"> 			
			<div class="wrapper">						
				<p>&nbsp; Gender:</p>				
				<div class="radio-box">
				  <input type="radio" class="gender" name="gender" value="male"/><span></span> 
				  <label for="male">male</label>
				  </div>
				  <div class="radio-box">
				    <input type="radio" class="gender" name="gender" value="female"/><span></span>
				    <label for="female">female</label>
				    </div>
				    <div class="radio-box">
					 <input type="radio" class="gender" name="gender" value="other"/><span></span>
					<label for="male">other</label>			
					 </div>
				<p>&nbsp; Age:</p>			
				<select class="age" id="age" name="age" style="width:150px;height:40px;font-size:19px;outline:none;">
						<option value="null" selected>  -----    select      -----</option>
						<option value="0-16">less than 16</option>
						<option value="16-18">16 to 18</option>
						<option value="19-22">19 to 22</option>
						<option value="23-27">23 to 27</option>
						<option value="28-35">28 to 35</option>
						<option value="36-50">36 to 50</option>
						<option value="50+">more than 50</option>
				</select>		
				<p>* Your favorite color:</p>
				<ul>
				<li><input type="checkbox" name="color" class="color" value="1" style="color: black;"/><span style="color:black;">black</span> </li>
				<li><input type="checkbox" name="color" class="color" value="2" style="color: silver;"/><span style="color:silver;">white</span></li>
			    <li><input type="checkbox" name="color" class="color" value="3" style="color: blue;"/><span style="color:blue;">blue</span></li>
			    <li><input type="checkbox" name="color" class="color" value="4" style="color: red;"/><span style="color:red;">red</span> </li>
				<li><input type="checkbox" name="color" class="color" value="5" style="color: yellow;"/><span style="color:rgb(197, 197, 13);">yellow</span></li>
				<li><input type="checkbox" name="color" class="color" value="6" style="color: green;"/><span style="color:green;">green</span></li>
				<li><input type="checkbox" name="color" class="color" value="7" style="color: pink;"/><span style="color:pink;">pink</span></li>
				<li><input type="checkbox" name="color" class="color" value="8" style="color: purple;"/><span style="color:purple;">purple</span></li>				
				<li><span id="Msgcheckbox"><font color="red"></font></span></li>
			</ul>
			</div>
			    </fieldset>
    <fieldset> 
        <h2>Register Protocol</h2>
        <h3 style="font-size:15px;">Get start now!</h3>
			<table>
			<input type="button" name="previous" class="previous action-button"  value="Previous" > 
			<tr>
				<td>&nbsp; Protocol:</td>
				<td style="margin: 20px"><textarea rows="10" cols="30"
						disabled="disabled">
I agree...
</textarea></td>
			</tr>
			<tr>
				<td>*Accept protocol:</td>
				<td><input type="checkbox" class="accept" required /></td>
			</tr>
			</table>
			<table>
			<tr>			
				<td><input type="submit" class="action-button"value="Submit" style="color:rgb(255, 234, 168);" style="margin-left:50px;" /></td>
				<td><span id="submitMsg"><font color="red"></font></span></td>
			</tr>  
		</table>
		</fieldset>
	</form>
	</body>
<script src="js/sign.js" type="text/javascript"></script>
<script src="js/jquery-1.9.js" type="text/javascript"></script>
<script src="js/jquery.easing.min.js" type="text/javascript"></script>
<script src="js/zzsc.js" type="text/javascript"></script>
</html>