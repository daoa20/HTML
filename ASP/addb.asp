<html>
	<head>
		<title>Music Blog</title>
		<!--#include file = adovbs.inc-->
	</head>
	<body bgcolor="#CCFFFF">
		<h1 style="text-align: center;">Adding Album</h1>
		<p></p>
		<div>
			<%
			set conn1 = server.createobject("adodb.connection")
			conn1.open "provider = microsoft.ace.oledb.12.0;data source = C:\Inetpub\wwwroot\Daniel\Portfolio\PRoject.accdb"
			set rs1 = server.createobject("ADODB.Recordset")
			
			rs1.open "SELECT * FROM Bands", conn1, adopendynamic, adlockoptimistic, adcmdtext
			
			rs1.addnew
			
			a = request.form("bid")
			b = replace(a, " ", "") 
			rs1("bid") = b
			
			a = request.form("bname")
			rs1("bname") = a & " " 
			
			a = request.form("genreid")
			rs1("genreid") = a
			
			rs1.update
			rs1.close
			set rs1 = nothing
			conn1.close
			response.redirect "b.asp"
			
			%>
		</div>
	</body>
</html>