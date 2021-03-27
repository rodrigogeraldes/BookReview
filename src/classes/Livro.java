package classes;
import java.sql.ResultSet;
import database.DBQuery;


public class Livro {
	
	private String tableName	= ""; 
	private String fieldsName	= "";  
	private String fieldKey		= "";
	private DBQuery	dbQuery = new DBQuery(tableName, fieldsName, fieldKey);
	
	private int	id_livro;
	private String titulo;
	private String autor;
	private int alugado;
	private String img;
	

	public Livro(int id_livro, String titulo, String autor, int alugado, String img){
		this.tableName  = "livraria.livro";
		this.fieldsName = "id_livro, titulo, autor, alugado, img";
		this.fieldKey   = "id_livro";
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.fieldKey);
	
		this.setId_livro(id_livro);
		this.setTitulo(titulo);
		this.setAutor(autor);
		this.setAlugado(alugado);
		this.setImg(img);
	}
	
	public String toString(){
		return (
			this.getId_livro() +", "+
			this.getTitulo() +", "+
			this.getAutor() +", "+
			this.getAlugado() +", "+
			this.getImg() +", "
		);
	 }

	public String[] toArray(){
		return (
			new String[] { 
				""+this.getId_livro(),
				""+this.getTitulo(),
				""+this.getAutor(),
				""+this.getAlugado(),
				""+this.getImg()
			}
		);
	 }

	public void save() {
		  if ((this.getId_livro() > 0 )){
		       this.dbQuery.update(this.toArray());
          }else{
		      this.dbQuery.insert(this.toArray());
          }
        }
	
        public void delete() {
            if (this.getId_livro() > 0 ){
                this.dbQuery.delete( this.toArray() );
            }
        }
	    
        public ResultSet selectAll() {
    		ResultSet resultset = this.dbQuery.select("");
    		return(resultset);
    	}

		public int getId_livro() {
			return id_livro;
		}

		public void setId_livro(int id_livro) {
			this.id_livro = id_livro;
		}

		public String getTitulo() {
			return titulo;
		}

		public void setTitulo(String titulo) {
			this.titulo = titulo;
		}

		public String getAutor() {
			return autor;
		}

		public void setAutor(String autor) {
			this.autor = autor;
		}

		public int getAlugado() {
			return alugado;
		}

		public void setAlugado(int alugado) {
			this.alugado = alugado;
		}

		public String getImg() {
			return img;
		}

		public void setImg(String img) {
			this.img = img;
		}
        
        
}