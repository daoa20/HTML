<html>
	<head>
		<title>Music Blog</title>
		<!--#include file = adovbs.inc-->
	</head>
	<body bgcolor="#CCFFFF">
		<h1 style="text-align: center;">Adding Playlist</h1>
		<p></p>
		<div>
			<%
			set conn1 = server.createobject("adodb.connection")
			conn1.open "provider = microsoft.ace.oledb.12.0;data source = C:\Inetpub\wwwroot\Daniel\Portfolio\PRoject.accdb"
			set rs1 = server.createobject("ADODB.Recordset")
			
			rs1.open "SELECT * FROM Playlists", conn1, adopendynamic, adlockoptimistic, adcmdtext
			
			rs1.addnew
			
			a = request.form("pid")
			b = replace(a, " ", "") 
			rs1("pid") = b
			
			a = request.form("pname")
			rs1("pname") = a & " " 
			
			a = request.form("pdesc")
			rs1("pdesc") = a & " "
			
			a = request.form("pic")
			rs1("pic") = a & " "
			
			rs1.update
			rs1.close
			set rs1 = nothing
			conn1.close
			response.redirect "ps.asp"
			
			%>
		</div>
	</body>
</html>