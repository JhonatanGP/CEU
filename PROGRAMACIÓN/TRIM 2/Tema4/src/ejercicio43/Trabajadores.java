package ejercicio43;

public abstract class Trabajadores {
	protected static final Integer GUIONISTAS = 50000; // ES PROTECTED PORQUE QUEREMOS QEU LO VEA LA CLASE HIJA Y NO EL RESTO
	protected static final Integer DIRECTORES = 200000;
	protected static final Integer ACTORES = 100000;
	//Atributos creados
	private String nombre;
	private Integer anoNacimineto;
	private String nacionalidad;
	
	public Trabajadores() {
		
	}
	
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public Integer getAnoNacimineto() {
		return anoNacimineto;
	}
	public void setAnoNacimineto(Integer anoNacimineto) {
		this.anoNacimineto = anoNacimineto;
	}
	public String getNacionalidad() {
		return nacionalidad;
	}
	public void setNacionalidad(String nacionalidad) {
		this.nacionalidad = nacionalidad;
	}
	
	public abstract Integer getSueldo();

}
