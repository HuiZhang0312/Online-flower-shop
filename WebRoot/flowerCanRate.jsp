<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="flower.dbTools.*"  %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	Paging paging = (Paging)request.getAttribute("paging");
	Paging fpaging = (Paging)request.getAttribute("fpaging");
	int nowpage = paging.getNowpage();
	int pages = paging.getPages();
	int rows = paging.getRows();
	List<Map<String, String>> list = paging.getList();
	List<Map<String, String>> flist = fpaging.getList();
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
		<link rel="stylesheet" type="text/css" href="css/style.css"
			media="all" />
	</head>
	<style type="text/css">
<!--
* {
	margin: 0;
	padding: 0;
}

a {
	color: #b7b1a1;
	text-decoration: none;
}

a:hover {
	color: #1E7ACE;
}

input,select,textarea {
	padding: 1px;
	margin: 2px;
	font-size: 11px;
}

input.button {
	display: inline-block;
	outline: none;
	cursor: pointer;
	text-align: center;
	font: 14px/ 100% Arial, Helvetica, sans-serif;
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
	width: 450px;
	margin: 15px auto;
	padding: 20px;
	text-align: center;
	border: 1px #1E7ACE solid;
}

fieldset {
	padding: 10px;
	margin-top: 5px;
	border: 1px solid #1E7ACE;
	background: #fff;
}

fieldset label {
	float: left;
	width: 120px;
	text-align: right;
	padding: 4px;
	margin: 1px;
}

fieldset div {
	clear: left;
	margin-bottom: 2px;
}

.enter {
	text-align: center;
}

.clear {
	clear: both;
}

select {
	width: 145px;
}
-->
</style>
	<body>
		<div id="header">
			<ul>
				<li>
					<a href="HomePageServlet">home</a>
				</li>
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
				<li class="selected">
					<a href="search.jsp">search</a>
				</li>
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
				<a href="index.html"><img src="images/logo.gif" alt="" />
				</a>
			</div>
		</div>
		<div id="body">
			<div class="about">
				<h1>flower rating</h1>
				
					<fieldset>
						<p><strong>
							Feel free to rate.
						</strong></p>
						<div class="enter">
						<table>
						<tr>
          <td width="100px" align="center"><b>Reservation number</b></td>
          <td width="100px" align="center"><b>Flower name</b></td>
          <td width="100px" align="center"><b>Point</b></td>
          <td width="400px" align="center"><b>Review</b></td>
          <td width="100px" align="center"><b>operation</b></td>
        </tr>
        <%
        	for (int i = 0; i < list.size(); i++) {
        		Map<String, String> onerow = list.get(i);
        		Map<String, String> fonerow = flist.get(i);
        		if(list.size()>0){
        %>
        <tr>
          <td width="100px" align="center"><%=onerow.get("t_id")%></td>
          <td width="100px" align="center"><%=fonerow.get("f_name")%></td>
          <td width="100px" align="center">
			<select id="point" name="point">
				<option value="" selected></option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
			</select>
		  </td>
		  <td width="100px" align="center">
		  	<textarea ></textarea>
		  </td>
          <td width="100px" align="center">	
          <form action="RateFlowerServlet?f_id=<%= fonerow.get("f_id")%>" method="post">
          		<input type="submit" value="rate" class="button" />  
          </form>   
          </td>
        </tr>
        <% }else{
  		%>
    	 <tr height="30px">
      	 	<td></td>
      	 	<td></td>
    	 </tr>
  		<%}}%>
					<tr>
						<td colspan="7" align="center">
							<%=rows%>record(s) in total;Current page<%=nowpage%>/<%=pages%>
							<a href="CustomerTransactionServlet?nowpage=1">First</a>
							<%
								if (nowpage != 1) {
							%>
							<a href="CustomerTransactionServlet?nowpage=<%=nowpage - 1%>">Previous</a>
							<%
								}
							%>
							<%
								if (nowpage != pages) {
							%>
							<a href="CustomerTransactionServlet?nowpage=<%=nowpage + 1%>">Next</a>
							<%
								}
							%>
							<a href="CustomerTransactionServlet?nowpage=<%=pages%>">Last</a>
						</td>
					</tr>
					</table>
						</div>
					</fieldset>
				
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
