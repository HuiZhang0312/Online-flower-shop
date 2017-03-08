<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	List<Map<String, String>> flist = (List) request
			.getAttribute("flist");
	List<Map<String, String>> blist = (List) request
			.getAttribute("blist");
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
			<li class="selected"><a href="HomePageServlet">home</a></li>
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
					<a href="CustomerTransactionServlet">rate</a>
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
		<div class="featured">
			<div>
				<ul>
					<li><a href="index.html"><img src="images/backyard.jpg" alt="" /></a></li>
					<li><a href="index.html"><img src="images/garden.jpg" alt="" /></a></li>		
				</ul>		
				<div class="section">
					<div>
						<a href="index.html"><img src="images/bridal-bouquet.jpg" alt="" /></a>
						<h2>latest work</h2>	
					</div>	
				</div>
			</div>
		</div>
		<div class="content">
			<span class="heading"><img src="images/special-occasions-flowers.gif" alt="" /></span>
			<div>
				<div>
					<ul>
					<%
						for (int i = 0; i < flist.size(); i++) {
					%>
						<li>
							<a href="ShowFlowerDetailServlet?f_id=<%=flist.get(i).get("f_id")%>">
							<img src="<%=flist.get(i).get("f_picture")%>" alt="<%=flist.get(i).get("f_name")%>" 
								 height="140px" width="140px"/>
							<span><%=flist.get(i).get("f_name")%></span>
							</a>
						</li>
					<%
						}
					%>	
					</ul>
					<h4><a href="flowers.html">view all flowers</a></h4>
					<ul>
					<%
						for (int j = 0; j < blist.size(); j++) {
					%>
						<li>
							<a href="flowers.html">
							<img src="<%=blist.get(j).get("b_picture")%>" alt="<%=blist.get(j).get("b_name")%>" />
							<span><%=blist.get(j).get("b_name")%></span>
							</a>
						</li>
					<%
						}
					%>					
					</ul>
					<h4><a href="flowers.html">view all bouquets</a></h4>
				</div>
				<ul>
					<li>
						<h3>This website template has been designed by <a href="http://www.freewebsitetemplates.com/">Free Website Templates</a> for you, for free.</h3>
						<p>You can replace all this text with your own text. You can remove any link to our website from this website template, you're free to use this website template without linking back to us. If you're having problems editing this website template, then don't hesitate to ask for help on the <a href="http://www.freewebsitetemplates.com/forum">Forum</a>.</p>
					</li>		
					<li>
						<h3>Looking for more templates?</h3>
						<p>Just browse through all our <a href="http://www.freewebsitetemplates.com/">Free Website Templates</a> and find what you鈥檙e looking for. But if you don鈥檛 find any website template you can use, you can try our <a href="http://www.freewebsitetemplates.com/freewebdesign/">Free Web Design</a> service and tell us all about it. Maybe you鈥檙e looking for something different, something special. And we love the challenge of doing something different and something special.</p>
					</li>	
					<li>
						<h3>We Have Free Templates for Everyone</h3>
						<p>Our website templates are created with inspiration, checked for quality and originality and meticulously sliced and coded. What鈥檚 more, they鈥檙e absolutely free! You can do a lot with them. You can modify them. You can use them to design websites for clients, so long as you agree with the <a href="http://www.freewebsitetemplates.com/about/termsofuse/">Terms of Use</a>. You can even remove all our links if you want to.</p>
					</li>		
				</ul>
			</div>
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
