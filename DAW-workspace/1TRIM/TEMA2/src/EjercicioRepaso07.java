import java.util.Scanner;

public class EjercicioRepaso07 {

	public static void main(String[] args) {
		Scanner scanner= new Scanner (System.in);
		Integer  multiplo;
		
		do {
			System.out.println("Indica el numero multiplicador ");
			 multiplo  = scanner.nextInt();
			
			if (multiplo <=0 || multiplo >10) {
				System.out.println("El multiplo indicado tiene que ser mayor que cero y menor o igual que diez");
			}
			else if (multiplo !=0) {
				Integer suma = 0;
				
				for (int i = 1; i<=10; i++) {
					Integer numero  = i*multiplo;
					suma = suma + numero;
					
					if (i == 10) {
						System.out.print(numero + " = ");
					}
					else {
				System.out.print(numero + " + ");
					}
				}
				System.out.println(suma);
			}
		 
			
		}
		
		while(multiplo != 0);
		scanner.close();

	}
	
} 