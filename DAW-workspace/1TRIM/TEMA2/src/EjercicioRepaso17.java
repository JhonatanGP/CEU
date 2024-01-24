import java.util.Scanner;

public class EjercicioRepaso17 {

	public static void main(String[] args) {
		Scanner scanner= new Scanner (System.in);
		int numeroSerie = 0;
		int anterior = 0;
		int ultimo = 1;
		int nuevoValor;
		
		do {
			System.out.println("Dame un numero mayor a 2");
			numeroSerie = scanner.nextInt();
		}
		while(numeroSerie <= 2);
			System.out.print("La serie de Fibonacci del número " + numeroSerie + " es: ");
			System.out.print(anterior + "," + ultimo);
			
		for (int serie = 2; serie < numeroSerie; serie++)
		{
			nuevoValor = anterior + ultimo;
			anterior = ultimo;
			ultimo = nuevoValor;
			System.out.print( ", " + nuevoValor);

		}
		scanner.close();
	}
}