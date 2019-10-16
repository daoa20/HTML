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
	
	<!--#include file = adovbs.inc-->

	<!-- Google Fonts -->
	<link href="https://fonts.googleapis.com/css?family=Josefin+Sans:400,400i,600,600i,700" rel="stylesheet">

	<!-- Stylesheets -->
	<link rel="stylesheet" href="css/bootstrap.min.css"/>
	<link rel="stylesheet" href="css/font-awesome.min.css"/>
	<link rel="stylesheet" href="css/style.css"/>


	<!--[if lt IE 9]>
	  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->

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
					<a href="Signin.html" class="site-btn header-btn">Admin Log in</a>
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
		playlist = Request.QueryString("playlist")
		set conn1 = server.createobject("adodb.connection")
		conn1.open "provider = microsoft.ace.oledb.12.0;data source = C:\Inetpub\wwwroot\Daniel\Portfolio\Project.accdb"	
		set rs1 = server.createobject("ADODB.Recordset")
		rs1.open "select * from PlaySongQ where pid = " + playlist + " ", conn1
		
		
		a = rs1("pname")
		b = rs1("pdesc")
		e = rs1("name")
		f = rs1("pic")
	%>

	<!-- intro section start -->
	<section class="intro-section">
		<div class="container text-center">
			<div class="row">
				<div class="col-xl-10 offset-xl-1">
					<h2 class="section-title"><% response.write a %><span> - </span><% response.write "Playlist" %></h2>
				</div>
			</div>
		</div>
	</section>
	<!-- intro section end -->


	<!-- page section start -->
	<section class="page-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<p><% response.write b %></p>
					<%
						
						a = "<ol>"
						
						response.write a
						
						rs1.movefirst
						while not rs1.eof
						
						e = "<li>" & rs1("name") & "</li>"
						response.write e
						rs1.movenext
						wend
						
						response.write "</ol>"
						
						
						
						rs1.close
						conn1.close
						set rs1 = nothing
					%>
					<div class="row mt-5">
						<div class="col-md-4">
							
						</div>
						<div class="col-md-4"></div>
					</div>
					<figure class="mt-5">
						
					</figure>
				</div>
				<div class="col-lg-5 offset-lg-1">
					<figure class="pic-frame">
						<img src=<% response.write f %> alt="">
					</figure>
					<div class="milestone">
								<h2><% response.write "a lot" %><span>Length</span></h2>
							</div>
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