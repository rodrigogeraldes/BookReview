<%@page import="mail.SendMail"%>
<%@page import="multitool.RandomCode"%>
<%@page import="classes.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String saida = "{ \"success\": true }";

	String email = request.getParameter("email");
	String nome = request.getParameter("nome");
	int id_nivel_usuario = 1;
	String senha = new RandomCode().generate(10);
	
	// Caso algum dos campos inseridos esteja vazio é retornado uma variável indicando erro
	if(email.isEmpty()){
		saida = "{ \"success\": false }";
	}else{
	
		// por onde eu vou mandar esse email
		String smtpHost 	= "smtp.gmail.com"; 
		String smtpPort 	= "587"; 
		String username 	= "geraldesaux@gmail.com";
		String password 	= "pwecleber";
		String auth     	= "tls";  
		SendMail sendMail 	=  new SendMail( smtpHost,  smtpPort,  username,  password,  auth );
		
		// a mensagem do email e pra quem vou enviar
		String mailFrom 	= "geraldesaux@gmail.com"; 
	 	String mailTo 		= email; 
	 	String mailSubject 	= "Obrigado por se cadastrar!"; 
	 	String mailBody 	= "Olá! Seu cadastro foi realizado com sucesso! \nSeguem seus dados: \n\nUsuário: " + email + "\nSenha: " + senha + " \nPara realizar alterações de dados, realize login em nossa página!"; 
		sendMail.send( mailFrom, mailTo, mailSubject, mailBody );
		
		// A criação do usuário é feita e salva no banco apenas com email e cpf
		Usuario user = new Usuario(0, nome, email, senha, 1, 1);
		
		user.save();
	}
	
	out.write(saida);
%>