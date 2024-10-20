package ejemplo;
/**
 * @author Jhonatan Guzmán
 * @version 1.0
 * @since 2024-05-04
 */
public class Persona {
	
	private String nombre;
	private Integer edad;
	
	/**Este método obtiene el obtiene el nombre
	 * @return String
	 */
	public String getNombre() {
		return nombre;
	}
	
	/**
	 * Este metodo asigna un nombre al objeto
	 * @param nombre
	 */
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	/**
	 * Este método obtiene el obtiene la edad
	 * @return Integer
	 */
	public Integer getEdad() {
		return edad;
	}
	
	/**
	 * Este método asigna la edad al objeto
	 * @param edad
	 */
	public void setEdad(Integer edad) {
		this.edad = edad;
	}	
	
}
