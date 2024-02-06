<%
If(Len(Session("IdUser")) = 0) Then
	Session("Msg") = "Veuillez vous identifier"
	Response.redirect "Connexion.asp"
End If

%>
<%
            Dim rs, sql,par
        Set cx = Server.CreateObject("ADODB.Connection")
        ON ERROR RESUME NEXT 'si il y aun errur n envoyer pas un erreur   continuer'

            cx.Open Application("PC")
            par=Request.QueryString("offre")
            req = "affiche_par_pays '" & par & "'"

          Set Rs = Server.CreateObject("ADODB.RecordSet")
              rs.Open req, cx, 3,3
     %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Agence de voyage Settat : Séjours à petits prix -NicVoyages-">
    <meta name="viewport" content="width = device-width , initial-scale = 1">
    <link rel="icon" href="logo.png" >
    <title>NicVoyages : agence de voyage</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
    
    <link rel="stylesheet" href="offreSt.css">

    </head>
    
    <body>
        <header>
          <div id="imagePrincipale">
        <%
            If par="maroc" Then
            
        %>
            <style>
                @keyframes imagePrincipale
        {
            0%{background: url(images/maroc1.jpg) no-repeat fixed;
            background-size: 100% 100%;}
            40%{background: url(images/maroc2.jpg) no-repeat fixed;
            background-size: 100% 100%;}
            60%{ background: url(images/maroc3.jpg) no-repeat fixed;
            background-size: 100% 100%;}
            80%{background: url(images/maroc4.jpg) no-repeat fixed;
            background-size: 100% 100%;}
            100%{background: url(images/maroc5.jpeg ) no-repeat fixed;
            background-size: 100% 100%;}
        }
            </style>
        
            
        <%
        Else 
        %>
        <style>
             @keyframes imagePrincipale
            {
                0%{background: url(images/turkey.jpeg)no-repeat fixed ;
                background-size: 100% 100%;}
                40%{background: url(images/paris.png ) no-repeat fixed;
                background-size: 100% 100%;}
                60%{ background: url(images/turkey.jpeg) no-repeat fixed;
                background-size: 100% 100%;}
                80%{background: url(images/turquie.png) no-repeat fixed;
                background-size: 100% 100%;}
                100%{background: url(images/korea.jpg ) no-repeat fixed;
                background-size: 100% 100%;}
            }
        </style>
        <%
        End If
            %>
            
                <h1><%=par%></h1>
                
                <h3>VIVEZ LE MEILLEUR VOYAGE  </h3>
                <h3>ORGANISÉ AU <%=par%></h3>
                
            </div>
        </header>

    <section>
    
        <table cellpadding="0" cellspacing="0">
            
            
            <%
            
            ' UBound : dernier indice dans tableaux
            ' Rs.EOF : la fin du curseur
            WHILE NOT Rs.EOF%> 
                <form method="POST" action ="menu2.asp" > 
                    <tr >
                            
                            <td colspan="4">
                                <h2 class="titreO"><%=rs("Ville")%></h2>
                                
                                
                            </td>
                    </tr>
                    <tr>
                        <td class="td1">
                            <input type="text" id="Status" name="Status" value="<%=rs("IdOfVo")%>" style="display: none;visibility: hidden;">
                            <img src= <%=rs("image")%> class="img" draggable = false>
                        </td>

                        <td class="td2">
                            <h4 >Prix </h4>  
                            <h4 >Nombre de places </h4>
                            <h4 >Nombre de jours </h4> 
                            <h4 >Date de debut </h4>
                            <h4 >Date de fin </h4> 
                            <h4 >Description </h4> 
                        </td>
                        <td style="width: 20px;">
                            <h4> : </h4>
                            <h4> : </h4>
                            <h4> : </h4>
                            <h4> : </h4>
                            <h4> : </h4>
                            <h4> : </h4>
                        </td>
                        <td>
                            <h4><%=rs("prix")%> DH</h4>
                            <h4><%=rs("Nbr_places")%></h4>
                            <h4><%=rs("Nbr_jour")%></h4>
                            <h4><%=rs("Date_debut")%></h4>
                            <h4><%=rs("Date_fin")%></h4>
                            <h4><input type="submit" class="btn" value="Voir plus" ></h4>

                        </td>


                            
                            
                    </tr>  
                </form> 
            <% 
            Rs.movenext
            WEND
            %>
            
                
                
        </table>
    </section>
    
    
    

    </body>

</html>