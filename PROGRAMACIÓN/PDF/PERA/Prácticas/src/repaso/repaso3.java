package repaso;

import java.util.Scanner;

public class repaso3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner scanner = new Scanner(System.in);
		Integer[] listaNotas = new Integer[] {7, 9, 8, 4, 0, 6, 3, 4, 1, 7, 3, 1, 9, 10}; 
		Integer existe=0;
		
		System.out.println("¿Que nota buscas?");
		Integer nota = scanner.nextInt();
		
		for (int i=0;i<listaNotas.length;i++) {
			if(listaNotas[i]==nota){
				
			System.out.println("La nota se encuentra en la posición: "+ i);
			existe=1;
			}
		
		}
		if (existe==0 ){
			System.out.println("La nota no existe");
		}

		scanner.close();
	}

}
