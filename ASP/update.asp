<html>
	<head>
		<!--#include file = adovbs.inc-->
	</head>
	<body>
		<%
			set conn1 = server.createobject("adodb.connection")
			conn1.open "provider = microsoft.ace.oledb.12.0;data source = C:\Inetpub\wwwroot\Daniel\Portfolio\Project.accdb"
			set rs1 = server.createobject("ADODB.Recordset")
			a = request.form("ids")
			rs1.open "SELECT * FROM Songs WHERE id = " + a + " ", conn1, adopendynamic, adlockoptimistic, adcmdtext
			
			a = request.form("name")
			rs1("name") = a & ""
			a = request.form("desc")
			rs1("description") = a & ""
			a = request.form("albumid")
			rs1("albumid") = a
			rs1.update
			
			rs1.close
			set rs1 = nothing
			conn1.close
			set conn1 = nothing
			response.redirect "songs.asp"
			%>
	</body>
</html>