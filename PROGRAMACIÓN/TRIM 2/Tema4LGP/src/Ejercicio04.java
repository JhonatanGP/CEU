/*Repite el ejercicio anterior, pero reutilizando (llamando a) los métodos creados
 * en el Ejercicio 1 y 2
 */
import java.util.Scanner;

public class Ejercicio04 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("Dime un numero (tiene que ser 1 o 2)");
		Integer numero = scanner.nextInt();
		scanner.nextLine();
		System.out.println("Dime una palabra");
		String nuevo = scanner.nextLine();
		
		if (numero == 1) {
			String resultado = Ejercicio01.getMayusculas(nuevo);
			System.out.println(resultado);
		} else if (numero == 2) {
			String resultado = Ejercicio02.getMinusculas(nuevo);
			System.out.println(resultado);
		}
		else {
			System.out.println("El numero no es valido");
		}
		scanner.close();
	}

}
