package classes;

import java.sql.ResultSet;

import database.DBQuery;

public class Nivel{
	
	
	private int	   	id_nivel_usuario;
	private String 	nivel_usuario;

	private String tableName	= "nivel"; 
	private String fieldsName	= "id_nivel_usuario, nivel_usuario";  
	private String fieldKey		= "id_nivel_usuario";
	
	private DBQuery dbQuery = new DBQuery(tableName, fieldsName, fieldKey);
	
	public Nivel( int id_nivel_usuario, String nivel_usuario) {
		this.setId_nivel_usuario(id_nivel_usuario);
		this.setNivel_usuario(nivel_usuario);		
	}
	
	public Nivel(){
        this.setId_nivel_usuario(0);
    }
	
	public ResultSet selectAll() {
		ResultSet resultset = this.dbQuery.select("");
		return(resultset);
	}
	
	public ResultSet selectBy( String field, String value ) {
		ResultSet resultset = this.dbQuery.select( " "+field+"='"+value+"'");
		return(resultset);
	}
	
	public ResultSet select( String where ) {
		ResultSet resultset = this.dbQuery.select(where);
		return(resultset);
	}
	
	public int getId_nivel_usuario() {
		return id_nivel_usuario;
	}

	public void setId_nivel_usuario(int id_usuario) {
		this.id_nivel_usuario = id_usuario;
	}

	public String getNivel_usuario() {
		return nivel_usuario;
	}

	public void setNivel_usuario(String email) {
		this.nivel_usuario = email;
	}

}
