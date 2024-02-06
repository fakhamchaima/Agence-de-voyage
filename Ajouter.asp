<%
	
Dim conn, rs, sql, id

Set conn = Server.CreateObject("ADODB.Connection")
conn.Open Application("PC")

Set rs = Server.CreateObject("ADODB.Recordset")


NomClient=request("NomClient")
PrenomClient=request("PrenomClient")
Tel=request("Tel")
Email=request("Email")
Adresse=request("Adresse")
IdVille=request("ville")
Cin=request("CIN")
password=request("password")


sql= "Ajouter_Client '" & NomClient & "','" & PrenomClient & "','" & Tel & "','" & Email & "','" & Adresse & "','" & IdVille & "','" & Cin & "','" & password & "'"      
    
rs.Open sql, conn, 3,3


Response.redirect "Connexion.asp"
%>