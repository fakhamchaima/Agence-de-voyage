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
	cin = Request("cin")
	req = "reservation_client'" & cin & "'"
	
	Set Rs = Server.CreateObject("ADODB.RecordSet")
	rs.Open req, cx, 3,3



%>
<HTML>
	<HEAD>
		<TITLE>Reservtion</TITLE>
		 <link rel="stylesheet" href="styleAdmin.css" />
	</HEAD>
	<BODY >

	<h1 id="titre" style="width : 300px ;">Les reservations d&#39;un client</h1>
	<form  class="fSup" method="post" action ="client.asp" >
				<h2  id="PTitre"> Reservartion par Client</h2>
				<h4 class="input">CIN de client</h4><input type="text" class="input" placeholder="CIN" id="cin" name="cin"><br>
				<input type="submit" class="btn" id="tt"  value="Chercher" >
			</form>



  <section>
<table border="1" align="center">
	<tr style="height: 50px; ">
	
		<th align="center" valign="center" width="100">Nom</th>
		<th align="center" valign="center" width="100">prenom</th>
		<th align="center" valign="center" width="100">Cin</th>
        <th align="center" valign="center" width="100">Tel</th>
		<th align="center" valign="center" width="100">Offre</th>
		<th align="center" valign="center" width="100">Date_debut</th>
		<th align="center" valign="center" width="100">Date_fin</th>
	
	</tr>

	<%
				
				' UBound : dernier indice dans tableaux
				' Rs.EOF : la fin du curseur
				WHILE NOT Rs.EOF%> 
					<tr  style="height: 40px; text-align :center;">
	
			<td><%=rs("NomCl")%></td>
			<td><%=rs("PrenomCl")%></td>
            <td><%=rs("Cin")%></td>
			<td><%=rs("Tel")%></td>
            <td><%=rs("Ville")%></td>
            <td><%=rs("Date_debut")%></td>
            <td><%=rs("Date_fin")%></td>


		
         </tr>
					<%
					
					Rs.movenext
				WEND
				%>
			</table>
			  <section>
		
	



			
	</BODY>
</HTML>
<%
rs.close()
Set rs = nothing
cx.close()
Set cx = Nothing
%>