package Array;
import java.util.Scanner;
public class Ejercicio22 {

	public static void main(String[] args) {
		System.out.println("Dame la palabra");
		Scanner scanner= new Scanner (System.in);
		String palabra=scanner.nextLine();
		String arrayLetras[]= palabra.split("");//
		
		for(String letra1 : arrayLetras);
		System.out.print(palabra + "\t");
	}
}