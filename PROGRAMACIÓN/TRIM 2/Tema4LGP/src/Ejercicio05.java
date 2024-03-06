/*Crea un método llamado sumar que reciba dos números enteros y devuelva
 * el resultado de la suma.
 */
import java.util.Scanner;

public class Ejercicio05 {

	public static Integer sumar(Integer num1, Integer num2) {
		Integer suma = num1 + num2;
		return suma;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scanner = new Scanner(System.in);
		System.out.println("Dime un numero");
		Integer num1 = scanner.nextInt();

		System.out.println("Dime otro numero");
		Integer num2 = scanner.nextInt();

		System.out.println("La suma es: " + sumar(num1, num2));
		
		scanner.close();
	}

}