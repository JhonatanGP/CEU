import java.util.Scanner;

public class Ejercicio09 {

	public static void main(String[] args) {

		Scanner scanner = new Scanner(System.in);
		System.out.println("Dime tu nombre completo");
		String nombreCompleto = scanner.nextLine();
		 
		//Calculamos en que posision estan los espacios
		Integer indexPrimerEspacio = nombreCompleto.indexOf(" ");
		Integer indexSegundoEspacio = nombreCompleto.lastIndexOf(" ");
		
		//Vamos a dividir la cadena 
		String nombre = nombreCompleto.substring(0, indexPrimerEspacio);
		//Ahora dividimos desde el primer espacio hasta el segundo
		String apellido1 = nombreCompleto.substring(indexPrimerEspacio+1, indexSegundoEspacio);
		//Ahora dividimos desde el segundo espacio hasta el final
		String apellido2 = nombreCompleto.substring(indexSegundoEspacio+1);
		//Imprimimos
		System.out.println("Nombre: " + nombre);
		System.out.println("Primer apellido: " + apellido1);
		System.out.println("Segundo apellido: " + apellido2);
		scanner.close();
		
	}

}
