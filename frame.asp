<%
If(Len(Session("IdUser")) = 0) Then
	Session("Msg") = "Veuillez vous identifier"
	Response.redirect "Connexion.asp"
End If

%>
<HTML>
	<HEAD>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="Agence de voyage Settat : Séjours à petits prix -NicVoyages-">
		<meta name="viewport" content="width = device-width , initial-scale = 1">
		<link rel="icon" href="logo.png" >
        <title>NicVoyages : agence de voyage</title>
	
		<FRAMESET Cols="200,*">

			<frame name="Menu" src="menu.asp" frameborder="0" noresize></frame>
			<frame name="Data" src="informationclient.asp?IdStatus=1" frameborder="0" noresize></frame>
		</FRAMESET>
</HEAD>
	<BODY >

	</BODY >
</HTML>