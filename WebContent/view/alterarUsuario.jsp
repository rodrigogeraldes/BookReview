<%@page import="classes.Usuario"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.DBQuery"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
int id_usuario = Integer.parseInt(request.getParameter("editUser"));
String nome = request.getParameter("nome");
String email = request.getParameter("user");
int id_nivel_usuario = Integer.parseInt(request.getParameter("edit_radio"));


ResultSet usuario = new Usuario().select("id_usuario ="+id_usuario);
usuario.next();
String senha = usuario.getString("senha");
int ativo = usuario.getInt("ativo");

Usuario alterado = new Usuario(id_usuario, nome, email, senha, id_nivel_usuario, ativo);

alterado.save();

%>
  