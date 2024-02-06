<%
If(Len(Session("Login")) = 0) Then
	Session("Msg") = "Veuillez vous identifier"
	Response.redirect "ConnexionA.asp"
End If

%>

<%
Dim  rs, sql,Cin,cx
cin = Request("cin")
Set cx = Server.CreateObject("ADODB.Connection")

	ON ERROR RESUME NEXT 'si il y aun errur n envoyer pas un erreur   continuer'

	cx.Open Application("PC")
	
	req = "supprimer_Client '" & cin & "'"

	Set Rs = Server.CreateObject("ADODB.RecordSet")
	rs.Open req, cx, 3,3

Response.redirect "client_information.asp" 

%>

