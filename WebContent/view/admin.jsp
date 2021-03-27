<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
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
   		
   		int userLogin = session.getAttribute("userlogin") == null ? 0 : (Integer) session.getAttribute("userlogin");
		if (!(userLogin > 0)) {
			response.sendRedirect("login.html");
		}

		String tableName = "usuario";
		String fields = "id_usuario, nome, email, senha, id_nivel_usuario, ativo";
		String fieldKey = "id_usuario";
		DBQuery dbQuery = new DBQuery(tableName, fields, fieldKey);
		ResultSet rs = dbQuery.select("");
		
		String nome = "";

		int id = userLogin;
		ResultSet resultSet = dbQuery.select("id_usuario = '" + id + "'");

		while (resultSet.next()) {
			nome = resultSet.getString("nome");
		}
	%>
     	<!-- HEADER -->
   		<nav>
   			<input type="checkbox" id="check">
   			<label for="check" class="checkbtn">
   				<i class="fas fa-bars"></i>
   			</label>
   			<label class="logo" class="logo" style="font-family: 'Montserrat', sans-serif;">RODIZIO DE LIVROS</label>
   			<ul>  
   				<li><a id="nav" class="active" href="#">Home </a></li>
   				<li><a id="nav" href="atualizarDados.jsp">Atualize seus dados</a></li>
   				<li><a id="nav" href="funcionario.jsp">�rea do funcion�rio</a></li>
   				<li><a id="nav" href="logout.jsp">Sair</a></li>
   			</ul>
   		</nav>
   		<!-- Team -->
