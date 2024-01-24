import java.util.Scanner;

public class EjercicioRepaso14 {

	public static void main(String[] args) {
		Scanner scanner= new Scanner (System.in);
		String contraseña = "";
		
		do {
			System.out.println("Escribe una contraseña de al menos 8 caracteres");
			contraseña=scanner.nextLine();
							
			
		}while((contraseña.length()) <8);
		contraseña=contraseña.replaceAll("a","4").replaceAll("e","3").replaceAll("i","1").replaceAll("o","0").replaceAll("t","7");
		System.out.println("contraseña generada: " + contraseña);
		
		scanner.close();
	}

}