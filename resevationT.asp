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
	
	req = "T_reservation "
	
	Set Rs = Server.CreateObject("ADODB.RecordSet")
	rs.Open req, cx, 3,3



%>
<HTML>
	<HEAD>
		<TITLE>Espace des  Admin</TITLE>
		<link rel="stylesheet" href="styleAdmin.css" />
	</HEAD>
	<BODY >
		<h1 id="titre" style="width : 300px ;">Les reservations</h1>

 <section>
<table border="1" align="center">
	<tr  style="height: 50px;" >
	
		<th align="center" valign="center" width="100">Nom</th>
		<th align="center" valign="center" width="100">prenom</th>
		<th align="center" valign="center" width="100">Cin</th>
        <th align="center" valign="center" width="100">Offre</th>
        <th align="center" valign="center" width="100">Date_debut</th>
		<th align="center" valign="center" width="100">Date_fin</th>
		<th align="center" valign="center" width="100">Annuler</th>
	
	
	</tr>

	<%
				
				' UBound : dernier indice dans tableaux
				' Rs.EOF : la fin du curseur
				WHILE NOT Rs.EOF%> 
			<tr style="height:40px; text-align:center;">
	
			<td><%=rs("NomCl")%></td>
			<td><%=rs("PrenomCl")%></td>
            <td><%=rs("Cin")%></td>
			<td><%=rs("Ville")%></td>
            <td><%=rs("Date_debut")%></td>
             <td><%=rs("Date_fin")%></td>
			 <td><%=rs("Anuuler")%></td>
	     
		
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