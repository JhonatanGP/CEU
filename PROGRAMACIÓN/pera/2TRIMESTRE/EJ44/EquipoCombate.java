package EJ44;

import java.util.ArrayList;
import java.util.List;

public class EquipoCombate {

	private List<Personaje> tropa;
	private Integer totalPuntosVida;
	
	
	
	
	public 	EquipoCombate() {
		tropa=new ArrayList<>();
		totalPuntosVida=0;
	}
	
	public void añadirPersonaje(Personaje personaje) {
		if(tropa.size()<5 &&!tropa.contains(personaje)) {
			tropa.add(personaje);
			totalPuntosVida += personaje.getPuntosVida();
			}
	}
	
	
	public Integer getTotalPuntosVida() {
		return totalPuntosVida;
	}
	
	
//toString	
	@Override
	public String toString() {
		return "EquipoCombate [tropa=" + tropa + ", totalPuntosVida=" + totalPuntosVida + "]";
	}

	
}
