<%
If(Len(Session("IdUser")) = 0) Then
	Session("Msg") = "Veuillez vous identifier"
	Response.redirect "Connexion.asp"
End If
%>

<%

    Dim rs,req ,cx

    Set cx = Server.CreateObject("ADODB.Connection")
    ON ERROR RESUME NEXT 'si il y aun errur n envoyer pas un erreur   continuer'
    Set rs = Server.CreateObject("ADODB.RecordSet")
    cx.Open Application("PC")

    Sujet = request("Sujet")
    Email = request("Email")
    Tel = request("Tel")
    message = request("Message")
    IdUser = Session("IdUser")
    if ((Len(sujet) <> 0 )OR (Len(Email) <> 0) OR (Len(Tel) <> 0 ) OR (Len(message) <> 0)) then
        req = "contact '" & Sujet & "','"& Email &"','"& Tel &"','"& message &"' ,'"& IdUser &"' "
    end if
    rs.Open req, cx, 3,3

%> 

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Agence de voyage Settat : Séjours à petits prix -NicVoyages-">
    <link rel="icon" href="logo1.png" >
    <title>NicVoyages : agence de voyage</title>
	<link href="https://fonts.googleapis.com/css?family=Quicksand&display=swap" rel="stylesheet">
    <style>
        *{
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            font-family: 'Quicksand', sans-serif;
        }

        body{
            height: 100vh;
            width: 100%;
        }

        .arrier{
            position: relative;
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px 100px;
        }

        .arrier:after{
            content: '';
            position: absolute;
            width: 100%;
            height: 100%;
            left: 0;
            top: 0;
            background: url("contact.jpg") no-repeat center;
            background-size: cover;
            filter: blur(5px);
            z-index: -1;
        }
        .contact-box{
            width: 450px;
            display: grid;
            justify-content: center;
            align-items: center;
            text-align: center;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0px 0px 19px 5px rgba(0,0,0,0.19);
        }

        

        .form{
            padding: 25px 40px;
        }

        h2{
            position: relative;
            padding: 0 0 10px;
            margin-bottom: 10px;
        }

        h2:after{
            content: '';
            position: absolute;
            left: 50%;
            bottom: 0;
            transform: translateX(-50%);
            height: 4px;
            width: 50px;
            border-radius: 2px;
            background-color: #2b75c9;
        }

        .input{
            width: 100%;
            border: 2px solid rgba(0, 0, 0, 0);
            outline: none;
            background-color: rgba(230, 230, 230, 0.6);
            padding: 0.5rem 1rem;
            font-size: 1.1rem;
            margin-bottom: 22px;
            transition: .3s;
        }

        .input:hover{
            background-color: rgba(0, 0, 0, 0.1);
        }
        .input:focus{
            border: 2px solid rgba(30,85,250,0.47);
            background-color: #fff;
        }
        textarea{
            min-height: 150px;
        }

        .btn{
            width: 100%;
            padding: 0.5rem 1rem;
            background-color: #2b75c9;
            color: #fff;
            font-size: 1.1rem;
            border: none;
            outline: none;
            cursor: pointer;
            transition: .3s;
        }

        .btn:hover{
            background-color:#0e4f99;
        }

        

       
    </style>
</head>
<body>
	<div class="arrier">
		<div class="contact-box">
			<form class="form" id="form" method="post" >
				<h2>Contactez nous</h2>
				<input type="text" class="input" placeholder="Sujet" name="Sujet" id="Sujet" required>
				<input type="email" class="input" placeholder="Email" name="Email" id= "Email" required>
				<input type="tel" class="input" placeholder="Tél." name="Tel" id="Tel" required>
				<textarea placeholder="Message" class="input" name="Message" id="Message" required></textarea>
				<button class="btn"  onclick="msgEnvoyer()">Envoyer</button>
			</form>
		</div>
	</div>

    <script>
        function msgEnvoyer(){
            var Sujet  = document.getElementById('Sujet') ;
            var Email = document.getElementById('Email') ;
            var Tel  = document.getElementById('Tel') ;
            var Message = document.getElementById('Message') ;
            if(Sujet.value.length == 0 || Email.value.length == 0 || Tel.value.length == 0 || Message.value.length == 0)
            {
                alert('Veuillez saisir tous les champs') ;
                return ;
            }
            else{
                document.getElementById('form').action = 'Contacternous.asp' ;
				document.getElementById('form').method = 'POST' ;
				document.getElementById('form').submit() ;

                alert("Le message est envoyé");
            }
            
        }
    </script>
</body>
</html>