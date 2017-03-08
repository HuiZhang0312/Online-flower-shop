<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Flower Shop</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="css/style.css" media="all" />
	<script type="text/javascript">
	
		function validate_username(){
			var username = document.getElementById("username");
			var name_ele = document.getElementById("username_ele");
			if(username.value == ""){
				name_ele.innerHTML="<font color='red'>X Can't be empty</font>";
				return false;
			}else{
				name_ele.innerHTML="<font color='green'>√ Valid username</font>";
				return true;
			}
		}
		function validate_password(){
			var password = document.getElementById("password");
			var password_ele = document.getElementById("password_ele");
			if(password.value==""){
				password_ele.innerHTML="<font color='red'>X Can't be empty</font>";
				return false;
			}else{
				password_ele.innerHTML="<font color='green'>√ Valid password</font>";
				return true;
			}
			
		}
		
		function validate_address(){
			var address = document.getElementById("address");
			var address_ele = document.getElementById("address_ele");
			if(address.value==""){
				address_ele.innerHTML="<font color='red'>X Can't be empty</font>";
				return false;
			}else{
				address_ele.innerHTML="<font color='green'>√ Valid</font>";
				return true;
			}
			
		}
		
		
		function confirm_passwords(){
			var password = document.getElementById("password");
			var confirm_password = document.getElementById("confirm_password");
			var pw_ele = document.getElementById("pw_ele");
			if(confirm_password.value == ""){
				pw_ele.innerHTML="<font color='red'>X Can't be empty</font>";
				return false;
			}else{
				if(password.value != confirm_password.value){
					pw_ele.innerHTML="<font color='red'>X Different password</font>";
					return false;
				}else{
					pw_ele.innerHTML="<font color='green'>√ Password confirmed</font>";
					return true;
				}
			}
		}
		
		
		function validate_tel(){
			var tel = document.getElementById("tel");
			var tel_ele = document.getElementById("tel_ele");
			if(tel.value == ""){
				tel_ele.innerHTML="<font color='red'>X Can't be empty</font>";
				return false;
			}else{
				
				var patrn=/^0{0,1}(13[0-9]|15[7-9]|153|156|18[7-9])[0-9]{8}$/;
				if(!patrn.exec(tel.value)){
					tel_ele.innerHTML="<font color='red'>X Invalid phone number</font>";
					return false;
				}else{
					tel_ele.innerHTML="<font color='green'>√ Valid</font>";
					return true;
				}
			}
			
		}
		function validate_email(){
			var email =document.getElementById("email");
			var email_ele = document.getElementById("email_ele");
			if(email.value == ""){
				email_ele.innerHTML="<font color='red'>X Can't be empty</font>";
				return false;
			}else{
				var patrn=/^[a-zA-Z0-9_+.-]+\@([a-zA-Z0-9-]+\.)+[a-zA-Z0-9]{2,4}$/;
				if(!patrn.test(email.value)){
					email_ele.innerHTML="<font color='red'>X Invalid</font>";
					return false;
				}else{
					email_ele.innerHTML="<font color='green'>√ Valid</font>";
					return true;
				}
			}
		}
		function check_form(){
			return validate_username()&&validate_email()&&validate_password()&&confirm_passwords()&&validate_tel();
		}
	</script>
  </head>
  
 <style type="text/css">
<!--

* {
    margin:0;
    padding:0;
}

a {
    color:#b7b1a1;
    text-decoration:none;    
}

a:hover {
    color:#1E7ACE;
}

input, select,textarea {
    padding:1px;
    margin:2px;
    font-size:11px;
}
input.button {
	display: inline-block;
	outline: none;
	cursor: pointer;
	text-align: center;
	font: 14px/100% Arial, Helvetica, sans-serif;
	padding: .5em 2em .55em;
	-webkit-border-radius: .5em; 
	-moz-border-radius: .5em;
	border-radius: .5em;

}
input.button:hover {
	background: #f47c20;
}
input.button:active {
	position: relative;
	top: 1px;
}
#formwrapper {
    width:450px;
    margin:15px auto;
    padding:20px;
    text-align:center;
    border:1px #1E7ACE solid;
}

fieldset {
    padding:10px;
    margin-top:5px;
    border:1px solid #1E7ACE;
    background:#fff;
}


fieldset label {
    float:left;
    width:120px;
    text-align:right;
    padding:4px;
    margin:1px;
}

fieldset div {
    clear:left;
    margin-bottom:2px;
}

.enter{ text-align:center;}
.clear {
    clear:both;
}

