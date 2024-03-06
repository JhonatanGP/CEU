import java.util.Scanner;

public class Ejercicio10 {

/*	En la clase ArrayUtils, crea un método llamado obtenerPalabra que reciba un array de cadenas y un
	número N por parámetros. Debe devolver la cadena que está en la posición N del array. Si N no es una
	posición válida del array, tendrá que devolver una cadena vacía. 	
*/	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scanner = new Scanner(System.in);

		System.out.println("Dime una frase");
		String cadena = scanner.nextLine();
		System.out.println("Dime un numero");
		Integer n = scanner.nextInt();

		String resultado = ArrayUtils.obtenerPalabra(cadena, n);
		System.out.println(resultado);

		scanner.close();
	}

}
