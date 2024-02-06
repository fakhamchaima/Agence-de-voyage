<%

liste = Request.Form("CBMsg")

Dim conn, rs ,req

Set conn = Server.CreateObject("ADODB.Connection")

Set rs = Server.CreateObject("ADODB.Recordset")

conn.Open Application("PC")

req=" UPDATE T_Reservations set  Anuuler=0 where Iddres IN (" & liste & ")"


If(Len(req) >  0) Then
	conn.execute req
End If


conn.close()
Set conn = Nothing


Response.Redirect "Reservation_Confirmer.asp"

%>



<html>
	<body>
		<input type="text"  value="<%=Request.Form("CBMsg")%>" style="color: black;" > 
	</body>
</html>