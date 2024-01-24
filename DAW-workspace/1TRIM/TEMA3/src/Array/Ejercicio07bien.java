package Array;

import java.util.Scanner;

public class Ejercicio07bien {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.println("¿Cuantos números quieres poner");
		Integer tamaño = scanner.nextInt();
				
		//creamos el array con ese tamaño
		Integer[] numeros = new Integer [tamaño];
		
		//recorremos el array y solicitamos un numero
		//AL usuario para meterlo en la posicion i
		for (int i = 0; i < numeros.length ;  i++) {
			System.out.println("Dime el número que quieres guardar en la posición " + i);
			int x = scanner.nextInt();
			numeros [i]= x;
		} System.out.println("Lista ordenada ");
			//recorrer el array para imprimirlo
			for (int i = 0; i < numeros.length ;  i++) {
				System.out.print(numeros[i]+ " ");
			}	
			System.out.println();

			//ahora hacemos otro array con los datos inverso
			Integer[] numerosInvertido = new Integer [numeros.length];
			for (int i = 0; i < numerosInvertido.length; i++) {
				numerosInvertido[i] = numeros[numeros.length-1-i]; 
			} System.out.println("Lista invertida ");
			//puedo usar el mismo método para imprimir dif arrrays
			for (int i = 0; i < numerosInvertido.length; i++) {
				System.out.print(numerosInvertido[i] + " ");
			}
		 scanner.close();
	}
}