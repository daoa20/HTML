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
			
			rs1.open "SELECT * FROM Albums", conn1, adopendynamic, adlockoptimistic, adcmdtext
			
			rs1.addnew
			
			a = request.form("aid")
			b = replace(a, " ", "") 
			rs1("aid") = b
			
			a = request.form("aname")
			rs1("aname") = a & " " 
			
			a = request.form("desc")
			rs1("adescription") = a & " "
			
			a = request.form("artistid")
			rs1("artistid") = a
			
			a = request.form("bandid")
			rs1("bandid") = a
			
			a = request.form("pic")
			rs1("pic") = a & " "
			
			a = request.form("length")
			rs1("length") = a & " "
			
			a = request.form("released")
			rs1("released") = a
			
			rs1.update
			rs1.close
			set rs1 = nothing
			conn1.close
			response.redirect "albums.asp"
			
			%>
		</div>
	</body>
</html>