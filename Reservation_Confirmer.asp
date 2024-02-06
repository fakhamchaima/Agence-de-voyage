<%
liste = Request.Form("CBMsg")
Dim conn, rs,rs1, sql, nom,req

Set conn = Server.CreateObject("ADODB.Connection")
Set rs = Server.CreateObject("ADODB.Recordset")


conn.Open Application("PC")
sql = "offre_client_id'" & Session("IdUser") & "'"

if(IdStatus=4 ) Then

End If

rs.Open sql, conn, 3,3

%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="styleAdmin.css" />
	<title></title>
	<script language="javascript">
			var nbm = <%=rs.RecordCount%> ;
			var nbmc = 0 ;
			function SelectAll(cbg, VCBM)
			{
				var i, nbm = VCBM.length ;
				for(i = 0 ; i < nbm ; i++)
				{
					VCBM[i].checked = cbg.checked ;
				}
				if(cbg.checked)
				{
					nbmc = nbm ;
				}
				else
				{
					nbmc = 0 ;
				}
			}
			function SetChange(cbm, cbg)
			{
				if(cbm.checked)
				{
					nbmc++ ;
					if(nbmc == nbm)
					{
						cbg.checked = true ;	
						
					}
				
				}
				else
				{
					nbmc-- ;
					cbg.checked = false ;
				}
					
			}

			function Verif()
			{
				if(nbmc == 0)
				{
					alert('Veuillez selectionner un ou plusieurs réservation') ;
					return ;
				}
				
				document.getElementById('formanule').action = 'Anullereservation.asp' ;
				document.getElementById('formanule').method = 'POST' ;
				document.getElementById('formanule').submit() ;
			}
		</script>
</head>
<body>

	<h1 id="titre" style="width : 250px ;"> Vos Reservations </h1>
		<form name="formanule" id="formanule"  method="post">
		<table border="1" align="center">
				<tr style="height: 50px;">
		<th>NomClient</th>
		<th>PrenomClient</th>
		<th>Offre</th>
		<th>Date_debut</th>
		<th>Date_fin</th>
		<th><input type="checkbox" name="CBAll" id="CBSAll" onclick="javascript:SelectAll(this, document.getElementsByName('CBMsg'));">
       

   
</tr>
<%
                                
                   
         Do while not rs.eof %>
       <tr style="height: 40px; text-align :center;">
			 <td><%=rs("NomCl")%></td>
			<td><%=rs("PrenomCl")%></td>
			<td><%=rs("Ville")%></td>
			<td><%=rs("Date_debut")%></td>
			<td><%=rs("Date_fin")%></td>
			
			<td>
		  	
			<input type="checkbox" name="CBMsg" style="width: 30px;" id="CBMsg_<%=rs("Iddres")%>" value="<%=rs("Iddres")%>" onclick="javascript:SetChange(this, document.getElementById('CBSAll'));" >
            	<!--<input type="submit" value="<%=rs("Iddres")%>">-->
			</td>
         </tr>
        

        <%rs.MoveNext

        Loop%>
    
      <%rs.Close%>
    

	</table>
	<input type="button" name="BTValider" id="tt" value="Valider" style="margin-left: 50%;" onclick="javascript:Verif();">

	</form>
</body>
</html>