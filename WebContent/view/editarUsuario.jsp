<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="classes.Usuario"%>
<%@page import="database.DBQuery"%>
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
      <link rel="shortcut icon" href="../assets/logo3.png" />
</head>
<body>
<%
	int editUser = Integer.parseInt(request.getParameter("editUser") );
	ResultSet user = new Usuario(editUser).select("id_usuario = " + editUser );
	user.next();
	
	String nome = user.getString("nome");
	String email = user.getString("email");
	int id_nivel_usuario = user.getInt("id_nivel_usuario");
	
	
	%>
<nav>
   			<input type="checkbox" id="check">
   			<label for="check" class="checkbtn">
   				<i class="fas fa-bars"></i>
   			</label>
   			<label class="logo">RODIZIO DE LIVROS</label>
   			<ul>  
            <li><a id="nav" href="home.jsp">Home </a></li>
            <li><a id="nav" href="atualizarDados.jsp">Atualize seus dados</a></li>
            <li><a id="nav" href="funcionario.jsp">Área do funcionário</a></li>
            <li><a id="nav" class="active" href="editarUsuario.jsp">Editar usuário</a></li>
            <li><a id="nav" href="logout.jsp">Sair</a></li>
   			</ul>
   		</nav>
   		<section>
   			<img src="../assets/bg9.png"/>
	   		<div class="user-box">
				<h1>DADOS DO USUÁRIO</h1>
				<form id="frmAlterar">
					<div class="textbox">
						<i class="fas fa-user"></i>
						<input type="hidden" name="editUser" value="<%=editUser%>">
						<input type="text" placeholder="Nome" required name="nome" value="<%=nome%>" >
					</div>
					<div class="textbox">
						<i class="fas fa-envelope"></i>
						<input type="text" placeholder="Email" required name="user" value="<%=email%>" >
					</div>
					<div ><br/>
				<span style= "color: black; font-size: 18px;">Nível do usuário:</span>
				<div style="display: flex">
					<div style="margin-top: 1%;"> 
					  <input type="radio" id="admin" name="edit_radio" value="2">
					  <label style=" font-size: 16px; color: black; ">Admin</label>
					</div>
					<div style="margin-left: 5%; margin-top: 1%;"> 
					  <input type="radio" id="comum" name="edit_radio" value="1">
					  <label style=" color: black; font-size: 16px;">Comum</label>
					</div>
				</div>
					<br/>
				<input class="botao" type="button" name="" id="btnAlterar" value="Atualizar"/>
				</form>
			</div>
		</section>
		<footer class="footer">
   			<div class="footer-left">
   				<img src="../assets/logo2.png"/>
   				<p id="text-legal">Instituto Federal de São Paulo<br/>
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
   		<script>
		$(document).ready(function() {
			var nivel_user = <%=id_nivel_usuario%>
			if (nivel_user == 2){
			document.getElementById("admin").checked = true;
			}else{
				document.getElementById("comum").checked = true;
			}
		});
		
		$(document).ready(function() {
			$("#btnAlterar").click(function() {
				var formData = $("#frmAlterar").serialize();
				$.post("alterarUsuario.jsp", formData, function(data, status) {
					alert("Dados alterados com sucesso!");
					window.location.href = "funcionario.jsp";
				});
			});
		});
	</script>
</body>
</html>