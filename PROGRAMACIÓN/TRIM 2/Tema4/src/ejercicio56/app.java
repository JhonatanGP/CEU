package ejercicio56;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Scanner;
import java.util.Set;


public class app {

	public static void main(String[] args) {
		
		Scanner scanner = new Scanner(System.in);
		
		Map<Integer, Integer> numeros = new HashMap<>();
		
		Integer numero;// = -1;
		Integer contadorTotal = 0;
	
		do {
			
			System.out.println("Dame un número por favor");
			numero = scanner.nextInt();
			
			if(!numero.equals(0)){
				
				if (numeros.containsKey(numero)) {
					Integer cantidadActual = numeros.get(numero);
					numeros.put(numero, cantidadActual + 1);
				}
				else {
					numeros.put(numero, 1);
				}
				contadorTotal ++;				
			}	
		}while(!numero.equals(0));		
		
		scanner.close();
		
		imprimirNumeros(numeros, contadorTotal);
	}

	private static void imprimirNumeros(Map<Integer, Integer> numeros, Integer contadorTotal) {
		System.out.println("Total números indicados " + contadorTotal);
		System.out.println("Distribución: ");
		Set<Entry<Integer, Integer>> entrys = numeros.entrySet();
		for (Entry<Integer, Integer> entry : entrys) {
			String terminacion = "veces";
			if (entry.getValue().equals(1)) {
				terminacion = "vez";
			}
			System.out.println("\t> Número " + entry.getKey() + ": " + entry.getValue() + " " + terminacion);
		}

		
	}

}