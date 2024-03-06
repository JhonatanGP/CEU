package Ejercicio34Set;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Scanner;
import java.util.Set;

public class App {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);

		// creamos lista
		Set<String> setCadenas = new HashSet<>();

		// pedimos las cadenas
		for (int i = 1; i <= 5; i++) {

			System.out.println("Dime una cadena caracteres");
			String cadena = scanner.nextLine();

			// añadimos al set
			setCadenas.add(cadena);
		}
		System.out.println(setCadenas);

		// 1. Pon todas las cadenas de la lista en mayúsculas

		// primero creamos un set auxiliar
		Set<String> listaMay = new HashSet<>();

		// recorremos
		for (String setRecorrido : setCadenas) {
			String total = setRecorrido.toUpperCase();
			listaMay.add(total);
		}
		setCadenas = listaMay;
		System.out.println(setCadenas);

		// 2. Comprueba si la lista contiene alguna cadena vacía.
		if (setCadenas.contains("")) {
			System.out.println("Hay alguna cadena vacia");
		}

		// 3. Borra todas las cadenas de la lista que tengan una longitud menor a 6
		// caracteres.
		Iterator<String> it = setCadenas.iterator();
		while (it.hasNext()) {
			if (it.next().length() < 6) {
				it.remove();
			}
		}
		System.out.println(setCadenas);

		scanner.close();
	}

}
