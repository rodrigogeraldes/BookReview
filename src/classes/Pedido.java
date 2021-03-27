package classes;
import java.sql.ResultSet;
import database.DBQuery;


public class Pedido {
	
	private String tableName	= ""; 
	private String fieldsName	= "";  
	private String fieldKey		= "";
	private DBQuery	dbQuery = new DBQuery(tableName, fieldsName, fieldKey);
	
	private int	id_pedido;
	private String usuario;
	private String livro;
	private String data;
	

	

	public Pedido(int id_pedido, String usuario, String livrvo, String data){
		this.tableName  = "livraria.pedido";
		this.fieldsName = "id_pedido, usuario, livro, data";
		this.fieldKey   = "id_pedido";
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.fieldKey);
	
		this.setId_pedido(id_pedido);
		this.setUsuario(usuario);
		this.setLivro(livro);
		this.setData(data);
	}
	
	public String toString(){
		return (
			this.getId_pedido() +", "+
			this.getUsuario() +", "+
			this.getLivro() +", "+
			this.getData() +", "
		);
	 }

	public String[] toArray(){
		return (
			new String[] { 
				""+this.getId_pedido(),
				""+this.getUsuario(),
				""+this.getLivro(),
				""+this.getData()
			}
		);
	 }

		public void save() {
		  if ((this.getId_pedido() > 0 )){
		       this.dbQuery.insert(this.toArray());
          }else{
		      this.dbQuery.update(this.toArray());
          }
        }
	
        public void delete() {
            if (this.getId_pedido() > 0 ){
                this.dbQuery.delete( this.toArray() );
            }
        }
	    
        public ResultSet selectAll() {
    		ResultSet resultset = this.dbQuery.select("");
    		return(resultset);
    	}

		public int getId_pedido() {
			return id_pedido;
		}

		public void setId_pedido(int id_pedido) {
			this.id_pedido = id_pedido;
		}

		public String getUsuario() {
			return usuario;
		}

		public void setUsuario(String usuario) {
			this.usuario = usuario;
		}

		public String getLivro() {
			return livro;
		}

		public void setLivro(String livro) {
			this.livro = livro;
		}

		public String getData() {
			return data;
		}

		public void setData(String data) {
			this.data = data;
		} 
}