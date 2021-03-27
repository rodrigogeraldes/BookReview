<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
      <title>Rodizio de Livros</title>
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="../css/style.css">
      <link rel="preconnect" href="https://fonts.gstatic.com">
	  <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
	  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesomee.min.css">
      <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
      <link rel="stylesheet" href="../MDB/css/bootstrap.min.css">
      <link rel="stylesheet" href="../MDB/css/mdb.min.css">
      <link rel="stylesheet" href="../MDB/css/style.css">
      <link rel="stylesheet" type="text/css" href="../css/style.css">
      <script src="https://kit.fontawesome.com/a076d05399.js"></script>
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>	
</head>
<body>
<nav>
   			<input type="checkbox" id="check">
   			<label for="check" class="checkbtn">
   				<i class="fas fa-bars"></i>
   			</label>
   			<label class="logo">RODIZIO DE LIVROS</label>
   			<ul>  
   				<li><a id="nav" href="login.html">Login</a></li>
   				<li><a id="nav" class="active" href="#">Cadastro</a></li>
   				<li><a id="nav" href="#">Sobre</a></li>
   			</ul>
   		</nav>
   		<section>
	   		<div class="registered-box">
				<h1>Obrigado por se cadastrar!</h1><br/>
				<span style="font-size: 22px;">Uma senha provisória foi enviada ao seu email.<br/>Clique <a href="login.html" style="color: #FFCC57;">aqui</a> para realizar login.</span>	
			</div>
			<div style="margin-left: 500px;">
			<img src="../assets/bg8.png"/>
			</div>
		</section>
		<footer class="footer">
   			<div class="footer-left">
   				<img src="../assets/logo2.png"/>
   				<p id="text-legal">
   				Instituto Federal de São Paulo<br/>
   				Campûs Guarulhos<br/>
   				Tecnologia em ADS<br/>
   				Projeto de PWED4<br/>
   				Rodrigo de Oliveira Geraldes
   				 </p>
	   			<div class="socials">
	   				<a href="#"><i class="fab fa-facebook-square"></i></a>
	   				<a href="#"><i class="fab fa-instagram"></i></a>
	   				<a href="#"><i class="fab fa-youtube"></i></a>
	   				<a href="#"><i class="fab fa-github"></i></a>
	   				<a href="#"><i class="fab fa-linkedin"></i></a>
	   			</div>
   			</div>
   		</footer>
   		
   		<script type="text/javascript">		
               	$(document).ready( 
               		function() {
               			$("#btnSendFrmCadastro").click(
               					function() {
               						var formData = $("#frmCadastro").serialize();
               						$.post( "registerUser.jsp", formData, function( data, status ) {
               							if(data.success){
               								alert("Seu cadastro foi realizado com sucesso! \nUma senha provisória foi enviada ao seu email!");
               								window.location.href = "login.html";
               							}
               							else{
               								alert("Erro ao cadastrar! Contate o administrador.");
               							}
               						}, 'json');
               					}		
               			);
               		} 
               	);
            </script>
   		<!-- Default form login -->
</body>
</html>