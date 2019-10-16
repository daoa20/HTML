<!DOCTYPE html>
<html lang="en">
<head>
	<title>Music Blog</title>
	<meta charset="UTF-8">
	<meta name="description" content="Music Blog">
	<meta name="keywords" content="portfolio, riddle, onepage, creative, html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Favicon -->   
	<link href="img/favicon.ico" rel="shortcut icon"/>

	<!-- Google Fonts -->
	<link href="https://fonts.googleapis.com/css?family=Josefin+Sans:400,400i,600,600i,700" rel="stylesheet">

	<!-- Stylesheets -->
	<link rel="stylesheet" href="css/bootstrap.min.css"/>
	<link rel="stylesheet" href="css/font-awesome.min.css"/>
	<link rel="stylesheet" href="css/style.css"/>
	
	<!--#include file = adovbs.inc-->


	<!--[if lt IE 9]>
	  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
	<style>
	#songs {
	  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	  border-collapse: collapse;
	  width: 100%;
	}

	#songs td, #customers th {
	  border: 1px solid #ddd;
	  padding: 8px;
	}

	#songs tr:nth-child(even){background-color: #f2f2f2;}

	#songs tr:hover {background-color: #ddd;}

	#songs th {
	  padding-top: 12px;
	  padding-bottom: 12px;
	  text-align: left;
	  background-color: #000;
	  color: white;
	}
	</style>

</head>
<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	
	<!-- header section start -->
	<header class="header-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-3">
					<div class="logo">
						<h2 class="site-logo">Music</h2>
					</div>
				</div>
				<div class="col-lg-8 col-md-9">
					<a href="loged.asp" class="site-btn header-btn">Manage page</a>
					<nav class="main-menu">
						<ul>
							<li><a href="home.html">Home</a></li>
							<li><a href="about.asp">About</a></li>
							<li><a href="playlists.html">Playlists</a></li>
							<li><a href="contact.html">Contact</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
		<div class="nav-switch">
			<i class="fa fa-bars"></i>
		</div>
	</header>
	<!-- header section end -->

	<%
		set conn1 = server.createobject("adodb.connection")
		conn1.open "provider = microsoft.ace.oledb.12.0;data source = C:\Inetpub\wwwroot\Daniel\Portfolio\Project.accdb"	
		set rs1 = server.createobject("ADODB.Recordset")
		rs1.open "select * from Albums", conn1
		a = "<table id=songs border = 1><tr><th>ID<th>name<th>description<th>bandid<th>artistid<th>pic<th>length<th>released<th>action</tr>"
	%>
	
	<!-- intro section start -->
	<section class="intro-section">
		<div class="container text-center">
			<div class="row">
				<div class="col-xl-10 offset-xl-1">
					<h2 class="section-title">Admin <span>Console</span>.</h2>
				</div>
			</div>
		</div>
	</section>
	<!-- intro section end -->
	<!-- page section start -->
	<section class="page-section">
		<div class="container">
			<div class="row">
				<div class="col-xl-10">
					<p>This is the admin page. Hello Admin :)</p>
					<a href="loged.asp" class="site-btn">Tables</a>
					<a href="addal.html" class="site-btn">Add Album</a>
					<a href="modifyal.html" class="site-btn">Modify Album</a>
					<br>
					<br>
					
					<%
						response.write a
						rs1.movefirst
						while not rs1.eof
						a = "<tr><td>" & rs1("aid") & "<td>" & rs1("aname") & "<td>" & rs1("adescription") & "<td>" & rs1("bandid") & "<td>" & rs1("artistid") & "<td>" & rs1("pic") & "<td>" & rs1("length") & "<td>" & rs1("released") & "<td><a href='deleteal.asp?album=" & rs1("aid") & "' class='site-btn'>Delete Album</a>" & "</tr>"
						response.write a
						rs1.movenext
						wend
						response.write "</table>"
						rs1.close
						conn1.close
						set rs1 = nothing
					%>
					
				</div>
			</div>
		</div>
	</section>
	<!-- page section end -->

	<!-- footer section start -->
	<footer class="footer-section text-center">
		<div class="container">
			<h2 class="section-title mb-5">Enjoy my Music!</h2>
			<div class="copyright">
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | I always wanted to put this in a webpage :D
</div>
		</div>
	</footer>
	<!-- footer section end -->


	<!--====== Javascripts & Jquery ======-->
	<script src="js/jquery-2.1.4.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/mixitup.min.js"></script>
	<script src="js/magnific-popup.min.js"></script>
	<script src="js/main.js"></script>
</body>
</html>