-->
</style>
 
  
  <body>
    <div id="header">
		<ul>
			<li class="selected"><a href="HomePageServlet">home</a></li>
			<li><a href="flowers.html">our flowers</a></li>
			<li><a href="about.html">about</a></li>
			<li><a href="blog.html">blog</a></li>
			<li><a href="contact.html">contact us</a></li>	
			<%
					if (session.getAttribute("c_id") != null) {
				%>
				<li>
					<a href="SearchFlowerServlet">manage</a>
				</li>
				<li>
					<a href="ShowReportServlet">statistics</a>
				</li>
				<li>
					<a href="logout.jsp">logout</a>
				</li>
				<%
					} else {
				%>
				<li>
					<a href="LoginServlet">login</a>
				</li>
				<%
					}
				%>		
		</ul>
		<div class="logo">
			<a href="index.html"><img src="images/logo.gif" alt="" /></a>
		</div>
	</div>
	<div id="body">
		<div class="about">
			<h1>register</h1>
				<form action="RegisterServlet" method="post"
					onsubmit="return check_form()">
					<fieldset>
						
						<p><strong>
							Please read our Conditions of Use and Privacy Notice before
							register.
						</strong></p>
						<div>
							<label for="Name">
								Username
							</label>
							<input type="text" name="username" id="username" value=""
								size="20" maxlength="30" onblur="validate_username()" />
							<label id="username_ele">
								*
							</label>
							<br />
						</div>
						<div>
							<label for="Email">
								E-mail
							</label>
							<input type="text" name="email" id="email" value="" size="20"
								maxlength="150" onblur="validate_email()" />
							<label id="email_ele">
								*
							</label>
							<br />
						</div>
						<div>
							<label for="password">
								Password
							</label>
							<input type="password" name="password" id="password" size="20"
								maxlength="15" onblur="validate_password()" />
							<label id="password_ele">
								*
							</label>
							<br />
						</div>
						<div>
							<label for="confirm_password">
								Confirm password
							</label>
							<input type="password" name="confirm_password"
								id="confirm_password" size="20" maxlength="15"
								onblur="confirm_passwords()" />
							<label id="pw_ele">
								*
							</label>
							<br />

						</div>
						<div>
							<label for="address">
								Address
							</label>
							<input type="text" name="address" id="address" value="" size="20"
								maxlength="150" onblur="validate_address()" />
							<label id="address_ele">
								*
							</label>
							<br />
						</div>
						<div>
							<label for="type">
								Type
							</label>
							<input type="radio" name="type" id="type" value="individual" size="20" maxlength="15"
								checked />
							individual &nbsp;&nbsp;&nbsp;
							<input type="radio" name="type" id="type" value="business" size="20" maxlength="15" />
							business
							<label id="type_ele">
								*
							</label>
							<br />
						</div>
						
						<div>
							<label for="sex">
								Gender
							</label>
							<input type="radio" name="sex" value="Male" size="20" maxlength="15"
								checked />
							Male &nbsp;&nbsp;&nbsp;
							<input type="radio" name="sex" value="Female" size="20" maxlength="15" />
							Female
							<label id="sex_ele">
								(For individual)
							</label>
							<br />
						</div>
						<div>
							<label for="cname">
								Company name
							</label>
							<input type="text" name="cname" id="cname" value="" size="20"
								maxlength="150" onblur="validate_cname()" />
							<label id="cname_ele">
								(For business)
							</label>
							<br />
						</div>
						<div>
							<label for="tel">
								Telephone
							</label>
							<input type="text" name="tel" id="tel" size="20" maxlength="15"
								onblur="validate_tel()" />
							<label id="tel_ele">
								*
							</label>
							<br />

						</div>

						<div>
							<label for="AgreeToTerms">
								Agree
							</label>
							<input type="checkbox" name="AgreeToTerms" id="AgreeToTerms"
								value="1" />
							<label>
							*
							</label>
							<a href="#" title="Conditions of Use and Privacy Notice.">Read？</a>
						</div>
						<div class="enter">
							<input type="submit" class="button" value="Submit" />
							<input type="reset" class="button" value="Reset" />
						</div>

						<p>
							<strong>* By creating an account, you agree to
								Amazon.com's Conditions of Use and Privacy Notice.<br /> *
								Already have an account? </strong><a href="login.jsp">Sign in</a>
						</p>
					</fieldset>
				</form>
			</div>
	</div>
	<div id="footer">
		<div>
			<div class="connect">
				<h4>Follow us:</h4>
				<ul>
					<li class="facebook"><a href="http://facebook.com/freewebsitetemplates" target="_blank">facebook</a></li>
					<li class="twitter"><a href="http://twitter.com/fwtemplates" target="_blank">twitter</a></li>
				</ul>
			</div>
			<p>Copyright &copy; 2015. All rights reserved.</p>
		</div>
	</div>
  </body>
</html>
