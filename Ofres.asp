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
	
	req = "Afficher_t_offre"
	
	Set Rs = Server.CreateObject("ADODB.RecordSet")
	rs.Open req, cx, 3,3
if(IdStatus=1 ) Then

End If


%>
<HTML>
	<HEAD>
		<link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&display=swap" rel="stylesheet">

		<link rel="stylesheet" href="styleAdmin.css" />
	</HEAD>
	<BODY >
		<h1 id="titre" style="width : 250px ;">Tous les offres</h1>

 <form action="add.asp" method="post" class="fAdd" style="height: 800px;">
  <div class="container">
        <h2  id="PTitre">Ajouter un offre</h2>
 <h4 class="input"> Nonmbre des places</h4>  <input type="text" placeholder="nbr place" name="nbr_pla" required><br>
  <h4 class="input"> Offre</h4> <input type="text" placeholder="Ville" name="Ville" required><br>
  <h4 class="input"> Pays</h4> <input type="text" placeholder="Maroc/Monde/omrahaj" name="Pays" required><br>
  <h4 class="input"> Prix</h4> <input type="text" placeholder="prix" name="prix" required><br>
  <h4 class="input"> Image</h4> <input class="input" style="width : 280px ;" type="file" placeholder="Image" name="file" id="file" required onClick="javascript:img()" ><br> 
  <h4 class="input"> nonmbre des jours</h4> <input type="text" placeholder="nbr jours" name="nbr_j" required><br>
 <!--<select id="choix" onchange="afficherChoix()">
  <option value="1">Option 1</option>
  <option value="2">Option 2</option>
  <option value="3">Option 3</option>
</select>--> 
  <h4 class="input"> Date de debut</h4> <input type="text" placeholder="AAAA-MM-JJ" name="D_debut" required><br>
  <h4 class="input"> Date de fin</h4> <input type="text" placeholder="AAAA-MM-JJ" name="D_fin" required><br>
  <h4 class="input">Description</h4><textarea placeholder="Description (<br> pour retourner à la ligne)" class="input" name="Description" required style="height: 180px; width: 200px;"></textarea>
  
  <input type="submit" name="tt" id="tt" value="Ajouter">
</div>
</form>
	<Script>
		function img() {
			i =document.getElementById('file').value
			var T = i.split("\\")
			document.getElementById('img1').value = T[2]
			document.getElementById('img').src = T[2]
		}
	
	</Script> 
		
			
			<form  class="fSup" method="post" action ="Supprimer_offre.asp" >
				<h2  id="PTitre">Supprimer un offre</h2>
				<h4 class="input">ID d'offre </h4><input type="text" class="input" placeholder="id" id="id" name="id"><br>
				<input type="submit" class="btn" id="tt"  value="Supprimer" >
			</form>

<div class="searchform">

<section>

<table border="1" align="center">
	<tr style="height: 50px;">
	    <th align="center" valign="center" width="150">IdOffre</th>
		<th align="center" valign="center" width="150">Nbrplace</th>
		<th align="center" valign="center" width="150">Offre</th>
		<th align="center" valign="center" width="150">prix(DH)</th>
		<th align="center" valign="center" width="150">Nbr_jours</ourth>
		<th align="center" valign="center" width="150">Date_debut</th>
		<th align="center" valign="center" width="150">Date_fin</th>
		
	</tr>
	<style>
		.h2{
			font-weight: bold;
			font-size: xx-large;
   			font-family: 'Dancing Script', cursive;
		}
	</style>
	
	<%
				
				' UBound : dernier indice dans tableaux
				' Rs.EOF : la fin du curseur
				WHILE NOT Rs.EOF%> 
					<tr style="height: 40px; text-align :center;">
	        <td style="width: 100px;"><%=rs("IdOfVo")%></td>
			<td style="width: 100px;"><%=rs("Nbr_places")%></td>
			<td style="background: url(<%=rs("image")%>) ; height: 280px;width: 530px;  background-size: cover;
				background-position: center center;"><h2 class="h2"><%=rs("Ville")%></h2></td>
			<td><%=rs("prix")%></td>
			<td><%=rs("Nbr_jour")%></td>
			<td><%=rs("Date_debut")%></td>
			<td><%=rs("Date_fin")%></td>
			
         </tr>
					<%
					
					Rs.movenext
				WEND
				%>
			</table>
			</section>
			 
		</form>

                </div>
				
	</BODY>
</HTML>
<%
rs.close()
Set rs = nothing
cx.close()
Set cx = Nothing
%>