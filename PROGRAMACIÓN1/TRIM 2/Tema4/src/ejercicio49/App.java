package ejercicio49;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;
import java.util.Set;

public class App {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		Set<String> cadenas = new HashSet<>();
		
		// Pedimos 5 palabras y las aadimos en la lista
		for (int i = 0; i < 5; i++) {
			System.out.println("Dime una palabra");
			String cadena = scanner.nextLine();
			cadenas.add(cadena);
		}
		// Imprimimos la lista. si se puede porque cadenas es string. si fuera otro habria que poner tostring
		System.out.println(cadenas);
		
		// 1. Poner todo en maysculas
		Set<String> auxiliar = new HashSet<>();
		for(String cadena : cadenas) {
			auxiliar.add(cadena.toUpperCase());
		}
		cadenas = auxiliar;
		System.out.println(cadenas);
		
		// 2. Comprobar si hay alguna cadena vaca
		if (cadenas.contains("")) {
			System.out.println("Hay alguna cadena vaca en la lista");
		}
		
		// 3. Borrar todas las cadenas con longitud menor a 6
		// como vamos a borrar mientras recorremos, tenemos que usar un iterator
		Iterator<String> it = cadenas.iterator();
		while (it.hasNext()) {
			if (it.next().length()<6) {
				it.remove();
			}
		}
		System.out.println(cadenas);		
		
		scanner.close();		
	}	
}
