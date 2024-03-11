import java.util.Scanner;

public class práctica9 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		Scanner scanner = new Scanner(System.in);
		
		
		
		System.out.println("Escribe un mensaje que comience con hola y termine con hasta luego");
		String texto= scanner.nextLine();
		
					
		
		if (texto.startsWith("Hola") && texto.endsWith("adiós")) {
		
			int inicio = "Hola".length();
			int fin= "adiós".length();
			
			String mensaje = texto.substring(inicio,fin).trim();
			
			System.out.println("Lo he entendido, ¿Cómo estás?");
		}

		
				
		
	
			
		
		
		scanner.close();
		
		
		
		
		
		
	}

}
