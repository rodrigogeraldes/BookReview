<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.DBQuery"%>
<%
	int userLogin = (int) session.getAttribute("userlogin");
	String tableName = "usuario";
	String fields = "id_usuario, nome, email, senha, id_nivel_usuario, ativo";
	String fieldKey = "id_usuario";
	DBQuery dbQuery = new DBQuery(tableName, fields, fieldKey);

	String nome = "";
	String senha = ""; 
	String email = "";
	String id_nivel_usuario = "";
	String ativo = "";
	

	int id = userLogin;
	ResultSet resultSet = dbQuery.select("id_usuario = '" + id + "'");
	while (resultSet.next()) {
		email = resultSet.getString("email");
		nome = resultSet.getString("nome");
		senha = resultSet.getString("senha");
		id_nivel_usuario = resultSet.getString("id_nivel_usuario");	
		ativo = resultSet.getString("ativo");
	}
%>
<html>
<head>
<meta charset="UTF-8">
      <title>Rodizio de Livros</title>
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="shortcut icon" href="../assets/logo3.png" />
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
   			<label class="logo" style="font-family: 'Montserrat', sans-serif;">RODIZIO DE LIVROS</label>
   			<ul>  
   				<li><a id="nav" href="home.jsp">Home </a></li>
   				<li><a id="nav" class="active" href="atualizarDados.jsp">Atualize seus dados</a></li>
   				<li><a id="nav" href="login.html">Sair</a></li>
   			</ul>
   		</nav>
   		<section>
   			<img src="../assets/bg5.png"/>
	   		<div class="member-box">
				<h1>SEUS DADOS</h1>
				<form id="frmAtualiza">
					<div class="textbox">
						<i class="fas fa-user"></i>
						<input type="text" placeholder="Nome" required name="nome" value="<%=nome%>" >
					</div>
					<div class="textbox">
						<i class="fas fa-lock"></i>
						<input type="text" placeholder="Senha" name="senha" value="<%=senha%>">
					</div>
					<br/>
					<div class="text-box">
						<h5>Queremos te conhecer!</h5>
					</div>
					<div class="text-box">
						<textarea id="story" name="story" placeholder="Escreva um pouco sobre você..." rows="5" cols="45">
						</textarea>
					</div>
					<input type="checkbox" id="check-member" name="check-member" value="">
					<label for="check-member"><span>Desejo me candidatar para membro da equipe!</span></label>
					
					<input class="botao" type="button" name="" id="btnSendFrmAtualiza" value="Atualizar"/>
				</form>
			</div>
			<br/><br/>
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
   		<script type="text/javascript">
				$(document).ready(
						function() {
							$("#btnSendFrmAtualiza").click(
								function() {
										var formData = $("#frmAtualiza").serialize();
										$.post("salvaAlteracoes.jsp",formData,function(data,status) {
											alert("Dados alterados!");
											window.location.href = "home.jsp";
										});

								}	
							);
						}
					);
			</script>
</body>
</html>