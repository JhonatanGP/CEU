package Array;
import java.util.Scanner;
public class Ejercicio17 {
	public static void main(String[] args) {
		Scanner scanner= new Scanner (System.in);
		System.out.println("Dame una frase");
		String frase = scanner.nextLine();
		
		frase = frase.toLowerCase();
		String[]palabras= frase.split(" ");//nos devuelve un array
		for (int i=1; i<palabras.length; i++) {
			String primeraLetra = palabras[i].substring(0, 1);
			String sinPrimeraLetra = palabras[i].substring(1);
			String primeraLetraMayus = primeraLetra.toUpperCase();
			String resultadoFinal =primeraLetraMayus + sinPrimeraLetra;

			palabras[i] = resultadoFinal;
		}
			for (int i = 0; i<palabras.length; i++) {
				System.out.print(palabras[i]);			
		  }
		scanner.close();
	}
}