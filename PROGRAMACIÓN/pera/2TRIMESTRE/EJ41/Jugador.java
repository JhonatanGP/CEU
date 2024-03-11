package EJ41;

import java.util.Objects;

public class Jugador {
	private String nombre;
	private Integer dorsal;
	
	//Constructor dos atributos por parámetro.
	public Jugador (String nombre, Integer dorsal){
		this.nombre= nombre;
		this.dorsal= dorsal;
	}
	
	//get y set.
	public String getNombre(){
		return nombre;
	}

	public void setNombre(String nombre){
		this.nombre = nombre;
	}

	public Integer getDorsal(){
		return dorsal;
	}

	public void setDorsal(Integer dorsal){
		this.dorsal = dorsal;
	}

	
	//Equals que compare dos dorsales.
	@Override
	public int hashCode(){
		return Objects.hash(dorsal);
	}
	@Override
	public boolean equals(Object obj){
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Jugador other = (Jugador) obj;
		return Objects.equals(dorsal, other.dorsal);
	}
		
	//Método String que imprima: "9-Blas".	
	
	@Override
	public String toString() {
		return dorsal + " - " + nombre;
	}
}
