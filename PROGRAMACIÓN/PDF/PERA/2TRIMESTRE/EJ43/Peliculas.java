package EJ43;

import java.util.ArrayList;
import java.util.List;

public class Peliculas {

	private Integer añoEstreno;
	private String titulo;
	List <actores>actores;
	guionistas guionista;
	directores director;
	
	public Peliculas() {
		actores=new ArrayList<>(); //IMP
	}
	
	//get y set
	public Integer getAñoEstreno() {
		return añoEstreno;
	}
	public void setAñoEstreno(Integer añoEstreno) {
		this.añoEstreno = añoEstreno;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public List<actores> getActores() {
		return actores;
	}
	public void setActores(List<actores> actores) {
		this.actores = actores;
	}
	public guionistas getGuionista() {
		return guionista;
	}
	public void setGuionista(guionistas guionista) {
		this.guionista = guionista;
	}
	public directores getDirector() {
		return director;
	}
	public void setDirector(directores director) {
		this.director = director;
	}
	
}