package classes;

import java.sql.ResultSet;
import java.sql.SQLException;

import database.DBQuery;
import multitool.RandomCode;

public class Usuario {
	private int	   	id_usuario;
	private String 	nome;
	private String 	email;
	private String 	senha;
	private int 	id_nivel_usuario;
	private int 	ativo;
	
	
	private String tableName	= "usuario"; 
	private String fieldsName	= "id_usuario, nome, email, senha, id_nivel_usuario, ativo";  
	private String fieldKey		= "id_usuario";
	
	private DBQuery dbQuery = new DBQuery(tableName, fieldsName, fieldKey);
	
	
	public Usuario( int id_usuario, String nome, String email, String senha, int id_nivel_usuario, int ativo) {
		this.setId_usuario(id_usuario);
		this.setNome(nome);
		this.setEmail(email);
		this.setSenha(senha);
		this.setId_nivel_usuario(id_nivel_usuario);
		this.setAtivo(ativo);
		
	}

	
	public void searchUser() {
        try {
            ResultSet resultSet = this.select(" id_usuario = " + this.getId_usuario());
            while (resultSet.next()) {
                this.setNome(resultSet.getString("nome"));
                this.setEmail(resultSet.getString("email"));
                this.setSenha(resultSet.getString("senha"));
                this.setId_nivel_usuario(resultSet.getString("id_nivel_usuario"));
                this.setAtivo(resultSet.getInt("ativo"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
	
	public Usuario( int idUsuario) {
        this.setId_usuario(idUsuario);
    }
	
	public Usuario(){
        this.setId_usuario(0);
    }
	
	public Usuario( String email, String senha, String nome) {
		this.setId_usuario(0);
		this.setNome(nome);
		this.setEmail(email);
		this.setSenha(senha);
		this.setId_nivel_usuario(0);
		
	}
	
	public Usuario( String email, String nome) {
		this.setId_usuario(0);
		this.setNome(nome);
		this.setEmail(email);
		this.setId_nivel_usuario(0);
		
	}
	
	public Usuario( String email) {
		this.setId_usuario(0);
		this.setEmail(email);
	}
	
	public String toString() {
		return(
				this.getId_usuario() + ""+" | "+
				this.getNome()+" | "+
				this.getEmail()+"|"+
				"********"+" | "+
				this.getId_nivel_usuario() +"|"+
				this.getAtivo() + ""+"|" 
				
		);
	}
	
	private String[] toArray() {
		
		String[] temp =  new String[] {
				this.getId_usuario() + "",
				this.getNome(),
				this.getEmail(),
				this.getSenha() + "",
				this.getId_nivel_usuario() + "",
				this.getAtivo() + ""
				
		};
		return(temp);
	}
	
	public void save() {
		if( this.getId_usuario() > 0 ) {
			this.dbQuery.update(this.toArray());
		}else {
			this.dbQuery.insert(this.toArray());
		}
	}
	
	public void delete() {
		if( this.getId_usuario() > 0 ) {
			this.dbQuery.delete(this.toArray());
		}
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
	
	public String newPassword() {
		
		if (this.getEmail() != "" && this.getEmail()!= null) {
			if ( this.getId_usuario() > 0 ) {
				try {
					ResultSet resultset = this.select(" email ='"+this.getEmail()+"'");
					boolean existe = resultset.next();
					if ( existe ) {
						this.setSenha(  new RandomCode().generate(32) );
						this.save();
						return( this.getSenha());
					}
					resultset.getInt("idUsuario");
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
			} else {
				this.setSenha(  new RandomCode().generate(32));
				return(  this.getSenha() );
			}
		} else {
			// Sem email não deve gerar senha
		}
		return this.getSenha(); 
	}

	public boolean checkLogin() {
		
		int id = 0;
		try {
			ResultSet resultSet = this.select(" email='"+ this.getEmail()+ "' AND senha = '"+this.getSenha()+"'");
			while (resultSet.next()) {
				System.out.println( "\n"+resultSet.getString("nome"));
				id =  resultSet.getInt("id_usuario");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		this.setId_usuario(id);
		return(id > 0);	
	}
	
	public int getId_usuario() {
		return id_usuario;
	}

	public void setId_usuario(int id_usuario) {
		this.id_usuario = id_usuario;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public int getId_nivel_usuario() {
		return id_nivel_usuario;
	}

	public void setId_nivel_usuario(int id_nivel_usuario) {
		this.id_nivel_usuario = id_nivel_usuario;
	}
	
	public void setId_nivel_usuario(String id_nivel_usuario) {
		this.id_nivel_usuario = ((id_nivel_usuario == "") ? 0 : Integer.parseInt(id_nivel_usuario));
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public int getAtivo() {
		return ativo;
	}

	public void setAtivo(int ativo) {
		this.ativo = ativo;
	}
	
}