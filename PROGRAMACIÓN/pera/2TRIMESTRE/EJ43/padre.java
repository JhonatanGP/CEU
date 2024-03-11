package EJ43;

public abstract class padre{

	protected static final int SUELDO_ACTOR = 100000;
	protected static final int SUELDO_DIRECTOR=200000;
	protected static final int SUELDO_GUIONISTA=50000;
	

	private String nombre;
	private int añoNacimiento;
	private String nacionalidad;
	
//get y set 	
	public String getNombre(){
		return nombre;
	}
	public void setNombre(String nombre){
		this.nombre = nombre;
	}
	public int getAñoNacimiento(){
		return añoNacimiento;
	}
	public void setAñoNacimiento(int añoNacimiento){
		this.añoNacimiento = añoNacimiento;
	}
	public String getNacionalidad(){
		return nacionalidad;
	}
	public void setNacionalidad(String nacionalidad){
		this.nacionalidad = nacionalidad;
	}
	//Método get sueldo
		public abstract Integer getSueldo();
			
	//toString
		@Override
		public String toString() {
			return "Trabajador [nombre=" + nombre + ", añoNacimiento=" + añoNacimiento + ", nacionalidad=" + nacionalidad + "]";
		}
		
}  
