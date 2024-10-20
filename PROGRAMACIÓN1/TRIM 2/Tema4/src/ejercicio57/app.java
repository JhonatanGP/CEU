package ejercicio57;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Scanner;
import java.util.Set;
import java.util.ArrayList;



public class app {

	public static void main(String[] args) {
		Map<String, List<String>> palabras = new HashMap<>();
		Scanner scanner = new Scanner(System.in);
	
		String palabra;

		do {
			
			System.out.println("Dame un número por favor");
			palabra = scanner.nextLine();
			
			if(palabra.equals(0)){
				
				if (palabras.containsKey(palabra)) {
					
				}
				else {
					palabras.add;
				}
			}	
		}while(!palabra.equals(0));		
		
		scanner.close();
		
	}

}
