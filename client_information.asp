<%
If(Len(Session("Login")) = 0) Then
	Session("Msg") = "Veuillez vous identifier"
	Response.redirect "ConnexionA.asp"
End If

%>


<%
Dim  rs, sql,Cin

Set cx = Server.CreateObject("ADODB.Connection")

	ON ERROR RESUME NEXT 'si il y aun errur n envoyer pas un erreur   continuer'

	cx.Open Application("PC")
	
	req = "Affiche_Tous_client "
	
	Set Rs = Server.CreateObject("ADODB.RecordSet")
	rs.Open req, cx, 3,3



%>
<HTML>
	<HEAD>
		<TITLE>Espace des clients</TITLE>
		<link rel="stylesheet" href="styleAdmin.css" />
	</HEAD>
	<BODY >
		<h1 id="titre" style="width : 200px ;">Les clients</h1>
			<form  class="fSup" method="post" action ="Supprimer.asp" >
				<h2  id="PTitre">Supprimer un Client</h2>
				<h4 class="input">CIN de client</h4><input type="text" class="input" placeholder="cin" id="cin" name="cin"><br>
				<h5 style="color: red;">  La suppression fait pour le client qui n'a pas une réservation </h3>
				<input type="submit" class="btn" id="tt"  value="Supprimer" >
			</form>

 <section>
<table border="1" align="center">
		<tr style="height: 50px; text-align :center;">
	
		<th align="center" valign="center" width="100">Nom</th>
		<th align="center" valign="center" width="100">prenom</th>
		<th align="center" valign="center" width="100">tel</th>
        <th align="center" valign="center" width="100">email</th>
        <th align="center" valign="center" width="100">Cin</th>
		<th align="center" valign="center" width="100">Adresse</th>
	
	
	</tr>

	<%
				
				' UBound : dernier indice dans tableaux
				' Rs.EOF : la fin du curseur
				WHILE NOT Rs.EOF%> 
					<tr  style="height: 40px; text-align :center;">
	
			<td><%=rs("NomCl")%></td>
			<td><%=rs("PrenomCl")%></td>
			<td><%=rs("Tel")%></td>
			<td><%=rs("Email")%></td>
            <td><%=rs("Cin")%></td>
			<td><%=rs("Adresse")%></td>
	
		
         </tr>
					<%
					
					Rs.movenext
				WEND
				%>
			</table>

 </section>
	


	</BODY>
</HTML>
<%
rs.close()
Set rs = nothing
cx.close()
Set cx = Nothing
%>