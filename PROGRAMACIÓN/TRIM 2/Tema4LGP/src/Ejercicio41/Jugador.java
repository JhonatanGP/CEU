package Ejercicio41;

import java.util.Objects;

public class Jugador {
	private String nombre;
	private Integer dorsal;

	// constructores
	public Jugador(String nombre, Integer dorsal) {
		this.nombre = nombre;
		this.dorsal = dorsal;
	}

	// metodos
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

	// equals
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Jugador other = (Jugador) obj;
		return Objects.equals(dorsal, other.dorsal);
	}

	// toString
	@Override
	public String toString() {
		return "'" + dorsal + " - " + nombre + "'";
	}

}
