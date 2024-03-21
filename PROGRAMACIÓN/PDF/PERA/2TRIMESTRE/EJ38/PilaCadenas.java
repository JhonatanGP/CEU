package EJ38;

import java.util.ArrayList;
import java.util.List;

public class PilaCadenas{
	 private List<String> pila;
	
	public PilaCadenas() {
		pila =new ArrayList<>();
	}
	
	public void añadirCadena(String cadena) {
		pila.add(cadena);
	}
	
    // Sacar el último de la lista.
	public String sacarCadena(){
		if(pila.isEmpty()) {
			return null;
		}													
		String cadena= pila.get(pila.size()-1);
		pila.remove(pila.size()-1);
		return cadena;
	}
	
	public Integer getTamaño(){
		return pila.size();
	}
	
	@Override
	public String toString(){
		return pila.toString();
	}
	
}
