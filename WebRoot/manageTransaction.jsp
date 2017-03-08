<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@ page import="flower.dbTools.*" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	Paging paging = (Paging) request.getAttribute("paging");

	int nowpage = paging.getNowpage();
	int pages = paging.getPages();
	int rows = paging.getRows();
	List<Map<String, String>> list = paging.getList();
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
				<li class="selected"><a href="SearchTransactionServlet">manage transaction</a></li>
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
			<h1>manage</h1>		
			<table align="center">
			<thead>
				<td colspan="7" align="center">
					<b><font size="6">Transaction</font></b>
				</td>
			</thead>
        <tr>
          <td width="100px" align="center"><b>id</b></td>
          <td width="100px" align="center"><b>customer id</b></td>
          <td width="100px" align="center"><b>date</b></td>
          <td width="100px" align="center"><b>status</b></td>
          <td width="100px" align="center"><b>quantity</b></td>
          <td width="100px" align="center"><b>payment method</b></td>
          <td width="100px" align="center"><b>store</b></td>
          <td width="100px" align="center"><b>operation</b></td>
        </tr>
        <%
        	for (int i = 0; i < list.size(); i++) {
        		Map<String, String> onerow = list.get(i);
        		if(list.size()>0){
        %>
        <tr>
          <td width="100px" align="center"><%=onerow.get("t_id")%></td>
          <td width="100px" align="center"><%=onerow.get("c_id")%></td>
          <td width="100px" align="center"><%=onerow.get("t_date")%></td>
          <td width="100px" align="center"><%=onerow.get("t_status")%></td>
          <td width="100px" align="center"><%=onerow.get("t_quantity")%></td>
          <td width="100px" align="center"><%=onerow.get("t_payment_method")%></td>
          <td width="100px" align="center"><%=onerow.get("s_id")%></td>
          <td width="100px" align="center">
          	<form action="ShowSingleTransactionServlet?t_id=<%= onerow.get("t_id") %>" method="post">
          		<input type="submit" value="update" class="button" />
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
							<a href="SearchTransactionServlet?nowpage=1">First</a>
							<%
								if (nowpage != 1) {
							%>
							<a href="SearchTransactionServlet?nowpage=<%=nowpage - 1%>">Previous</a>
							<%
								}
							%>
							<%
								if (nowpage != pages) {
							%>
							<a href="SearchTransactionServlet?nowpage=<%=nowpage + 1%>">Next</a>
							<%
								}
							%>
							<a href="SearchTransactionServlet?nowpage=<%=pages%>">Last</a>
						</td>
					</tr>
				</table>
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
