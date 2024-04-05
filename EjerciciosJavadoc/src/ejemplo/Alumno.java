package ejemplo;
/**
 * @author Jhonatan Guzmán
 * @version 1.0
 * @since 2024-05-04
 */
public class Alumno extends Persona {
	
	private String dni;
	private Double nota;
/**
 * 
 * @param dni
 */
	public Alumno(String dni) {
		super();
		this.dni = dni;		
	}
	/**
	 * Este método obtiene el obtiene el dni del alumno
	 * @return dni
	 */
	public String getDni() {
		return dni;
	}
	/**
	 * Este método asigna el dni al alumno
	 * @return dni
	 */
	public void setDni(String dni) {
		this.dni = dni;
	}
	/**
	 * Este método obtiene el obtiene el nota del alumno
	 * @param nota
	 */
	public Double getNota() {
		return nota;
	}
	/**
	 * Este método obtiene la nota del alumno
	 * @param nota
	 */
	public void setNota(Double nota) {
		this.nota = nota;
	}
	/**
	 * 
	 */
	public void aprobar() {
		nota = 5.0;
	}	
}
