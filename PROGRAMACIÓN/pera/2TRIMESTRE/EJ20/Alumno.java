package EJ20;

public class Alumno {
	
	private  String dni;
	private String nombre;
	private Integer edad;
	private Double nota;
	
	/**
	 * Construtor con el dni como parametro
	 * @param dni
	 */
	public Alumno(String d) {
		this.dni = d;		
	}	

	/**
	 * Obtiene el DNI del alumno
	 * @return el dni
	 */
	public String getDni() {
		return this.dni;
	}
	/**
	 * Actualiza el DNI del alumno
	 * @param dni
	 */
	public void setDni(String dni) {
		this.dni = dni;
	}
	
	/**
	 * Obtiene el nombre del alumno
	 * @return el nombre
	 */
	public String getNombre() {
		return this.nombre;
	}
	/**
	 * Actualiza el nombre del alumno
	 * @param nombre
	 */
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	/**
	 * Obtiene la edad del alumno
	 * @return edad
	 */
	public Integer getEdad() {
		return this.edad;
	}
	/**
	 * Actualiza la edad del alumno
	 * @param edad
	 */
	public void setEdad(Integer edad) {
		this.edad = edad;
	}
	/**
	 * Obtiene la nota del alumno
	 * @return nota
	 *
	 */
	public Double getNota() {
		return this.nota;
	}
	/**
	 * Actualiza la nota del alumno
	 * @param nota
	 */
	public void setNota(Double nota) {
		this.nota = nota;
	}
	
	/**
	 * Actualiza el valor de la nota a 5
	 */
	public void aprobar() {
		this.nota = 5.0;
	}
	
}

