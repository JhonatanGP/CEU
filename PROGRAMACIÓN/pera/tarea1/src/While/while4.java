package While;

import java.util.Scanner;

public class while4 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int numero1;
		int numero2;
		
		Scanner scanner = new Scanner(System.in);
		do {
			
			System.out.println("Introduzca el primer número por pantalla");
			numero1= scanner.nextInt();
			
			System.out.println("Introduzca otro número");
			numero2= scanner.nextInt();
			
			
			if (numero1 == numero2)
			System.out.println("");
		}while (numero1!= numero2);
		System.out.println("HASTA LUEGO, los numeros " +numero1+" y "+numero2 +" son iguales");
		
		scanner.close();
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

	}

}
