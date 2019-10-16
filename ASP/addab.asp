<html>
	<head>
		<title>Music Blog</title>
		<!--#include file = adovbs.inc-->
	</head>
	<body bgcolor="#CCFFFF">
		<h1 style="text-align: center;">Adding Record</h1>
		<p></p>
		<div>
			<%
			set conn1 = server.createobject("adodb.connection")
			conn1.open "provider = microsoft.ace.oledb.12.0;data source = C:\Inetpub\wwwroot\Daniel\Portfolio\PRoject.accdb"
			set rs1 = server.createobject("ADODB.Recordset")
			
			rs1.open "SELECT * FROM ArtistBand", conn1, adopendynamic, adlockoptimistic, adcmdtext
			
			rs1.addnew
			
			a = request.form("id")
			b = replace(a, " ", "") 
			rs1("id") = b
			
			a = request.form("artistid")
			rs1("artistid") = a
			
			a = request.form("bandid")
			rs1("bandid") = a
			
			rs1.update
			rs1.close
			set rs1 = nothing
			conn1.close
			response.redirect "ab.asp"
			
			%>
		</div>
	</body>
</html>