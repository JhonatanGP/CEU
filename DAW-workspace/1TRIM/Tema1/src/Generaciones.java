import java.util.Scanner;

public class Generaciones {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("AVERIGUE SU GENERACIÓN CON SU AÑO DE NACIMIENTO");
		int numero = scanner.nextInt();
		
		if ((numero < 1901)) {
			System.out.println("GENERACIÓN PERDIDA");}
		
		else if ((numero >= 1901) && (numero <= 1927)) {
			System.out.println("GEN.GRANDIOSA/2GM");
		}
		else if ((numero >= 1928) && (numero <= 1945)) {
			System.out.println("GEN.SILENCIOSA");
		}
		else if ((numero >= 1946) && (numero <= 1964)) {
			System.out.println("BABY BOOMERS");
		}
		else if ((numero >= 1965) && (numero <= 1980)) {
			System.out.println("GENERACIÓN X");
		}
		else if ((numero >= 1981) && (numero <= 1996)) {
			System.out.println(" MILLENIALS/GEN.Y");
		}
		else if ((numero >= 1997) && (numero <= 2012)) {
			System.out.println("ZOOMERS/GEN.Z");
		}
		else if ((numero >= 2013) && (numero <= 2020)) {
			System.out.println("GEN.ALFA");
		}
		else {
			System.out.println("ALFA");
			
		}
		scanner.close();
	}

}
