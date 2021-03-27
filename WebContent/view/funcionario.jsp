<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.DBQuery"%>
<%@page import="classes.Usuario"%>
<%@page import="classes.Nivel"%>
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
      <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	  <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	  <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>	
	  <link rel="shortcut icon" href="../assets/logo3.png" />
   </head>
   <body>
      <!-- HEADER -->
      <nav>
         <input type="checkbox" id="check">
         <label for="check" class="checkbtn">
         <i class="fas fa-bars"></i>
         </label>
         <label class="logo" style="font-family: 'Montserrat', sans-serif;">RODIZIO DE LIVROS</label>
         <ul>
            <li><a id="nav" href="home.jsp">Home </a></li>
            <li><a id="nav" href="atualizarDados.jsp">Atualize seus dados</a></li>
            <li><a id="nav" class="active" href="funcionario.jsp">Área do funcionário</a></li>
            <li><a id="nav" href="logout.jsp">Sair</a></li>
         </ul>
      </nav>
      <section>
      <table class="table">
  <thead class="table-dark"></thead>
  <tbody></tbody>
</table>
      <div class="container">
		    <table class="table" style="border: solid 2px #3B3B3B;">
		    	<thead align="center" style="color: #FFCC57; background: #3B3B3B; text-align: center;">
                    <tr style="border: solid 2px #3B3B3B;"> 
                        <th scope="col" style="font-size: 18px; font-weight: bold">Nome</th>
                        <th scope="col" style="font-size: 18px; font-weight: bold">Usuário</th>
                        <th scope="col" style="font-size: 18px; font-weight: bold">Nível</th>
                        <th scope="col" style="font-size: 18px; font-weight: bold">Deletar</th>
                        <th scope="col" style="font-size: 18px; font-weight: bold">Editar</th>
                    </tr>
                </thead>
               <tbody>
                    
                    <%
                        try {
                        	ResultSet usuario = new Usuario().selectAll();
                            while (usuario.next()) {
                           		ResultSet nivel = new Nivel().select("id_nivel_usuario = " + usuario.getString(5) );
                           		nivel.next();
					%>
                    <tr style="border: solid 2px #3B3B3B;">
                        <td style="font-size: 16px;"><%= usuario.getString(2)%></td>
                        <td style="font-size: 16px;"><%= usuario.getString(3)%></td>
                        <td style="font-size: 16px;"><%= nivel.getString(2)%></td>
                        <td style="font-size: 16px;">
                        	<button style="padding-left: 25px; border: none; background-color: transparent; color: #FFCC57;" class="btn_apagar" id="btn-delete<%=usuario.getString(1)%>" value="<%=usuario.getString(1)%>" name="botao_delete" data-button="btn-delete<%= usuario.getString(1) %>">
							<i class="fas fa-user-minus"></i>
							</button>
						</td>
                        <td style="font-size: 16px;">
                        	<a style="padding-left: 20px; color: #FFCC57;" href="editarUsuario.jsp?editUser=<%=usuario.getString(1)%>" id="btn-edit">
                        	<i class="fas fa-user-edit"></i>
							</a>
						</td>
                    </tr>
                    <% 
                    
                      }
                        } catch (Exception e) {
                            out.print(e);
                        }
                        
                     %>
                </tbody>
            </table>
            </div>
            <img style="margin-left: 350px" src="../assets/bg11.png"/>
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
				$('button[name="botao_delete"]').click(function() {
					var formData = $('button#'+$(this).data('button'));
	
					$.post("deletarUsuario.jsp", formData, function(data, status){ 
						alert("Usuário deletado")
						window.location.href="funcionario.jsp"
					});
				});
			});
		</script>
      <!-- FIM HEADER -->
   </body>
</html>