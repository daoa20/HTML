<html>
	<head>
		<!--#include file = adovbs.inc-->
	</head>
	<body>
		<%
			set conn1 = server.createobject("adodb.connection")
			conn1.open "provider = microsoft.ace.oledb.12.0;data source = C:\Inetpub\wwwroot\Daniel\Portfolio\Project.accdb"
			set rs1 = server.createobject("ADODB.Recordset")
			a = request.form("bid")
			rs1.open "SELECT * FROM Bands WHERE bid = " + a + " ", conn1, adopendynamic, adlockoptimistic, adcmdtext
			
			a = request.form("bname")
			rs1("bname") = a & ""
			a = request.form("genreid")
			rs1("genreid") = a
			rs1.update
			
			rs1.close
			set rs1 = nothing
			conn1.close
			set conn1 = nothing
			response.redirect "b.asp"
			%>
	</body>
</html>