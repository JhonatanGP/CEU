package Array;
import java.util.Scanner;
public class Ejercicio10 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		Integer tamaño=0;
		do {
			System.out.println("Indica el tamaño del array");
			tamaño = scanner.nextInt();
		}while (tamaño < 2);
		//declaramos el array y las 2 primeras casillas
		Integer[] fibonacci = new Integer[tamaño];
		fibonacci[0] = 0;
		fibonacci[1] = 1;
//recorremos el array y llenamos el resto de posiciones
		for (int i = 2; i < fibonacci.length; i++) {
			fibonacci[i] = fibonacci[i-1] + fibonacci[i-2];
		}
//imprimimos el array
		for (int i = 0; i < fibonacci.length; i++) {
			System.out.println(fibonacci[i]+ " ");
		}
		scanner.close();
	}
}