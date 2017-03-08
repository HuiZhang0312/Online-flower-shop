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
	<script type="text/javascript">
		function loadDetail(){
			document.getElementById("t_id").innerHTML = '<%=list.get(0).get("t_id")%>';
			document.getElementById("c_id").innerHTML = '<%=list.get(0).get("c_id")%>';
			document.getElementById("t_date").innerHTML = '<%=list.get(0).get("t_date")%>';
		
			document.getElementById("t_payment_method").value= '<%=list.get(0).get("t_payment_method")%>';
			document.getElementById("s_id").innerHTML = '<%=list.get(0).get("s_id")%>';
			document.getElementById("t_status").value = '<%=list.get(0).get("t_status")%>';
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
.select{
	width:140px;
}

-->
</style>
  <body onload="loadDetail()">
    <div id="header">
		<ul>
			<li><a href="index.html">home</a></li>
			<li><a href="flowers.html">our flowers</a></li>
			<li><a href="handling.html">handling &amp; delivery</a></li>
			<li><a href="payment.html">payment &amp; ordering</a></li>
			<li><a href="about.html">about</a></li>
			<li><a href="blog.html">blog</a></li>
			<li><a href="contact.html">contact us</a></li>			
		</ul>
		<div class="logo">
			<a href="index.html"><img src="images/logo.gif" alt="" /></a>
		</div>
	</div>
	<div id="body">
		<div class="about">
			<h1>update transaction</h1>		
			<form action="UpdateTransactionServlet?t_id=<%= list.get(0).get("t_id") %>" method="post"
					onsubmit=" return check_form()">
					<fieldset>
						
						<p><strong>
							Please update the information of transaction.
						</strong></p>
						<div>
							<label for="t_id">
								Transaction id
							</label>
							<label id="t_id"></label>
							<br />
						</div>
						<div>
							<label for="c_id">
								Customer id
							</label>
							<label id="c_id"></label>
							
							<br />
						</div>
						<div>
							<label for="t_date">
								Date
							</label>
							<label id="t_date"></label>
							<br />
						</div>
						<div>
							<label for="t_status">
								Status
							</label>
							
							<select  class="select" id="t_status" name="t_status">
								<option value="" selected></option>
								<option value="pending">pending</option>
								<option value="completed">completed</option>
							</select>
							
							<br />
						</div>
						<div>
							<label for="t_quantity">
								Quantity
							</label>
							<input type="text" name="t_quantity" id="t_quantity" size="20" value="<%= list.get(0).get("t_quantity") %>"
								maxlength="15" onblur="validate()" />
							
							<br />

						</div>
						<div>
							<label for="t_payment_method">
								Payment method
							</label>
							<select  class="select" id="t_payment_method" name="t_payment_method">
								<option value="" selected></option>
								<option value="Cash">Cash</option>
								<option value="Card">Card</option>
							</select>
							<br />
						</div>
						<div>
							<label for="s_id">
								Store
							</label>
							<label id="s_id"></label>
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
