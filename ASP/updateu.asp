<html>
	<head>
		<!--#include file = adovbs.inc-->
	</head>
	<body>
		<%
			set conn1 = server.createobject("adodb.connection")
			conn1.open "provider = microsoft.ace.oledb.12.0;data source = C:\Inetpub\wwwroot\Daniel\Portfolio\Project.accdb"
			set rs1 = server.createobject("ADODB.Recordset")
			a = request.form("id")
			rs1.open "SELECT * FROM Users WHERE id = " + a + " ", conn1, adopendynamic, adlockoptimistic, adcmdtext
			
			a = request.form("username")
			rs1("username") = a & ""
			a = request.form("password")
			rs1("password") = a & ""
			a = request.form("pic")
			rs1("pic") = a & " "
			rs1.update
			
			rs1.close
			set rs1 = nothing
			conn1.close
			set conn1 = nothing
			response.redirect "u.asp"
			%>
	</body>
</html>