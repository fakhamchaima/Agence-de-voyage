<%
	
Dim conn, rs, sql

Set conn = Server.CreateObject("ADODB.Connection")
Set rs = Server.CreateObject("ADODB.Recordset")

conn.Open Application("PC")
	

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"content="width=device-width,initial-scale=1.0">
<title>cree Compte</title>
a
</head>
<style>
body{
background-image: url('images/paris.png');
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
input{
 width: 100%;
 margin: 10px 0;
 outline: none;
 background-color: transparent;
 color: #fff;
 padding: 10px 6px;
 font-size: 18px;
 font-weight: bold;
 box-sizing: border-box;

border: bottom 1px #fff  solid;


}
#ville{
width: 100%;
 margin: 10px 0;
 outline: none;
 background-color: transparent;
 color: #fff;
 padding: 10px 6px;
 font-size: 18px;
 font-weight: bold;
 box-sizing: border-box;

border: bottom 1px #fff  solid;


}
#tt{
width: 80%;
border-radius: 12px;
padding:10px ;
background-color:rgb(90,120,190);
color:#fff;
font-size: 20px;
font-weight:bold;
outline: none;
cursor: pointer;
margin: 30px 10px 0px 10px;


}



</style>
<body>
   <form action="Ajouter.asp" method="post">
    <div class="container">
        <h2>Creer votre Compte</h2>
  <input type="text" placeholder="Nom" name="NomClient" required><br>
  <input type="text" placeholder="Prenom" name="PrenomClient" required><br>
  <input type="text" placeholder="Cin" name="CIN" required><br>
  <input type="text" placeholder="Tel" name="Tel" required><br>
  <input type="text" placeholder="Email" name="email" required><br>
  <input type="text" placeholder="Adresse" name="Adresse" required><br>
    <select name="ville" id="ville">
        <option value="1">casablanca</option>
        <option value="2">Agadir</option>
        <option value="3">Rabat</option>
        <option  value="4">Marrakech</option>
    </select>

   <input type="text" placeholder="password" name="password" required><br>
   <input type="submit" name="tt" id="tt" value="Connecter">
</div>
</form>
</body>
</html>