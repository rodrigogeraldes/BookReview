<%@page import="java.sql.ResultSet"%>
<%@page import="database.DBQuery"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

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
String id_usuario = "";

int id = userLogin;
ResultSet resultSet = dbQuery.select("id_usuario = '" + id + "'");
while (resultSet.next()) {
	email = resultSet.getString("email");
	nome = resultSet.getString("nome");
	senha = resultSet.getString("senha");
	id_nivel_usuario = resultSet.getString("id_nivel_usuario");
	ativo = resultSet.getString("ativo");
}

id_usuario = ""+userLogin;
nome = request.getParameter("nome");
senha = request.getParameter("senha");
System.out.print("\n\n\n\n"+nome+senha+"\n\n\n\n");

dbQuery.update(new String[]{id_usuario, nome, email, senha, "1", "1"});

%>
