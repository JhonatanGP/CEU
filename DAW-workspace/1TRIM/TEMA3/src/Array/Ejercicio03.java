package Array;
import java.util.Scanner;

public class Ejercicio03 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.println("Cuantos números quieres poner");
		int tamaño = scanner.nextInt();
				
		//creamos el array con ese tamaño
		int [] numeros = new int [tamaño];
		
		//recorremos el array y solicitamos un numero
		//AL usuario para meterlo en la posicion i
		for (int i = 0; i < numeros.length ;  i++) {
			System.out.println("Dime el número que quieres guardar");
			int x = scanner.nextInt();
			numeros [i]= x;
		} System.out.println("Lista total ");
			//recorrer el array para imprimirlo
			for (int i = 0; i < numeros.length ;  i++) {
				System.out.println(numeros[i]+ " ");
			}
		 scanner.close();
	}
}