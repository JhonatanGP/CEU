import java.util.Scanner;

public class EjercicioRepaso19 {

	public static void main(String[] args) {
		
		Scanner scanner= new Scanner (System.in);
		int numero;
		int cantidad = 0;
		
		do {
			System.out.println("**** Conversor de euros a peseta y viceversa ****\n\n  1 - Pasar de Pesetas a Euros.\n\n  2 - Pasar de Euros a Pesetas.\n\n  3 - Salir.");
			numero = scanner.nextInt();
			switch (numero) {
				case 1: 
					System.out.println("1 - Pasar de Pesetas a Euros.\n    Escriba la cantidad: ");
					cantidad = scanner.nextInt();
					System.out.println(cantidad + " pesetas son " + (cantidad/166) + " euros.\n");
					break;
				case 2: 
					System.out.println("2 - Pasar de Euros a Pesetas.\n    Escriba la cantidad:  ");
					cantidad = scanner.nextInt();
					System.out.println(cantidad + " euros son " + (cantidad*166) + " pesetas.\n");
					break;
			}
			
		}while (numero !=3);
		System.out.println("Fin");
		
		scanner.close();
	}

}
