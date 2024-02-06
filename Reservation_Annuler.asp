<%
liste = Request.Form("CBMsg")
Dim conn, rs, sql

Set conn = Server.CreateObject("ADODB.Connection")
Set rs = Server.CreateObject("ADODB.Recordset")


conn.Open Application("PC")
sql = "offre_annuler_client'" & Session("IdUser") & "'"


rs.Open sql, conn, 3,3

%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="styleAdmin.css" />
	<title></title>

</head>
<body>

	<h1 id="titre" style="width : 250px ;"> Vos Reservations </h1>
		<form name="formanule" id="formanule">

		<table border="1" align="center">
				<tr style="height: 50px;">
		<th>NomClient</th>
		<th>PrenomClient</th>
		<th>Offre</th>
		<th>Date_debut</th>
		<th>Date_fin</th>

   
</tr>
<%
                                
                   
         Do while not rs.eof %>
       <tr style="height: 40px; text-align :center;">
			 <td><%=rs("NomCl")%></td>
			<td><%=rs("PrenomCl")%></td>
			<td><%=rs("Ville")%></td>
			<td><%=rs("Date_debut")%></td>
			<td><%=rs("Date_fin")%></td>

         </tr>
        

        <%rs.MoveNext

        Loop%>
    
      <%rs.Close%>
    

	</table>
	</form>
</body>
</html>