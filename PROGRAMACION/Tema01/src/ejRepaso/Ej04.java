package ejRepaso;

import java.util.Scanner;

public class Ej04 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc= new Scanner(System.in);
		System.out.println("¿Cuál es tu número favorito?");
		Float n = sc.nextFloat();
		
		sc.nextLine();
		
		System.out.println("¿Cuál es tu ciudad favorita?");
		String c = sc.nextLine();
		
		System.out.println("Tu número favorito es " + n + " y tu ciudad favorita es " + c + ".");
		
		sc.close();
	}

}
