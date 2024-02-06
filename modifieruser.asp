<%
If(Len(Session("IdUser")) = 0) Then
	Session("Msg") = "Veuillez vous identifier"
	Response.redirect "Connexion.asp"
End If

%>

<%
Dim conn, rs, sql, nom

Set conn = Server.CreateObject("ADODB.Connection")
Set rs = Server.CreateObject("ADODB.Recordset")

conn.Open Application("PC")



NomClient=request("NomClient")
PrenomClient=request("PrenomClient")
Tel=request("Tel")
Email=request("Email")
Adresse=request("Adresse")
IdVille=request("ville")
Cin=request("CIN")



sql = "Modifier_client '" & NomClient & "','" & PrenomClient & "','" & Tel & "','" & Email & "','" & Adresse & "','" & IdVille & "','" & Cin & "','" & Session("IdUser") & "'"

rs.Open sql, conn, 3,3
Response.redirect "modifierClient.asp"
%>