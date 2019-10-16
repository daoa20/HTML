<html>
	<head>
		<!--#include file = adovbs.inc-->
	</head>
	<body>
		<%
			set conn1 = server.createobject("adodb.connection")
			conn1.open "provider = microsoft.ace.oledb.12.0;data source = C:\Inetpub\wwwroot\Daniel\Portfolio\Project.accdb"
			set rs1 = server.createobject("ADODB.Recordset")
			a = request.form("pid")
			rs1.open "SELECT * FROM Playlists WHERE pid = " + a + " ", conn1, adopendynamic, adlockoptimistic, adcmdtext
			
			a = request.form("pname")
			rs1("pname") = a & ""
			a = request.form("pdesc")
			rs1("pdesc") = a & ""
			a = request.form("pic")
			rs1("pic") = a & " "
			rs1.update
			
			rs1.close
			set rs1 = nothing
			conn1.close
			set conn1 = nothing
			response.redirect "ps.asp"
			%>
	</body>
</html>