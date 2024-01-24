import java.util.Scanner;

public class Ejercicio11 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		String email;
		Boolean emailValido=true;
		
		do {
			System.out.println("Dame un email:");
			email = scanner.nextLine();
			
			Integer indiceArroba = email.indexOf("@");
			String subcadena = email.substring(indiceArroba + 1);
			
			if (!email.contains("@")) {
				emailValido = false;
			}
			else if (subcadena.contains("@"))
			
		}

	}

}
