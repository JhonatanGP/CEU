package map;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;


public class Mapa {

	public static void main(String[] args) {

		Map<Integer,String> map = new HashMap<Integer,String>();
		
		map.put(1, "Casillas");
		map.put(3, "Piqué");
		map.put(7, "Villa");
		map.put(11, "Capdevila");
		map.put(16, "Busquets");
		map.put(18, "Pedrito");
		map.put(15, "Ramos");
		map.put(5, "Puyol");
		map.put(14, "Xabi Alonso");
		map.put(6, "Iniesta");

		Set<Integer> keys = map.keySet();
		for (Integer key : keys) {
			System.out.println("Clave: " + key + "--> valor: " + map.get(key));
		}
		
		System.out.println("Nº elementos: " + map.size());
		System.out.println("¿Esta vacio? " + map.isEmpty());
		System.out.println("Elemento con clave 6: " + map.get(6));
		System.out.println("Borramos 18: " + map.remove(18));
		System.out.println("Obtenemos 18: " + map.get(18));
		System.out.println("Existe 18: " + map.containsKey(18));
		map.clear();



	}

}
