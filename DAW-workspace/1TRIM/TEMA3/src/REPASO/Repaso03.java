package REPASO;
import java.util.Scanner;
public class Repaso03 {
	public static void main(String[] args) {
		Scanner scanner= new Scanner (System.in);
		Integer[] listaNotas = new Integer[] {7, 9, 8, 4, 0, 6, 3, 4, 1, 7, 3, 1, 9, 10};
		System.out.println("¿Qué nota estas buscando?");
		Integer nota = scanner.nextInt();
		scanner.close();
		//buscamos la nota
		int posicion=0;
		boolean encontrada=false;
		for(int i=0; i<listaNotas.length; i++) {
			if (listaNotas[i]==nota) {
				posicion=i;
				encontrada=true;
				break;
			}
		}
		  if (encontrada)
			  System.out.println("La nota buscada existe y está en la posición " + posicion);
		  else 
			  System.out.println("La nota buscada no existe");
	}
}