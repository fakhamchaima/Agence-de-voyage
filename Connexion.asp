
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  

  <style>
    body{
        margin-top: 7%;
        display: flex;
        justify-content:center;
        background-color: #90adda;
        font-family: 'Roboto', sans-serif;
    }
    form {
        margin-top: 20px;
        background-color: rgb(255, 255, 255);
        padding: 40px 60px;
        border-radius: 10px;
        width: 300px;
    }
    form h1{
        color: #2b75c9;
        text-align:center;
    }

    form .inputs {
        margin-top: 20%;
        width: 300px;
    }
    
    input
    {
        width: 265px;
        margin-top: 5%;
        padding: 15px;
        border:none;
        border-radius: 5px;
        background-color: #f2f2f2;
        margin-bottom: 15px;
    }
    form p.inscription{
        text-align: center;
        font-size: 14px;
        margin-bottom: 20px;
        color: #878787;
    }
    form p.inscription span{
        color: #0652b6;
    }
    a{
        color: #0652b6;
    }
  #BTConnexion{
        padding: 15px 25px;
        border-radius: 5px;
        border:none;
        font-size: 15px;
        color: #fff;
        background-color: #0c53b1;
        cursor:pointer;
    }
  </style>
  		<SCRIPT>
			function Verif()
			{
				var login  = document.getElementById('email') ;
				var passwd = document.getElementById('password') ;
				if(login.value.length == 0)
				{
					alert('Veuillez saisir le login') ;
					login.focus() ;
					return ;
				}
				if(passwd.value.length == 0)
				{
					alert('Veuillez saisir le mot de passe') ;
					passwd.focus() ;
					return ;
				}
				
			}
		</SCRIPT>
</head>
<body>
  <form action="verfier_connexion.asp" method="post" target="_top">
     
    <h1>Se connecter</h1>
    
    <div class="inputs">
    
      <input  type="text" placeholder="CIN" name="email" id="email" value="<%=Session("Log")%>" size="50"/>
      <input  type="password" placeholder="Mot de passe" name="password" id="password" value="<%=Session("Pas")%>">
    </div>
    
    <p class="inscription">Je n'ai pas de <span>compte</span>. Je m'en <a href="inscription.asp">crée</a> un.</p>

     
    <%If (Len(Session("Msg")) > 0) Then%>
							<tr height="30">
								<td align="center" valign="center" colspan="2">
									<b><font color="red"><%=Session("Msg")%></font></b>
								</td>
							</tr>
							<%End If%>
				<input type="submit" name="BTConnexion" id="BTConnexion" value="Se Connecter" onclick="javascript:Verif();">
						
							
           </div>
  </form>
  
</body>
</html>
<%
	Session("Msg") = ""
	Session("Log") = ""
	Session("Pas") = ""
%>