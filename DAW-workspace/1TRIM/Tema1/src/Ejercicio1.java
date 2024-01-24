import java.util.Scanner;
public class Ejercicio1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scanner = new Scanner(System.in);
		System.out.println("Dime tu nombre");
		String nombre = scanner.nextLine();
		System.out.println("Ahora dime tus appelidos");
		String apellidos = scanner.nextLine();
		System.out.println("De acuerdo, tu nombre completo es " + nombre +" "+ apellidos );
		scanner.close();
		
	}

}
