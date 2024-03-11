package EJ44;

public class Jugador {
	private String nombre;
	private EquipoCombate equipo;

	//get y set
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public EquipoCombate getEquipo() {
		return equipo;
	}
	public void setEquipo(EquipoCombate equipo) {
		this.equipo = equipo;
	}
	
	
//toString
	
@Override
	public String toString() {
		return "Jugador [nombre=" + nombre + ", equipo=" + equipo + "]";
	}
	
	
	
	
	
	
	
}
