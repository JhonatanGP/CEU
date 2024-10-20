
/*
 * Crea un método llamado getMayMin que reciba una cadena por parámetro:
• Un número que podrá ser 1 o 2
• Una cadena
Tendrá que devolver la cadena recibida, quitando espacios en blanco del principio y 
del final. Luego, si el número recibido es 1, devolverá esa cadena en mayúsculas. Si
el número recibido es 2, devolverá esa cadena en minúsculas.
 */
import java.util.Scanner;

public class Ejercicio03 {

	public static String getMayMin(Integer num, String cadena) {
		String nuevo = "";
		if (num == 1) {
			nuevo = cadena.trim().toUpperCase();
		} else if (num == 2) {
			nuevo = cadena.trim().toLowerCase();
		}
		return nuevo;

	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scanner = new Scanner(System.in);
		System.out.println("Dime un numero (tiene que ser 1 o 2)");
		Integer numero = scanner.nextInt();
		System.out.println(getMayMin(numero, "hola    "));
	}
}