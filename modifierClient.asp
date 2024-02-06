<%
If(Len(Session("IdUser")) = 0) Then
	Session("Msg") = "Veuillez vous identifier"
	Response.redirect "Connexion.asp"
End If

%>

<%
Dim conn, nom,sql1,rs1

Set conn = Server.CreateObject("ADODB.Connection")

Set rs1 = Server.CreateObject("ADODB.Recordset")
conn.Open Application("PC")


sql1 = "Modifiers_client'" & Session("IdUser") & "'"
rs1.Open sql1, conn, 3,3


%>
<HTML>
	<HEAD>
		<TITLE>Espace des clients</TITLE>
		<link rel="stylesheet" href="styleAdmin.css" />
	</HEAD>
	<BODY >
		<div class="searchform">

    	<form action="modifieruser.asp" method="post" class="fAdd" >
		<h2  id="PTitre">Modifier client</h2>
	
		<h4 class="input"> Nom</h4><input type="text" placeholder="<%=rs1("NomCl")%>" value="<%=rs1("NomCl")%>" id="NomClient" name="NomClient" ><br>
		<h4 class="input"> Prenom</h4><input type="text" placeholder="<%=rs1("PrenomCl")%>" value="<%=rs1("PrenomCl")%>" id="PrenomClient" name="PrenomClient" ><br>
		<h4 class="input"> CIN</h4><input  type="text" placeholder="<%=rs1("Cin")%>" value="<%=rs1("Cin")%>" id="CIN" name="CIN" ><br>

		<h4 class="input"> Tel.</h4><input type="tel" placeholder="<%=rs1("Tel")%>" value="<%=rs1("Tel")%>" id="Tel" name="Tel" ><br>
        
		<h4 class="input"> Email </h4><input type="email"placeholder="<%=rs1("Email")%>" value="<%=rs1("Email")%>" id="Email" name="Email">
        
		<h4 class="input"> Adresse </h4><input type="text"placeholder="<%=rs1("Adresse")%>" value="<%=rs1("Adresse")%>" id="Adresse" name="Adresse">
        
	<h4 class="input"> Ville </h4> 
	<select name="ville" id="IdVille">
			<option value="1">casablanca</option>
			<option value="2">Agadir</option>
			<option value="3">Rabat</option>
			<option value="4">Marrakech</option>
    </select>
		<br>
      	
		<input type="submit" name="tt" id="tt" value="Modifier" style="margin-left: 8%;" onclick="modifier()">
		<input type="submit" name="tt1" id="tt" value="Annuler" style="margin-left: 8%;" onclick="annuler()">
		<script>
			function annuler()
			{
				var Nom = document.getElementById('NomClient') ;
				var Prenom = document.getElementById('PrenomClient') ;
				var CIN    = document.getElementById('CIN') ;
				var Tel    = document.getElementById('Tel') ;
				var Email  = document.getElementById('Email') ;
				var Adresse= document.getElementById('Adresse') ;
				Nom.value="<%=rs1("NomCl")%>"
				Prenom.value="<%=rs1("PrenomCl")%>"
				CIN.value="<%=rs1("Cin")%>"
				Tel.value="<%=rs1("Tel")%>"
				Email.value="<%=rs1("Email")%>"
				Adresse.value="<%=rs1("Adresse")%>"
				alert("Vos modifications est annuler");
			}

			function modifier()
			{
				var Nom = document.getElementById('NomClient') ;
				var Prenom = document.getElementById('PrenomClient') ;
				var CIN    = document.getElementById('CIN') ;
				var Tel    = document.getElementById('Tel') ;
				var Email  = document.getElementById('Email') ;
				var Adresse= document.getElementById('Adresse') ;

				if((Adresse.value.length == 0)||(Email.value.length == 0)||(Tel.value.length == 0)||(Nom.value.length == 0)||(Prenom.value.length == 0)||(CIN.value.length == 0))
				{
					alert('Veuillez saisir tous les champs') ;
					Nom.value="<%=rs1("NomCl")%>"
					Prenom.value="<%=rs1("PrenomCl")%>"
					CIN.value="<%=rs1("Cin")%>"
					Tel.value="<%=rs1("Tel")%>"
					Email.value="<%=rs1("Email")%>"
					Adresse.value="<%=rs1("Adresse")%>"
				  return ;
					
				}else{
					alert("Vos modifications est fait");
				}




			}
		</script>
	</form>

</div>
  
	</BODY>

</HTML>