		//CHECKBOX REQUIRED
		function validate() {
			var es = document.getElementsByName('color');
			for (var i = 0, l = es.length; i < l; i++) {
				if (es[i].checked) {
					document.getElementById("Msgcheckbox").innerHTML = "<font color='red'></font>";
					return true
				}
			}
			document.getElementById("Msgcheckbox").innerHTML = "<font color='red'>Pick at least one color!</font>";
			return false;
		}
		// CANCEL BUTTON
		function clickCancel() {
			if (confirm("Are you sure going back to homepage?"))
				return window.location.href = "home.jsp";
			return false;
		}
		// VALID EMAIL--> 
		function checkemail() {
			if (document.getElementById("email").value.indexOf("@") == -1
					|| document.getElementById("email").value.lastIndexOf(".")
							- document.getElementById("email").value
									.indexOf("@") < 2) {
				document.getElementById("usernameMsg").innerHTML = "";
				document.getElementById("password1Msg").innerHTML = "";
				document.getElementById("password2Msg").innerHTML = "";
				document.getElementById("emailMsg").innerHTML = "  <font color='red'>Not a valid e-mail</font>";
				document.getElementById("submitMsg").innerHTML = "<font color='red'>Please complete the form</font>";

				return false;
			}
			if (!(document.getElementById("email").value.indexOf("@") == -1 || document
					.getElementById("email").value.lastIndexOf(".")
					- document.getElementById("email").value.indexOf("@") < 2)) {
				document.getElementById("usernameMsg").innerHTML = "";
				document.getElementById("password1Msg").innerHTML = "";
				document.getElementById("password2Msg").innerHTML = "";
				document.getElementById("emailMsg").innerHTML = "<font color='green'>OK</font>";
				document.getElementById("submitMsg").innerHTML = "";
				return true;
			}
		}
		//CHECK-->
		function check() {
			if (!document.getElementById("username").value
					|| "请输入用户名" == document.getElementById("username").value) {
				document.getElementById("usernameMsg").innerHTML = "<font color='red'>Please enter Username</font>";
				document.getElementById("password1Msg").innerHTML = "";
				document.getElementById("password2Msg").innerHTML = "";
				document.getElementById("emailMsg").innerHTML = "";
				document.getElementById("submitMsg").innerHTML = "<font color='red'>Please complete the form</font>";
				document.getElementById("username").focus();
				return false;
			}
			if (!document.getElementById("password1").value) {
				document.getElementById("usernameMsg").innerHTML = "";
				document.getElementById("password1Msg").innerHTML = "<font color='red'>Please enter Password</font>"
				document.getElementById("password2Msg").innerHTML = "";
				document.getElementById("emailMsg").innerHTML = "";
				document.getElementById("submitMsg").innerHTML = "<font color='red'>Please complete the form</font>";
				document.getElementById("password1").focus();
				return false;
			}
			if (document.getElementById("password1").value
					&& document.getElementById("password2").value != document
							.getElementById("password1").value) {
				document.getElementById("usernameMsg").innerHTML = "";
				document.getElementById("password1Msg").innerHTML = "";
				document.getElementById("password2Msg").innerHTML = "<font color='red'>Password incorrect</font>";
				document.getElementById("emailMsg").innerHTML = "";
				document.getElementById("submitMsg").innerHTML = "<font color='red'>Please complete the form</font>";
				return false;
			}
			//两次密码一样，就显示ok  
			if (document.getElementById("password1").value
					&& document.getElementById("password2").value == document
							.getElementById("password1").value) {
				document.getElementById("usernameMsg").innerHTML = "";
				document.getElementById("password1Msg").innerHTML = "";
				document.getElementById("password2Msg").innerHTML = "<font color='green'>OK</font>";
				document.getElementById("emailMsg").innerHTML = "";
				document.getElementById("submitMsg").innerHTML = "";
				return true;
			}
		}
		
		
	