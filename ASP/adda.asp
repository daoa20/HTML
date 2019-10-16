<html>
	<head>
		<title>Music Blog</title>
		<!--#include file = adovbs.inc-->
	</head>
	<body bgcolor="#CCFFFF">
		<h1 style="text-align: center;">Adding Artist</h1>
		<p></p>
		<div>
			<%
			set conn1 = server.createobject("adodb.connection")
			conn1.open "provider = microsoft.ace.oledb.12.0;data source = C:\Inetpub\wwwroot\Daniel\Portfolio\PRoject.accdb"
			set rs1 = server.createobject("ADODB.Recordset")
			rs1.open "SELECT * FROM Artists", conn1, adopendynamic, adlockoptimistic, adcmdtext
			rs1.addnew
			
			a = request.form("artid")
			b = replace(a, " ", "")
			rs1("artid") = b
			
			a = request.form("artname")
			rs1("artname") = a & " " 
			
			a = request.form("desc")
			rs1("description") = a & " "
			
			a = request.form("age")
			rs1("age") = a
			
			a= request.form("nationality")
			rs1("nationality") = a
			
			rs1.update
			rs1.close
			set rs1 = nothing
			conn1.close
			response.redirect "artists.asp"
			
			%>
		</div>
	</body>
</html>