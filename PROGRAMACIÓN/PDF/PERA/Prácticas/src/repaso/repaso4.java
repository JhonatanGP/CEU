package repaso;

import java.util.Scanner;

public class repaso4 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scanner = new Scanner(System.in);
		Integer[] listaNotas = new Integer[] {7, 9, 8, 4, 0, 6, 3, 4, 1, 7, 3, 1, 9, 10};
		Integer resultado=0;
		
		
		
		System.out.println("¿Qué notas buscas?");
		Integer nota=scanner.nextInt();
		
		
		for(int i =0;i<listaNotas.length;i++) {
			if (listaNotas[i]>=nota){
			resultado++;
			
			
			}
		}System.out.println("Hay "+ resultado+ " notas mayores a la indicada");
		
		
		
		
		scanner.close();
	}

}
