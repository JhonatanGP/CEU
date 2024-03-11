package Arrays;

import java.util.Scanner;

public class arrays15 {
	
		private static final String PUNTO = ".";
		private static final String BARRAS = "://";
		
			
		public static void main(String[] args) {
			
			
			// Pedimos nombre completo
			Scanner scanner = new Scanner(System.in);
			System.out.println("Dame la URL");
			String url = scanner.nextLine();
		
					
			int indiceProtocolo= url.indexOf(BARRAS);  // guarda el indice donde comienza ://
			
			int indicePPunto= url.indexOf(PUNTO);  // Guarda el indice del primer punto
			
			int indiceUPunto= url.lastIndexOf(PUNTO); //Guarda el indice del segundo punto
					
			if(indiceProtocolo!= -1 && indicePPunto != -1 && indiceUPunto!=indicePPunto)  //Y si solo hay un punto?
			{
				// http://www.google.com
				//CARACTERES ESPECIALES CON SPLIT: (     )     [     ]     {     \      ?     *     +     .      ^     $	 |
				
				/* CUIDADO CON LOS CARACTERES ESPECIALES 
				 * split(".") significa cualquier caracter, por lo que para que identifique un punto, hay que poner \.
				 */
				
				String[] array1 = url.split("://");
				
				
				String parte2 = array1[1]; // el resto de la cadena a partir de ://
				String[] array2 = parte2.split("\\.");
				
				System.out.println("Protocolo: " + array1[0] + "://");
				System.out.println();
				System.out.println("Recorremos con for:");
				for (int i = 0; i < array2.length; i++) {
					System.out.println(array2[i]);
				}
				
				System.out.println();
				System.out.println("Recorremos con foreach:");
				for (String parte : array2) {
					System.out.println(parte);
				}

			}
			else {		
				System.out.println("La cadena no cumple el formato correcto");
			}
			
			
			
			scanner.close();
		}
	}

