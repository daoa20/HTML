<html>
	<head>
		<title>Deleting Song</title>
		<!--#include file = adovbs.inc-->
	</head>
	<body>
			<%
			b = Request.QueryString("artist")
			set conn1 = server.createobject("adodb.connection")
			conn1.open "provider = microsoft.ace.oledb.12.0;data source = C:\Inetpub\wwwroot\Daniel\Portfolio\Project.accdb"
			set rs1 = server.createobject("ADODB.Recordset")
			rs1.open "DELETE FROM Artists WHERE artid=" + b + " ", conn1
			set rs1 = nothing
			conn1.close
			response.redirect "artists.asp"
			
			%>
		</div>
	</body>
</html>