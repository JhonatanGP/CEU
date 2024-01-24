import java.util.Scanner;

public class Ejercicio2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scanner = new Scanner(System.in);
		System.out.println("Dime tu nombre");
		String nombre = scanner.nextLine();
		System.out.println("Bienvenido  " + nombre + "." + " \n¿De dónde eres?" );
        String lugar = scanner.nextLine();
        System.out.println("¿Qué tal se vive en" + " " + lugar + "?" );
        String respuesta = scanner.nextLine();
        System.out.println("Me alegro!");
        scanner.close();
        
       
	}

}
