package EJRepaso4;

import java.time.LocalDate;

public abstract class Fisico extends Libro {

	private Integer ancho;
	private Integer alto;
	private Integer peso;
	
	
	
	public Fisico(String titulo, String autor, LocalDate fechaEdicion, Integer paginas, Integer peso, Integer ancho, Integer alto) {
	super(titulo,autor,fechaEdicion,paginas);
	this.alto=alto;
	this.ancho=ancho;
	this.peso=peso;
	
	
	
	}
	
	
}
