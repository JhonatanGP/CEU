package Array;
import java.util.Scanner;
public class Ejercicio16 {
	public static void main(String[] args) {
		//pedimos nombre completo
		Scanner scanner= new Scanner (System.in);
		System.out.println("Dame la palabra");
		String palabra=scanner.nextLine();
		String[]letras= palabra.split("");//nos devuelve un array
		
		for (int i= letras.length-1; i>=0;i--) {
			System.out.print(letras[i]);
		}
		scanner.close();
	}
}