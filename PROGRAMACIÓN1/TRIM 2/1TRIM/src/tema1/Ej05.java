package tema1;

import java.util.Scanner;

public class Ej05 {

	public static void main(String[] args) {
//1. Mostrar un mensaje preguntando “¿Cuánto te gustaría ganar al año?”
	System.out.println("¿Cuánto te gustaría ganar al año?");	
//2. Esperar a que el usuario conteste indicando una cantidad
	Scanner sc = new Scanner(System.in);	
	Integer cant = sc.nextInt();
	Integer fin = cant/12;
//3. Mostrar un nuevo mensaje “Tu sueldo mensual sería de xx euros” (calcular xx dividiendo lo indicado por el usuario entre 12)
	System.out.println("Tu sueldo mensual sería de " + fin + " euros.");
	
	sc.close();
	}

}
