package ejercicio42;

public class Jugador {
	private String nombre;
	private Integer dorsal;
	
	public Jugador(String nombre, Integer dorsal) {
		this.nombre = nombre;
		this.dorsal = dorsal;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Integer getDorsal() {
		return dorsal;
	}

	public void setDorsal(Integer dorsal) {
		this.dorsal = dorsal;
	}
	
	

}
