<html>
	<head>
		<title>Music Blog</title>
		<!--#include file = adovbs.inc-->
	</head>
	<body bgcolor="#CCFFFF">
		<h1 style="text-align: center;">Adding Song</h1>
		<p></p>
		<div style="padding: 0% 42% 0%;">
			<%
			'-- connect to test.accdb database --
			
			set conn1 = server.createobject("adodb.connection")
			
			conn1.open "provider = microsoft.ace.oledb.12.0;data source = C:\Inetpub\wwwroot\Daniel\Portfolio\PRoject.accdb"
			
			'-- get Students recordset --
			set rs1 = server.createobject("ADODB.Recordset")
			
			rs1.open "SELECT * FROM Songs", conn1, adopendynamic, adlockoptimistic, adcmdtext
			
			rs1.addnew
			
			a = request.form("ids")
			b = replace(a, " ", "") 'remove any spaces in student number
			rs1("id") = b
			
			a = request.form("name")
			rs1("name") = a & " " 'Access does not like empty strings in text fields
			
			a = request.form("desc")
			rs1("description") = a & " "
			
			a = request.form("albumid")
			rs1("albumid") = a & " "
			
			rs1.update
			rs1.close
			set rs1 = nothing
			conn1.close
			response.redirect "songs.asp"
			
			%>
		</div>
	</body>
</html>