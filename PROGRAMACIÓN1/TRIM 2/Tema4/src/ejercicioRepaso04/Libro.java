package ejercicioRepaso04;

import java.time.LocalDate;

public class Libro {
	
	private String titulo;
	private String autor;
	private LocalDate fechaEdicion;
	private Integer paginas;
	
	//Creo el constructor por defecto
	public Libro (String titulo, String autor, LocalDate fechaEdicion, Integer paginas) {
		this.titulo = titulo;
		this.autor = autor;
		this.fechaEdicion = fechaEdicion;
		this.paginas = paginas;
		
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

	public LocalDate getFechaEdicion() {
		return fechaEdicion;
	}

	public void setFechaEdicion(LocalDate fechaEdicion) {
		this.fechaEdicion = fechaEdicion;
	}

	public Integer getPaginas() {
		return paginas;
	}

	public void setPaginas(Integer paginas) {
		this.paginas = paginas;
	}
	
	
	

}
