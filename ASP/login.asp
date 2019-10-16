<!DOCTYPE html>
<html lang="en">
<head>
	<title>Loggin in</title>
	<!--#include file = adovbs.inc-->

</head>
<body>
	<%
	
	set conn1 = server.createobject("adodb.connection")
	conn1.open "provider = microsoft.ace.oledb.12.0;data source = C:\Inetpub\wwwroot\Daniel\Portfolio\Project.accdb"
	set rs1 = server.createobject("ADODB.Recordset")
	rs1.open "SELECT username, password FROM Users", conn1
	
	rs1.movefirst
	while not rs1.eof
	
	a = request.form("username")
	b = request.form("psw")
	if a=rs1("username") AND b=rs1("password") Then
	rs1.close
	set res1 = nothing
	conn1.close
	response.redirect "loged.asp"
	Else
	response.redirect "wrong.html"
	END IF
	
	wend
	rs1.close
	set res1 = nothing
	conn1.close
	response.redirect "loged.asp"
	
	%>
	<!--====== Javascripts & Jquery ======-->
	<script src="js/jquery-2.1.4.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/mixitup.min.js"></script>
	<script src="js/magnific-popup.min.js"></script>
	<script src="js/main.js"></script>
</body>
</html>