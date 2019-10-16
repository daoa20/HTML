<html>
	<head>
		<title>Deleting Song</title>
		<!--#include file = adovbs.inc-->
	</head>
	<body>
			<%
			a = Request.QueryString("b")
			set conn1 = server.createobject("adodb.connection")
			conn1.open "provider = microsoft.ace.oledb.12.0;data source = C:\Inetpub\wwwroot\Daniel\Portfolio\Project.accdb"
			set rs1 = server.createobject("ADODB.Recordset")
			rs1.open "DELETE FROM Bands WHERE bid=" + a + " ", conn1
			set rs1 = nothing
			conn1.close
			response.redirect "b.asp"
			
			%>
		</div>
	</body>
</html>