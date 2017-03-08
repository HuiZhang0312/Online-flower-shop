<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

List<Map<String,String>> list = (List) request.getAttribute("list");
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
	<script>
	function pass()
	{
		document.getElementById("f_picture").value = document.getElementById("f_picture_file").value;
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
				<li class="selected">
					<a href="SearchFlowerServlet">manage</a>
				</li>
				<li><a href="addFlower.jsp">add</a></li>	
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
			<h1>update flower</h1>		
			<form action="UpdateFlowerServlet" method="post"
					onsubmit=" return check_form()">
					<fieldset>
						
						<p><strong>
							Please update the information of flower.
						</strong></p>
						<div>
							<label for="f_id">
								Flower id
							</label>
							<input type="text" name="f_id" id="f_id" value="<%= list.get(0).get("f_id") %>"
								size="20" maxlength="30" onblur="validate()"/>
							<label id="f_id_ele">
								*
							</label>
							<br />
						</div>
						<div>
							<label for="f_name">
								Flower name
							</label>
							<input type="text" name="f_name" id="f_name" value="<%= list.get(0).get("f_name") %>"
								size="20" maxlength="30" onblur="validate()"/>
							<label id="f_name_ele">
								*
							</label>
							<br />
						</div>
						<div>
							<label for="f_type">
								Flower type
							</label>
							<input type="text" name="f_type" id="f_type" size="20" value="<%= list.get(0).get("f_type") %>"
								maxlength="30" onblur="validate()" />
							<label id="f_type_ele">
								*
							</label>
							<br />
						</div>
						<div>
							<label for="f_quantity">
								Quantity
							</label>
							<input type="text" name="f_quantity" id="f_quantity" size="20" value="<%= list.get(0).get("f_quantity") %>"
								maxlength="15" onblur="validate()" />
							<label id="f_quantity_ele">
								*
							</label>
							<br />
						</div>
						<div>
							<label for="f_price">
								Price
							</label>
							<input type="text" name="f_price" value="<%= list.get(0).get("f_price") %>"
								id="f_price" size="20" maxlength="15"
								onblur="validate()" />
							<label id="f_price_ele">
								*
							</label>
							<br />

						</div>
						<div>
							<label for="f_picture">
								Picture
							</label>
							<input type"text" name="f_picture" id="f_picture" size"20" maxlenth="100" 
								value=<%= list.get(0).get("f_picture") %>>
							<input type="file" name="f_picture_file" id="f_picture_file" size="20" maxlength="100"
								onchange="pass(this)" />
							<label id="f_picture_ele">
								*
							</label>
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
