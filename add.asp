<%
	
Dim conn, rs, sql, id

Set conn = Server.CreateObject("ADODB.Connection")
conn.Open Application("PC")

Set rs = Server.CreateObject("ADODB.Recordset")


nbr_pla=request("nbr_pla")
Ville=request("Ville")
Pays=request("Pays")
prix=request("prix")
image=request("file")
nbr_j=request("nbr_j")
D_debut=request("D_debut")
D_fin=request("D_fin")
Description=request("Description")



sql= "Ajouter_offre'" & nbr_pla & "','" & Ville & "','" & Pays & "','" & prix & "','" & image & "','" & nbr_j & "','" & D_debut & "','" & D_fin & "','" & Description & "'"     
    
rs.Open sql, conn, 3,3


Response.redirect "Ofres.asp" 
%>
