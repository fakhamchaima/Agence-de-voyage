 <%
If(Len(Session("IdUser")) = 0) Then
	Session("Msg") = "Veuillez vous identifier"
	Response.redirect "Connexion.asp"
End If


%>
 
<%
    

Dim rs,req, sql,idClient,idoffre,nbrChambre,Nbr_personne , i
Set cx = Server.CreateObject("ADODB.Connection")
ON ERROR RESUME NEXT 'si il y aun errur n envoyer pas un erreur   continuer'
Set rs = Server.CreateObject("ADODB.RecordSet")
Set rs1 = Server.CreateObject("ADODB.Recordset")
cx.Open Application("PC")

idoffre = Request("Status1")
Nbr_personne=request("nombre_personne")
nbrChambre=request("nbrChambre")



req = "reserver '" & Session("IdUser") & "','"& idoffre &"','"& Nbr_personne &"','"& nbrChambre &"'"

rs.Open req, cx, 3,3

nombreChambres = CInt(Request.Form("nbrChambre"))

<!--  -->
For i = 1 To nombreChambres
    nombreLits = Request.Form("nombreLits_" & i)
    typeChambre = Request.Form("typeChambre_" & i)
    res = rs("Iddres")+1
    Sql = "insertChambre '" & res & "','"& nombreLits &"','"& typeChambre &"'"
    rs1.Open Sql, cx, 3, 3
Next
<!--  -->


%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"content="width=device-width,initial-scale=1.0">
<title>cree Compte</title>

</head>
<style>
body{
background-image: url('paris.png');
background-size: cover;
background-repeat: no-repeat;
font-family:Arial, Helvetica, sans-serif ;

}
.container{
 max-width: 380px;
 margin: auto;
 margin-top: 50px;
 background-color: rgba(0,0,0,0.8);
text-align: center;
border-radius: 20px;
padding: 40px;
color: #fff;
box-sizing: border-box;

}
h2{
    color:floralwhite;
    text-align: center;
    text-transform: capitalize;
    font-weight: bold;
}


#tt{
width: 80%;
border-radius: 12px;
padding:10px ;
background-color:rgb(169 158 152);
color:#fff;
font-size: 20px;
font-weight:bold;
outline: none;
cursor: pointer;
margin: 30px 10px 0px 10px;


}



</style>
<body>
   
    <div class="container">
        <h2>Votre réservation est fait</h2>
       
    
    
    <table border="0" align="center" style="    background-color: #1b7686;
    width: 250px;
    height: 70px;
    border-radius: 17px;">
        <tr>
            <td>Nombre de personnes</td>
            <td> : </td>
            <td><% Response.Write(Nbr_personne)%> </td>
        </tr>
        <tr>
            <td>Nombre de chambres</td>
            <td> : </td>
            <td><% Response.Write(nbrChambre) %> </td>
        </tr>
         </table>

    <form action="Agence_voyage.asp" method="post">
        <input type="submit" name="tt" id="tt" value="D'ACCORD">
    </form>
    </div>
</body>
</html>
