<%
If(Len(Session("IdUser")) = 0) Then
	Session("Msg") = "Veuillez vous identifier"
	Response.redirect "Connexion.asp"
End If

%>


<%
Dim  rs, sql,Cin

Set cx = Server.CreateObject("ADODB.Connection")

	ON ERROR RESUME NEXT 'si il y aun errur n envoyer pas un erreur   continuer'

	cx.Open Application("PC")
	
	req = "Affiche_par_IdCl '" & Session("IdUser") & "'"
	
	Set Rs = Server.CreateObject("ADODB.RecordSet")
	rs.Open req, cx, 3,3
if(IdStatus=1 ) Then

End If


%>
<HTML>
	<HEAD>
		<TITLE>Espace des clients</TITLE>
	<link rel="stylesheet" href="styleAdmin.css" />
	</HEAD>
	<BODY >
		
  	<h1 id="titre" style="width : 250px ;"> Vos informations </h1>

<table border="1" align="center">
<tr style="height: 50px;">
	
		<th align="center" valign="center" width="100">Nom</th>
		<th align="center" valign="center" width="100">prenom</th>
		<th align="center" valign="center" width="100">tel</th>
		<th align="center" valign="center" width="100">email</th>
		<th align="center" valign="center" width="100">Adresse</th>
		<th align="center" valign="center" width="100">Ville</th>
		<th align="center" valign="center" width="100">Cin</th>
	</tr>

	<%
				
				' UBound : dernier indice dans tableaux
				' Rs.EOF : la fin du curseur
				WHILE NOT Rs.EOF%> 
							<tr style="height: 40px; text-align :center;">
	
			<td><%=rs("NomCl")%></td>
			<td><%=rs("PrenomCl")%></td>
			<td><%=rs("Tel")%></td>
			<td><%=rs("Email")%></td>
			<td><%=rs("Adresse")%></td>
			<td><%=rs("NomVille")%></td>
			<td><%=rs("Cin")%></td>
         </tr>
					<%
					
					Rs.movenext
				WEND
				%>
			</table>


	
	</BODY>
</HTML>
<%
rs.close()
Set rs = nothing
cx.close()
Set cx = Nothing
%>