<section id="team" class="pb-5">
    <div class="container">
        <h5 class="section-title h1" style="font-weight: bold; font-size: 40px; border-bottom: 6px solid #FFCC57; padding: 13px 0; color: black; font-family: 'Montserrat', sans-serif;">NOSSOS EXEMPLARES</h5>
        <div class="row">
            <!-- Team member -->
            <div class="col-xs-12 col-sm-6 col-md-4">
                <div class="image-flip" >
                    <div class="mainflip flip-0">
                        <div class="frontside">
                            <div class="card">
                                <div class="card-body text-center">
                                    <p><img class="img-fluid" src="../assets/01.jpg" alt=""></p>
                                    <h4 class="card-title">A garota do lago</h4>
                                    <p class="card-text">Charlie Donlea</p>
                                    <a href="#" class="btn btn-warning btn-sm"><i class="fa fa-plus"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="backside">
                            <div class="card">
                                <div class="card-body text-center mt-4">
                                    <h4 class="card-title">A garota do lago</h4>
                                    <p class="card-text" style="text-align: justify;">Summit Lake, uma pequena cidade entre montanhas, � esse tipo de lugar, buc�lico e com encantadoras casas dispostas � beira de um longo trecho de �gua intocada.Duas semanas atr�s, a estudante de direito Becca Eckersley foi brutalmente assassinada em uma dessas casas. Filha de um poderoso advogado, Becca estava no auge de sua vida. Atra�da instintivamente pela not�cia, a rep�rter Kelsey Castle vai at� a cidade para investigar o caso.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ./Team member -->
            <!-- Team member -->
            <div class="col-xs-12 col-sm-6 col-md-4">
                <div class="image-flip" ontouchstart="this.classList.toggle('hover');">
                    <div class="mainflip">
                        <div class="frontside">
                            <div class="card">
                                <div class="card-body text-center">
                                    <p><img class="img-fluid" src="../assets/02.jpg" alt=""></p>
                                    <h4 class="card-title">A revolu��o dos bichos</h4>
                                    <p class="card-text">George Orwell</p>
                                    <a href="#" class="btn btn-warning btn-sm"><i class="fa fa-plus"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="backside">
                            <div class="card">
                                <div class="card-body text-center mt-4">
                                    <h4 class="card-title">A revolu��o dos bichos</h4>
                                    <p class="card-text" style="text-align: justify;">Verdadeiro cl�ssico moderno, concebido por um dos mais influentes escritores do s�culo XX, A revolu��o dos bichos � uma f�bula sobre o poder. Narra a insurrei��o dos animais de uma granja contra seus donos. Progressivamente, por�m, a revolu��o degenera numa tirania ainda mais opressiva que a dos humanos.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ./Team member -->
            <!-- Team member -->
            <div class="col-xs-12 col-sm-6 col-md-4">
                <div class="image-flip" ontouchstart="this.classList.toggle('hover');">
                    <div class="mainflip">
                        <div class="frontside">
                            <div class="card">
                                <div class="card-body text-center">
                                    <p><img class="img-fluid" src="../assets/03.jpg" alt=""></p>
                                    <h4 class="card-title">O poder do agora</h4>
                                    <p class="card-text">Eckhart Tolle</p>
                                    <a href="#" class="btn btn-warning btn-sm"><i class="fa fa-plus"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="backside">
                            <div class="card">
                                <div class="card-body text-center mt-4">
                                    <h4 class="card-title">O poder do agora</h4>
                                    <p class="card-text" style="text-align: justify;">N�s passamos a maior parte de nossas vidas pensando no passado e fazendo planos para o futuro. Ignoramos ou negamos o presente e adiamos nossas conquistas para algum dia distante, quando conseguiremos tudo o que desejamos e seremos, finalmente, felizes.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ./Team member -->
            <!-- Team member -->
            <div class="col-xs-12 col-sm-6 col-md-4">
                <div class="image-flip" ontouchstart="this.classList.toggle('hover');">
                    <div class="mainflip">
                        <div class="frontside">
                            <div class="card">
                                <div class="card-body text-center">
                                    <p><img class="img-fluid" src="../assets/04.jpg" alt=""></p>
                                    <h4 class="card-title">12 regras para a vida</h4>
                                    <p class="card-text">Jordan B. Peterson</p>
                                    <a href="#" class="btn btn-warning btn-sm"><i class="fa fa-plus"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="backside">
                            <div class="card">
                                <div class="card-body text-center mt-4">
                                    <h4 class="card-title">12 regras para a vida</h4>
                                    <p class="card-text" style="text-align: justify;">Aclamado psic�logo cl�nico, Jordan Peterson tem influenciado a compreens�o moderna sobre a personalidade e, agora, se transformou em um dos pensadores p�blicos mais populares do mundo, com suas palestras sobre t�picos que variam da b�blia, �s rela��es amorosas e � mitologia, atraindo dezenas de milh�es de espectadores.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ./Team member -->
            <!-- Team member -->
            <div class="col-xs-12 col-sm-6 col-md-4">
                <div class="image-flip" ontouchstart="this.classList.toggle('hover');">
                    <div class="mainflip">
                        <div class="frontside">
                            <div class="card">
                                <div class="card-body text-center">
                                    <p><img class="img-fluid" src="../assets/05.jpg" alt=""></p>
                                    <h4 class="card-title">A realidade de Madhu</h4>
                                    <p class="card-text">Melissa Tobias</p>
                                    <a href="#" class="btn btn-warning btn-sm"><i class="fa fa-plus"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="backside">
                            <div class="card">
                                <div class="card-body text-center mt-4">
                                    <h4 class="card-title">A realidade de Madhu</h4>
                                    <p class="card-text" style="text-align: justify;">Neste surpreendente romance de fic��o cient�fica, Madhu � abduzida por uma nave intergal�ctica. A bordo da colossal nave alien�gena, far� amizade com uma bizarra h�brida, conhecer� um androide que vai abalar seu cora��o e aprender� li��es que mudar�o sua vida para sempre.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ./Team member -->
            <!-- Team member -->
            <div class="col-xs-12 col-sm-6 col-md-4">
                <div class="image-flip" ontouchstart="this.classList.toggle('hover');">
                    <div class="mainflip">
                        <div class="frontside">
                            <div class="card">
                                <div class="card-body text-center">
                                    <p><img class="img-fluid" src="../assets/06.jpg" alt=""></p>
                                    <h4 class="card-title">As armas da persuas�o</h4>
                                    <p class="card-text">Robert B. Cialdini</p>
                                    <a href="#" class="btn btn-warning btn-sm"><i class="fa fa-plus"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="backside">
                            <div class="card">
                                <div class="card-body text-center mt-4">
                                    <h4 class="card-title">As armas da persuas�o</h4>
                                    <p class="card-text" style="text-align: justify;">Depois de passar anos caindo na l�bia de vendedores, arrecadadores de doa��es e operadores de telemarketing, o psic�logo Robert B. Cialdini resolveu se dedicar ao estudo da persuas�o. Ele queria entender quais s�o os fatores que levam uma pessoa a dizer "sim" a um pedido e que t�cnicas exploram melhor esses fatores.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
             <div class="col-xs-12 col-sm-6 col-md-4">
                <div class="image-flip" ontouchstart="this.classList.toggle('hover');">
                    <div class="mainflip">
                        <div class="frontside">
                            <div class="card">
                                <div class="card-body text-center">
                                    <p><img class="img-fluid" src="../assets/07.jpg" alt=""></p>
                                    <h4 class="card-title">Arsene Lupin</h4>
                                    <p class="card-text">Maurice Leblanc</p>
                                    <a href="#" class="btn btn-warning btn-sm"><i class="fa fa-plus"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="backside">
                            <div class="card">
                                <div class="card-body text-center mt-4">
                                    <h4 class="card-title">Arsene Lupin</h4>
                                    <p class="card-text" style="text-align: justify;">Arsne Lupin, que conseguiu ser mais famoso que seu criador, nasceu por encomenda do editor Pierre Lafitte ao escritor Maurice Leblanc. Este livro re�ne as nove hist�rias A pris�o de Arsne Lupin, Arsne Lupin na pris�o, A fuga de Arsne Lupin, O viajante misterioso, O 'Colar da Rainha', O sete de copas, O cofre de Madame Imbert, A p�rola negra, Herlock Sholmes chega tarde demais inter-relacionadas, tais como foram publicadas na revista do editor Lafitte, Je sais tout.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
             <div class="col-xs-12 col-sm-6 col-md-4">
                <div class="image-flip" ontouchstart="this.classList.toggle('hover');">
                    <div class="mainflip">
                        <div class="frontside">
                            <div class="card">
                                <div class="card-body text-center">
                                    <p><img class="img-fluid" src="../assets/08.jpg" alt=""></p>
                                    <h4 class="card-title">Corte de n�voa e f�ria</h4>
                                    <p class="card-text">Sarah J. Mass</p>
                                    <a href="#" class="btn btn-warning btn-sm"><i class="fa fa-plus"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="backside">
                            <div class="card">
                                <div class="card-body text-center mt-4">
                                    <h4 class="card-title">Corte de n�voa e f�ria</h4>
                                    <p class="card-text" style="text-align: justify;">Corte de n�voa e f�ria � o esperado segundo volume da saga iniciada em Corte de espinhos e rosas, da mesma autora da s�rie Trono de vidro.Neste livro, seguimos a saga de Feyre Archeron, que morreu Sob a Montanha. Nas garras de Amarantha, a jovem humana que ansiava por amor e prote��o deixou de existir.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
             <div class="col-xs-12 col-sm-6 col-md-4">
                <div class="image-flip" ontouchstart="this.classList.toggle('hover');">
                    <div class="mainflip">
                        <div class="frontside">
                            <div class="card">
                                <div class="card-body text-center">
                                    <p><img class="img-fluid" src="../assets/09.jpg" alt=""></p>
                                    <h4 class="card-title">O m�dico e o monstro</h4>
                                    <p class="card-text">Robert Louis Steven</p>
                                    <a href="#" class="btn btn-warning btn-sm"><i class="fa fa-plus"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="backside">
                            <div class="card">
                                <div class="card-body text-center mt-4">
                                    <h4 class="card-title">O m�dico e o monstro</h4>
                                    <p class="card-text" style="text-align: justify;">Gabriel John Utterson � um advogado que investiga um caso estranho envolvendo Henry Jekyll e Edward Hyde, repentino benefici�rio do testamento de Henry. O advogado descobre acontecimentos que resultam na reclus�o repentina de Jekyll. O romance que envolve fic��o cient�fica, transtornos psicol�gicos e terror � um grande cl�ssico do g�nero.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ./Team member -->

        </div>
    </div>
</section>
   		<footer class="footer" id="home">
   			<div class="footer-left">
   				<img src="../assets/logo2.png"/>
   				<p id="text-legal">Instituto Federal de S�o Paulo<br/>
   				Camp�s Guarulhos<br/>
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
   	<!-- FIM HEADER -->
   
   </body>
</html>