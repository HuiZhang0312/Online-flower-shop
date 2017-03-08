<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	List<Map<String, String>> list = (List) request.getAttribute("list");
	List<Map<String, String>> slist = (List) request.getAttribute("slist");
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
			document.getElementById("f_name").innerHTML = '<%=list.get(0).get("f_name")%>';
			document.getElementById("f_type").innerHTML = '<%=list.get(0).get("f_type")%>';
			document.getElementById("f_quantity").innerHTML = '<%=list.get(0).get("f_quantity")%>';
			document.getElementById("f_price").innerHTML = '<%=list.get(0).get("f_price")%>';
		}
		
		function checkQuantity(){
			
			var f_quantity = document.getElementById("f_quantity").value;
			var quantity = document.getElementById("quantity").value;
			var f_quantity_ele = document.getElementById("f_quantity_ele");
			var button = document.getElementById("reserve");
			if(f_quantity < quantity){
				f_quantity_ele.innerHTML = "<font color='red'>X Out of stock</font>";
				return false;
			}else{
				button.disabled = !button.disabled;
				return true;
			}
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
select {
	width:145px;
}

-->
</style>	
	<body onload="loadDetail()">
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
			<h1>flower detail</h1>		
			<form action="ReserveFlowerServlet?f_id=<%=list.get(0).get("f_id")%>" method="post"
					onsubmit=" return check_form()">
					<fieldset>
						
						<p><strong>
							Here are flower's details.
						</strong></p>
						<div class="enter">
						<table>
							<tr>
								<td align="center">
									<img alt="<%=list.get(0).get("f_name")%>" src="<%=list.get(0).get("f_picture")%>">
								</td>
								<td width="50px"></td>
								<td align="center">
									<div>
										<label>
											Flower name:
										</label>
										<label></label>
										<label id="f_name"></label>
										<br />
									</div>
									<div>
										<label>
											Flower type:
										</label>
										<label></label>
										<label id="f_type">
											
										</label>
										<br />
									</div>
									<div>
										<label>
											In stock:
										</label>
										<label></label>
										<label id="f_quantity">
											
										</label>
										<br />
									</div>
									<div>
										<label>
											Price:
										</label>
										<label></label>
										<label id="f_price">
											
										</label>
										<br />
									</div>
									<div>
										<label>
											Quantity:
										</label>
										<label id="f_quantity_ele">
											*
										</label>
										<input type="text" name="quantity" id="quantity"
											size="20" value=""
											maxlength="15" onblur="checkQuantity()" />
										
										<br />
									</div>
									<div>
										<label>
											Pick up location:
										</label>
										<label id="pick_up_ele">
											*
										</label>
											<select class="select" id="location" name="location">
												<option value="" selected></option>
												<%
													for (int i = 0; i < slist.size(); i++) {
												%>
												<option value="<%=slist.get(i).get("s_id")%>"><%=slist.get(i).get("s_name")%></option>
												<%
													}
												%>
											</select>

											<br />
									</div>
									<div>
										<label>
											Payment method:
										</label>
										<label id="payment_ele">
											*
										</label>
											<select class="select" id="payment" name="payment">
												<option value="" selected></option>
												<option value="Card" >Card</option>
												<option value="Cash" >Cash</option>
											</select>

											<br />
									</div>
									<div>
										<label>
											Pick up date:
										</label>
										<label id="p_ele">
											*
										</label>
										<input type="date" id="date" name="date"/>
									</div>
									</td>
							</tr>
							
							<tr>
								<td>
								</td>
								<td width="50px"></td>
								<td align="center">
									<input type="submit" class="button" value="Reserve" id="reserve" disabled/>
									<input type="reset" class="button" value="Reset" />
								</td>
							</tr>
							
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
