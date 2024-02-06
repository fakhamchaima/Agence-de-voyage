<html>
	<head>
	<meta http-equiv="content-Language" content="text/html" ;charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="icon" href="logo1.png" >
        <link rel="stylesheet" href="agenceVoyage.css">
		<title>NicVoyages : agence de voyage -ADMIN-</title>

		
	</head>
	<body>
        <div id="header">
               
            <ul>
                <li class="li"><a href="maroc.asp?offre=maroc" target="pageC" class="a1">Maroc</a></li>
                <li class="li"><a href="maroc.asp?offre=monde" target="pageC" class="a1">Tout le monde</a></li>
                <li class="li"><a href="hajj.asp" target="pageC" class="a1">Omra et hajj</a></li>
                <li class="li"><a href="Contacternous.asp" target="pageC" class="a1">Contacts</a></li>
                
                <%
                    
                    
                    if(Len(Session("IdUser")) <> 0) Then
                %>
                
                <li class="li2" id="li21"><a href="frame.asp" target="pageC"><img class="li2" id="img" src="images/profil.png" draggable ="false"></a></li>
                <style>
                    

                    #img{
                        width: 40px;
                        margin-top: -13px;
                        margin-right: -40px;
                       
                    }
                    #img:hover{
                        width: 45px;
                    }
                    #li21{
                        margin-right: 90px;
                        animation: c 6s  infinite ;
                    }
                    @keyframes c
                    {
                        0%{opacity: 1;}
                        35%{opacity: 0;}
                        70%{opacity: 1;}
                    }
                </style>
                
                
                <% 
                    
                    End If
                %>
                <%
                    if(Len(Session("IdUser")) = 0) Then
                %>
                <li class="li2" id="li2"><a href="Connexion.asp" target="pageC" class="a2">connexion</a></li>
                <li class="li2" id="li2"><a href="inscription.asp" target="pageC" class="a2">Sincrire</a></li>
                <% 
                    
                    End If
                %>
            </ul>
        </div>  
    </body>
</html>