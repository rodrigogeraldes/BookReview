<%@page import="classes.Usuario"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    	int id_user = Integer.parseInt(request.getParameter("botao_delete") );
    	Usuario usuario = new Usuario(id_user);
    	usuario.delete(); 
    %>
