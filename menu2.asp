
 
<%
        Dim rs, sql,idoffre,req
			
       
        idoffre = Request("Status")
        
        Set cx = Server.CreateObject("ADODB.Connection")
        ON ERROR RESUME NEXT 'si il y aun errur n envoyer pas un erreur   continuer'

	        cx.Open Application("PC")
            
           	req = "Offre_par_idVoyage '" & idoffre & "'"

	      Set Rs = Server.CreateObject("ADODB.RecordSet")
	          rs.Open req, cx, 3,3


    


     %> 

<!DOCTYPE html>
<html >
    <head>
    
        <meta http-equiv="content-Language" content="text/html" ;charset="UTF-8" >
        
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
        <title>Hotels</title>
        
            <link rel="icon" href="images1/logo1.png" >
        <link rel="stylesheet" href="offreStyle.css">
            <link href="https://fonts.googleapis.com/css2?family=Indie+Flower&family=Mochiy+Pop+One&family=Satisfy&display=swap" rel="stylesheet">
            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&display=swap" rel="stylesheet">
        
        
    </head>
    <body>
            
        <section>
            <style>
                section{
                    margin: 48px;
                    border-radius: 50px;
                    border : outset;
                    padding-bottom: 10px;
                    padding-left: 10px;
                }
            </style>
            <table >

                <tr >
                            
                    <td colspan="4">
                        <h1 class="titreO"><%=rs("Ville")%></h1>
                        
                        
                    </td>
                </tr>
                <tr > 
                    <td width="150">

                        <img src= <%=rs("image")%> class="img">

                    </td>


                    <td width="50"></td> 
                    <td > 


                        
                        <p><%=rs("Nbr_jour")%> jours </p>

                        <p><%=rs("prix")%> DH</p>
                        <%=rs("description")%>

                    </td>
                </tr>









            </table>




            <form method="POST" action ="menu3.asp" id="reserver" style="width: 400px;height: 320px; display: flex;
            justify-content: center;
            align-items: center; margin-left: 33%;
            background-color: bisque;
            border-radius: 20%;">
                <input type="text" id="Status1" name="Status1" value="<%=rs("IdOfVo")%>" style="display: none;visibility: hidden;">

                
                <table id="tab" style="width: 300px;"  >
                    <tr>
                        <td>
                            <h4>Selectionnez le nombre de personnes et de chambres</h4>
                        </td>
                    </tr>
                    <tr >
                        <td>
                            
                            <select name="nombre_personne">
                                <option value="1">1 personne</option>
                                <option value="2">2 personne</option>
                                <option value="3">3 personne</option>
                                <option value="4">4 personne</option>
                                <!-- Ajoutez d'autres options selon vos besoins -->
                            </select>

                            <br>
                        
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <select id="ddlnbrChambre" name="nbrChambre" onchange="afficherTable()">
                                <option value="1">1 chambre</option>
                                <option value="2">2 chambres</option>
                                <option value="3">3 chambres</option>
                                <option value="4">4 chambres</option>
                                <!-- Ajoutez d'autres options selon vos besoins -->
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td >
                            <table id="tableChambres" style="display: none;width: 400px;">
                                <tr>
                                    <th >Chambre  </th>
                                    <th >Nombre de lits</th>
                                    <th>Type de chambre</th>
                                </tr>
                            </table>
                            <input type="submit" class="btnr" value="reserver" style="margin-top: 2%;
                            background-color: #0525fb;
                            width: 100px;
                            height: 30px;
                            border-radius: 5px;
                            font-weight: bolder;
                            font-size: medium;
                            color: white;" >
                        </td>
                    </tr>
                    
                </table>

                <script>
                    function afficherTable() {
                        var nbrChambre = document.getElementById("ddlnbrChambre").value;
                        var tableChambres = document.getElementById("tableChambres");
                        
                        // Supprimer toutes les lignes existantes du tableau
                        while (tableChambres.rows.length > 1) {
                            tableChambres.deleteRow(1);
                        }
                        
                        if (nbrChambre > 0) {
                            tableChambres.style.display = "table";
                            
                            // Générer les nouvelles lignes du tableau à l'aide d'une boucle while
                            var i = 0;
                            while (i < nbrChambre) {
                                var row = tableChambres.insertRow(i + 1);
                                var chambreCell = row.insertCell(0);
                                var litsCell = row.insertCell(1);
                                var typeChambreCell = row.insertCell(2);
                                
                                chambreCell.innerHTML = "Chambre " + (i + 1);
                                litsCell.innerHTML = '<select name="nombreLits_' + (i + 1) + '" ><option value=1>1</option><option value=2>2</option><option value=3>3</option></select>';
                                typeChambreCell.innerHTML = '<select name="typeChambre_' + (i + 1) + '"><option value="simple">Simple</option><option value="double">Double</option><option value="suite">Suite</option></select>';
                                
                                i++;
                            }
                        } else {
                            tableChambres.style.display = "none";
                        }
                    }
                </script>
                
                
                




            </form>




        </section>
                


    </BODY>
</HTML>
<%
rs.close()
Set rs = nothing
cx.close()
Set cx = Nothing
%>