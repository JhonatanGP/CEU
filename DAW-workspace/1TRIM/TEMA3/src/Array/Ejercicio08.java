package Array;
import java.util.Scanner;
public class Ejercicio08 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.println("¿Cuántos números quieres poner?");
		int tamaño = scanner.nextInt();
		//creamos el array con ese tamaño
		int [] numeros = new int [tamaño];
		//recorremos el array y solicitamos un numero
		//al usuario para meterlo en la posicion i
		for (int i = 0; i < numeros.length ;  i++) {
			System.out.println("Dime el número que quieres guardar en la posición " + i);
			int x = scanner.nextInt();
			numeros [i]= x;
		} System.out.println("Lista total al revés ");
			//recorrer el array para imprimirlo
			for (int i = tamaño-1; i != -1 ;  i--) {
				System.out.print(numeros[i]+ " ");
			}
		 scanner.close();
	}
}