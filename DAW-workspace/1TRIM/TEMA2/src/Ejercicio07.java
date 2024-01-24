import java.util.Scanner;

public class Ejercicio07 {

	public static void main(String[] args) {

		Scanner scanner = new Scanner(System.in);
		
		int num1;
		int num2;
		
		do {
			System.out.println("Introduzca un primer número: ");
			num1 = scanner.nextInt(); 
			System.out.println("Introduce otro número: ");
			num2 = scanner.nextInt();
			
			if(num1!=num2)// 
				System.out.println("Los números " + num1 + " y " + num2 + " son distintos");
			
		}while(num1!=num2); 
		
		System.out.println("HASTA LUEGO! Los números " + num1 + " y " + num2 + " 	" + "son iguales.");
		scanner.close();
		}
	}
		

