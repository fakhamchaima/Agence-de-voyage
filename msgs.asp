<%
If(Len(Session("Login")) = 0) Then
	Session("Msg") = "Veuillez vous identifier"
	Response.redirect "ConnexionA.asp"
End If

%>


<%

Dim conn, rs ,req

Set conn = Server.CreateObject("ADODB.Connection")

Set rs = Server.CreateObject("ADODB.Recordset")

conn.Open Application("PC")

req=" affiche_message "

rs.Open req, conn, 3,3


%>
<HTML>
	<HEAD>
		<TITLE>Espace des  Admin</TITLE>
		<link rel="stylesheet" href="styleAdmin.css" />
	</HEAD>
	<BODY >
		<h1 id="titre" style="width : 300px ;">Les messages</h1>

 <section>
<table border="1" align="center">
	<tr  style="height: 50px;" >
	
		<th align="center" valign="center" width="100">Sujet</th>
		<th align="center" valign="center" width="100">Email</th>
		<th align="center" valign="center" width="100">Tel</th>
        <th align="center" valign="center" width="100">Message</th>
        <th align="center" valign="center" width="100">Login</th>
		<th align="center" valign="center" width="100">CIN</th>
	</tr>

	<%
				
				' UBound : dernier indice dans tableaux
				' Rs.EOF : la fin du curseur
				WHILE NOT Rs.EOF%> 
			<tr style="height:40px; text-align:center;">
	
			<td><%=rs("Sujet")%></td>
			<td><%=rs("Email")%></td>
            <td><%=rs("Tel")%></td>
			<td><%=rs("message")%></td>
            <td><%=rs("Login")%></td>
             <td><%=rs("Cin")%></td>
	     
		
         </tr>
					<%
					
					Rs.movenext
                    
				WEND
				%>
			</table>

 </section>
	
	</BODY>
</HTML>
