package EJ25;

import java.util.Objects;

public class Alumno extends Profesor {
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
	
	@Override
	public String toString() {
		return "Alumno [dni=" + dni + ", nota=" + nota + ", nombre=" + getNombre()
				+ ", edad=" + getEdad() + ", curso=" + curso + "]";
	}
	
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Alumno other = (Alumno) obj;
		return Objects.equals(dni, other.dni);
	}
	
	
	
	
	
}

