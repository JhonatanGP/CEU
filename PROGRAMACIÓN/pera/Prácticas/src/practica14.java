import java.util.Scanner;

public class practica14 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub


		
		Scanner scanner = new Scanner(System.in);
		
		String contraseña="";
		
		Boolean bucle= true;
		do {
			System.out.println("Escriba una palabra de 8 caráteres");
			contraseña= scanner.nextLine();
		
			if(contraseña.length()>=8) {
			
			 contraseña= contraseña.replaceAll("a", "4");
			 contraseña= contraseña.replaceAll("e", "3");
			 contraseña= contraseña.replaceAll("i", "1");
			 contraseña= contraseña.replaceAll("o", "0");
			 contraseña= contraseña.replaceAll("t", "7");
			 break;
			 
			}else {
				System.out.println("Contraseña incorrecta");
			}
			
			
		}while(bucle==true);
		
		System.out.println("Su contraseña es: "+ contraseña);
		scanner.close();
		
	}

}
