package EJ36;

import java.util.ArrayList;
import java.util.List;

import java.util.ArrayList;
import java.util.List;

import java.util.ArrayList;
import java.util.List;

public class Curso {
	private Long identificador;
	private String descripcion;
	private List<Alumno> alumnos;
	private Integer numAlumnosMaximo;
	
	public Curso(Integer numAlumnos) {
		this.numAlumnosMaximo = numAlumnos;
		alumnos = new ArrayList<>();
	}
	
	public List<Alumno> getAlumnos() {
		return alumnos;
	}
	
	
	
	public void addAlumno(Alumno alumno){
		if (alumnos.size()<numAlumnosMaximo) {
			alumnos.add(alumno);
		}
		else {
			System.err.println("No hay sitio para ms alumnos");
		}
	
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

