import java.util.Scanner;

public class EjercicioRepaso12 {

	public static void main(String[] args) {
		
		Scanner scanner= new Scanner (System.in);
		System.out.println("Introduce un número por pantalla");
		Integer numero = scanner.nextInt();
		
		System.out.println("**** TABLERO DE AJEDREZ ****");
		
			int contador1 = 1;
			int contador2 = 0;
			int contador3 = 0;
			
			for (;contador1 !=numero; contador1++) {
				for(;contador3!=numero;contador3++) {
					System.out.print( "_");
				}
				contador2 = 0;
				for(;contador2!=numero;contador2++) {
					System.out.print("|" + "_");
				}
				System.out.print("|");
				System.out.println("");
	}

}
}
