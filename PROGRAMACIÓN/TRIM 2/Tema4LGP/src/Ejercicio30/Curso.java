package Ejercicio30;

public class Curso extends Alumno{
	private Integer identificador;
	private String descripcion;
	private Alumno [] alumnos;

	// contructores
	//Aclaracion: si es vacio, no tengo pq crearlo, pues hay uno vacío que no se ve. 
	public Curso(Integer numAlumnos) {
		//Integer identificador = 0;
		//String descripcion = "";
		alumnos = new Alumno [numAlumnos];
		
	}

	// metodos
	public void addAlumno(Alumno alumno) {
		for(int i =0; i<alumnos.length; i++) {
			if(alumnos[i]==null) {
				alumnos[i]= alumno;
				return;
			}
			
		}
		System.err.println("No hay sitio para mas alumnos");
	}
	
	
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
	public Alumno[] getAlumnos() {
		return alumnos;
	}

	@Override
	public String toString() {
		return "Curso [identificador=" + identificador + ", descripcion=" + descripcion + "]";
	}
	

}
