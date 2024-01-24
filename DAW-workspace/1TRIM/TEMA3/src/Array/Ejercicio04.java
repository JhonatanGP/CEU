package Array;
import java.util.Scanner;

public class Ejercicio04 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.println("Cuantos números quieres poner");
		int tamaño = scanner.nextInt();
				
		//creamos el array con ese tamaño
		int [] numeros = new int [tamaño];
		
		//recorremos el array y solicitamos un numero
		//AL usuario para meterlo en la posicion i
		for (int i = 0; i < numeros.length ;  i++) {
			System.out.println("Dame el numero ");
			int x = scanner.nextInt();
			numeros [i]= x;}
		System.out.println("Lista total al revés ");
			//recorrer el array para imprimirlo
			for (int i = numeros.length-1; i >= 0  ;  i--) {
				
				System.out.println(numeros[i]+ " ");
			}scanner.close();
		} 
}