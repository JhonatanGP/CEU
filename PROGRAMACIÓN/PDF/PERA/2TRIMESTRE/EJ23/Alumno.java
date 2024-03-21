package EJ23;

public class Alumno extends Persona {
	private String dni;
	private Double nota;
	private Curso curso;

	public Alumno(String dni) {
		super();
		this.dni = dni;		
	}
	public String getDni() {
		return dni;
	}
	public void setDni(String dni) {
		this.dni = dni;
	}
	
	public Double getNota() {
		return nota;
	}
	public void setNota(Double nota) {
		this.nota = nota;
	}
	
	public Curso getCurso() {
		return curso;
	}
	public void setCurso(Curso curso) {
		this.curso = curso;
	}
	public void aprobar() {
		nota = 5.0;
	}
	
}

