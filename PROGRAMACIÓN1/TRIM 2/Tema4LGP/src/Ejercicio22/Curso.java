package Ejercicio22;

public class Curso {
	private Integer identificador;
	private String descripcion;

	// contructores
	//Aclaracion: si es vacío, no tengo pq crearlo, pues hay uno vacío que no se ve. 
	public Curso() {
		Integer identificador = 0;
		String descripcion = "";
	}

	// metodos
	public Integer getIdentificador() {
		return identificador;
	}

	public void setIdentificador(Integer identificador) {
		this.identificador = identificador;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	@Override
	public String toString() {
		return "Curso [identificador=" + identificador + ", descripcion=" + descripcion + "]";
	}

}
