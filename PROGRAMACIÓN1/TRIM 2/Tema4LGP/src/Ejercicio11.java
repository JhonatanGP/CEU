import java.util.Scanner;

public class Ejercicio11 {

	/*En la clase ArrayUtils, crea un método llamado buscarPalabra que reciba un array de cadenas y una
	palabra por parámetros. Debe devolver un entero indicando la posición donde se encuentra esa palabra
	dentro del array. Si no existe la palabra en el array, devolverá -1.
	*/
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scanner = new Scanner(System.in);

		System.out.println("Dime una frase");
		String cadena = scanner.nextLine();
		System.out.println("Dime un palabra");
		String palabra = scanner.nextLine();

		Integer resultado = ArrayUtils.buscarPalabra(cadena, palabra);
		System.out.println(resultado);

		scanner.close();
	}

}