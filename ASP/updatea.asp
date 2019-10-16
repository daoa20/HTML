<html>
	<head>
		<!--#include file = adovbs.inc-->
	</head>
	<body>
		<%
			set conn1 = server.createobject("adodb.connection")
			conn1.open "provider = microsoft.ace.oledb.12.0;data source = C:\Inetpub\wwwroot\Daniel\Portfolio\Project.accdb"
			set rs1 = server.createobject("ADODB.Recordset")
			a = request.form("artid")
			rs1.open "SELECT * FROM Artists WHERE artid = " + a + " ", conn1, adopendynamic, adlockoptimistic, adcmdtext
			
			a = request.form("artname")
			rs1("artname") = a & ""
			a = request.form("desc")
			rs1("description") = a & ""
			a = request.form("age")
			rs1("age") = a
			a = request.form("nationality")
			rs1("nationality") = a & ""
			rs1.update
			
			rs1.close
			set rs1 = nothing
			conn1.close
			set conn1 = nothing
			response.redirect "artists.asp"
			%>
	</body>
</html>