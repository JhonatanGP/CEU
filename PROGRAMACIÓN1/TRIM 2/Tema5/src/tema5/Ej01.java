package tema5;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Ej01 {

	public static void main(String[] args) {	
	/*Crea un programa que solicite números enteros al usuario y los meta en una lista. Cuando indique el número -1, parará 
	de meter números. Al final, imprime la lista. Una vez que tengas el programa, ¿cómo podrías asegurarte de que el scanner
	se cierre siempre, aunque haya algún error que pare la ejecución?*/
		Scanner sc = new Scanner(System.in);
	try {
		List<Integer> numeros = new ArrayList<>();
		Integer numero = 0;
		
		do {
			System.out.println("Dame números");
			numero = sc.nextInt();
			if (!numero.equals(-1)) {
				numeros.add(numero);
			}
		}	
		
		while (!numero.equals(-1));
		System.out.println("Lista: " + numeros);
	}
		
		finally {
			sc.close();
			System.out.println("Scanner cerrado");
		}
	}
	
}


