import java.util.Scanner;

public class práctica1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner scanner = new Scanner(System.in);
		System.out.println("Indique su nombre");

		String nombre = scanner.nextLine();
		
		System.out.println("Indique su fecha de nacimiento");
		
		Integer edad = scanner.nextInt();
		scanner.close();
		Integer resultadoEdad = - 2030 + edad ;
		
		
		System.out.println("Hola "+ nombre+ ", en el año 2030 tendrás "+ resultadoEdad);

		
		
		
		
		
		
		
		
	}

}
