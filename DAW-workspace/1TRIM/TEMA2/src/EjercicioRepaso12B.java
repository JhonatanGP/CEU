import java.util.Scanner;

public class EjercicioRepaso12B {

	public static void main(String[] args) {
		Scanner scanner= new Scanner (System.in);
		System.out.println("Introduce la dimensión del tablero NxN");
		Integer dimension = scanner.nextInt();
		
		for (int x = 0; x < dimension;  x++) {
			if (x == 0) {
				System.out.print(" __");
			}
			else {
				System.out.print("___");
			}
			
		}
		System.out.println();
		for (int fila = 0; fila < dimension; fila++) {
			for (int columna = 0; columna < dimension; columna++) {
				System.out.print("|__");
			}
			System.out.println("|");
		}
		scanner.close();

	}

}
