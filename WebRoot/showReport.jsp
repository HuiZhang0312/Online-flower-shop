<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	List<Map<String, String>> plist = (List) request
			.getAttribute("plist");
	List<Map<String, String>> slist = (List) request
	.getAttribute("slist");
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
select {
	width:145px;
}

-->
</style>
  <body>
    	<div id="header">
		<ul>
			<li><a href="HomePageServlet">home</a></li>
			<li><a href="flowers.html">our flowers</a></li>
			<li><a href="about.html">about</a></li>
			<li><a href="blog.html">blog</a></li>
			<li><a href="contact.html">contact us</a></li>
			<li><a href="search.jsp">search</a></li>
			<%
					if (session.getAttribute("c_id") != null) {
				%>
				<li>
					<a href="SearchFlowerServlet">manage</a>
				</li>
				<li class="selected">
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
			<h1>Report</h1>
				<form>
					<fieldset>
						<p>
							<strong> Here is the report. </strong>
						</p>
						<div class="enter">
							<table align="center">
								<thead>
									<td colspan="7" align="center">
										<b><font size="5">Statistics</font>
										</b>
									</td>
								</thead>
								<tr>
									<td width="300px" align="center">
										<b>payment method</b>
									</td>
									<td width="300px" align="center">
										<b>transaction number</b>
									</td>
								</tr>
								<%
									for (int i = 0; i < plist.size(); i++) {
										Map<String, String> onerow = plist.get(i);
										if (plist.size() > 0) {
								%>
								<tr>
									<td width="300px" align="center"><%=onerow.get("t_payment_method")%></td>
									<td width="300px" align="center"><%=onerow.get("customer_number")%></td>
								</tr>
								<%
									} else {
								%>
								<tr height="30px">
									<td></td>
									<td></td>
								</tr>
								<%
									}
									}
								%>
								<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
								<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
								<tr>
									<td width="300px" align="center">
										<b>status</b>
									</td>
									<td width="300px" align="center">
										<b>transaction number</b>
									</td>
								</tr>
								<%
									for (int i = 0; i < slist.size(); i++) {
										Map<String, String> onerow = slist.get(i);
										if (slist.size() > 0) {
								%>
								<tr>
									<td width="300px" align="center"><%=onerow.get("t_status")%></td>
									<td width="300px" align="center"><%=onerow.get("number")%></td>
								</tr>
								<%
									} else {
								%>
								<tr height="30px">
									<td></td>
									<td></td>
								</tr>
								<%
									}
									}
								%>
							</table>
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
