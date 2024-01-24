package REPASO;
import java.util.Scanner;
public class Repaso04 {

	public static void main(String[] args) {
		Scanner scanner= new Scanner (System.in);
		Integer[] listaNotas = new Integer[] {7, 9, 8, 4, 0, 6, 3, 4, 1, 7, 3, 1, 9, 10};
		System.out.println("¿Qué nota estas buscando?");
		Integer nota = scanner.nextInt();
		
		int cont = 0;
		for(int i=0; i<listaNotas.length; i++) {
			if (listaNotas[i]>nota) {
				cont++;
			}	
		} 	System.out.println("Hay " + cont  + " notas mayores a la indicada." );
	scanner.close();
	}
}