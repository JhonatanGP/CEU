package EJ30;

public class Curso {
	private Long identificador;
	private String descripcion;
	private Alumno[] alumnos;
	private Integer indiceAlumnos;
	
	public Curso(Integer numAlumnos) {
		alumnos = new Alumno[numAlumnos];
		indiceAlumnos = 0;
	}
	
	public Alumno[] getAlumnos() {
		return alumnos;
	}
	
	
	
	public void addAlumno(Alumno alumno){
		if (indiceAlumnos < alumnos.length) {
			alumnos[indiceAlumnos] = alumno;
			indiceAlumnos++;
		}
		else {
			System.err.println("No hay sitio para ms alumnos");
		}
		
//		for (int i = 0; i < alumnos.length; i++) {
//			if (alumnos[i] == null) {
//				alumnos[i] = alumno;
//				return;
//			}
//		}
//		System.err.println("No hay sitio para ms alumnos");		
		
	}
	public Long getIdentificador() {
		return identificador;
	}
	public void setIdentificador(Long identificador) {
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


