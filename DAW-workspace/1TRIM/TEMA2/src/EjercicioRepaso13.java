import java.util.Scanner;

public class EjercicioRepaso13 {

	public static void main(String[] args) {
		Scanner scanner= new Scanner (System.in);
		String frase;
		String acumulador="";
		
		do {
			System.out.println("Dame una frase: ");
			frase=scanner.nextLine();
			
			if (!frase.equalsIgnoreCase("fin"))
				acumulador+=frase+" "; // o lo mismo    acumulador=acumulador+frase+" ";
			
		}while(!frase.equalsIgnoreCase("fin"));
		System.out.println("frase completa: " + acumulador);
		
		scanner.close();
		}
	}