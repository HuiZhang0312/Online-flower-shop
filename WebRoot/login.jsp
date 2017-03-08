<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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

		<link rel="stylesheet" type="text/css" href="css/style.css"
			media="all" />
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	</head>

	<body>
			<div id="header">
				<ul>
					<li><a href="HomePageServlet">home</a></li>
					<li>
						<a href="flowers.html">our flowers</a>
					</li>
					<li>
						<a href="about.html">about</a>
					</li>
					<li>
						<a href="blog.html">blog</a>
					</li>
					<li>
						<a href="contact.html">contact us</a>
					</li>
					<li>
						<a href="search.jsp">search</a>
					</li>
					<li class="selected">
						<a href="login.jsp">login</a>
					</li>
				</ul>
				<div class="logo">
					<a href="index.html"><img src="images/logo.gif" alt="" />
					</a>
				</div>
			</div>
			<div id="body">
				<div class="about">
					<h1>
						login
					</h1>
					<form action="LoginServlet" method="post">
						<!-- action对应<url-pattern> -->
						<table width="208" border="0" align="center" cellpadding="5"
							cellspacing="0">
							<tr>
								<td bgcolor="#F4F4F4" class="title">
									+ LOGIN
								</td>
							</tr>
							<tr>
								<td class="grey">
									<img src="images/warning.gif" width="16" height="16"
										align="absmiddle">
									<b>Please enter username and password.</b>
								</td>
							</tr>
							<tr>
								<td class="title">
									Username
								</td>
							</tr>
							<tr>
								<td>
									<input id="username" name="username" type="text" class="username" size="30">
								</td>
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr>
								<td class="title">
									Password
								</td>
							</tr>
							<tr>
								<td>
									<input id="password" name="password" type="password" class="password"
										size="30">
								</td>
							</tr>
							<tr>
								<td class="orange">
									<a href="register.jsp">Register?</a>
								</td>
							</tr>
							<tr>
								<td align="right">
									<input type="image" src="images/login.jpg">
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<div id="footer">
				<div>
					<div class="connect">
						<h4>
							Follow us:
						</h4>
						<ul>
							<li class="facebook">
								<a href="http://facebook.com/freewebsitetemplates"
									target="_blank">facebook</a>
							</li>
							<li class="twitter">
								<a href="http://twitter.com/fwtemplates" target="_blank">twitter</a>
							</li>
						</ul>
					</div>
					<p>
						Copyright &copy; 2015. All rights reserved.
					</p>
				</div>
			</div>
		</body>
</html>
