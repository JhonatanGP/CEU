package Array;
import java.util.Scanner;
public class Ejercicio18 {

	public static void main(String[] args) {
		Scanner scanner= new Scanner (System.in);
		System.out.println("Dame un número");
		String num = scanner.nextLine();
		
		String[]digitos= num.split("");//nos devuelve un array
		Boolean capicua = true;
		
		for (int ini=0, fin=digitos.length-1; ini<fin; ini++,fin--) {
			System.out.println("ini:" + digitos[ini]);
			System.out.println("fin:" +digitos[fin]);
			if (!digitos[ini].equals(digitos[fin])) {
				capicua = false;
				System.out.println("No es capicúa");
				break;
			}
		}
		System.out.println();
		if(capicua) {
		System.out.println("Es capicúa");
		}
			scanner.close();		
	}
}