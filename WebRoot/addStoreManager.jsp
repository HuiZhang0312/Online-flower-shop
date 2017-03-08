<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
.select{
	width:150px;
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
				<li class="selected">
					<a href="addFlower.jsp">add</a>
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
			<h1>add store manager</h1>		
			<form action="AddFloristServlet" method="post"
					onsubmit=" return check_form()">
					<fieldset>
						
						<p><strong>
							Please add the information of store manager.
						</strong></p>
						
						<div>
							<label for="florist_name">
								Name
							</label>
							<input type="text" name="florist_name" id="florist_name" value=""
								size="20" maxlength="30" onblur="validate()"/>
							<label id="florist_name_ele">
								*
							</label>
							<br />
						</div>
						<div>
							<label for="florist_email">
								email
							</label>
							<input type="text" name="florist_email" id="florist_email" size="20" value=""
								maxlength="30" onblur="validate()" />
							<label id="florist_email_ele">
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
							<label for="florist_address">
								Address
							</label>
							<input type="text" name="florist_address" id="florist_address" size="20" value=""
								maxlength="15" onblur="validate()" />
							<label id="florist_address_ele">
								*
							</label>
							<br />
						</div>
						<div>
							<label for="florist_price">
								Phone
							</label>
							<input type="text" name="florist_price" value=""
								id="florist_price" size="20" maxlength="15"
								onblur="validate()" />
							<label id="florist_price_ele">
								*
							</label>
							<br />
						</div>
						<div>
										<label>
											Store:
										</label>
										<label id="pick_up_ele">
											*
										</label>
											<select class="select" id="location" name="location">
												<option value="" selected></option>
											</select>

											<br />
						</div>
						
						<div class="enter">
							<input type="submit" class="button" value="Submit" />
							<input type="reset" class="button" value="Reset" />
						</div>
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
