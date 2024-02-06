<%
	dim login , passwd

	login  = Request("email")
	passwd = Request("password")

	Set cx = Server.CreateObject("ADODB.Connection")

	ON ERROR RESUME NEXT

	cx.Open Application("PC")

	If(Err.number <> 0) Then
		Response.write "DESC Erreur : " & Err.Description
		Response.end
	End If
	
	req = "connecterA '" & login & "','" & passwd & "'"
	Set Rs = Server.CreateObject("ADODB.RecordSet")
	rs.Open req, cx, 3,3

	If(rs.RecordCount = 1 ) Then
		Session("Login") = rs("Login")

		Response.redirect "page.asp"
	Else
		Session("Login") = ""
		Session("Log") = login
		Session("Pas") = passwd
		Session("Msg") = "Login et/ou mot de passe incorrect"
		Response.redirect "ConnexionA.asp"
	End If
	rs.close()
	Set rs = nothing
	cx.close()
	Set cx = Nothing
%>