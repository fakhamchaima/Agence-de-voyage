		<%
Dim conn, rs, sql, id

Set conn = Server.CreateObject("ADODB.Connection")
conn.Open Application("PC")

Set rs = Server.CreateObject("ADODB.Recordset")
	 sql = "nbre"

rs.Open sql, conn, 3,3

%>

<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="Agence de voyage Settat : Séjours à petits prix -NicVoyages-">
		<link rel="icon" href="logo1.png" >
		<title>NicVoyages : agence de voyage -ADMIN-</title>
		<style>
			img{
				margin: 7% 0 0 28%;
				animation: img 12s  infinite ;
			}
			h3{
				display : inline-block ;
			}
			div{
				padding-left: 2%;
				border : 2px solid;
				border-color: #233dff;
				width : 150px;
				border-radius: 10px;
				display: inline-grid;
				margin-left: 14%;
				margin-top: 5%;
				background-color: #ff6100;
			}
			.nbr{
				border : 2px solid;
				border-color : #233dff;
				border-radius : 50%;
				width : 45px;
				height :40px;
				text-align : center;
				font-size: xx-large;
				color: white;
			}
			.nom{
				    color: white;
					font-size: larger;
					font-style: italic;
					font-family: sans-serif;
					font-weight: revert;
			}
		</style>
	</head>
	<body>

		

		<div>
			<h3 class="nbr"><%=rs("reservation")%>&nbsp;</h3>
			<h3 class="nom">réservations</h3>
		</div>



		<div>
			<h3 class="nbr"><%=rs("offres")%>&nbsp;</h3>
			<h3 class="nom">Offres</h3>

		</div>

		<div>
			<h3 class="nbr"><%=rs("Client")%>&nbsp;</h3>
			<h3 class="nom">Clients</h3>
		</div>

					
		<img src="logo.png">

    </body>

</html>