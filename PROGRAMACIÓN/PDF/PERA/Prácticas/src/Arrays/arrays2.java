package Arrays;

import java.util.Scanner;

public class arrays2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Integer[] cuadrados= new Integer[6];
		Scanner scanner = new Scanner(System.in);
		System.out.println("Por favor, introduzca un número");
		Integer numero=scanner.nextInt();
		
		for(int i=0; i< cuadrados.length; i++) {
			cuadrados[i] = numero*numero;
			numero++;
		}
		for(int i=0; i<cuadrados.length; i++) {
			System.out.println(cuadrados[i]+ " ");
		}
		scanner.close();
	}

}
