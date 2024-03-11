package deberes;

import java.util.Scanner;

public class tarea1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("Indique tu fecha de nacimiento");
	
		Integer nacimiento = scanner.nextInt();
		
		scanner.close();
		
		if (nacimiento<=1900) {
			
			System.out.println("Eres de la Generación perdida");
		}
		
		else if (nacimiento>=1901 && nacimiento<=1927) {
			System.out.println("Eres de la generación grandiosa");
		}
		
		else if (nacimiento>=1928 && nacimiento<=1945) {
			System.out.println("Eres de la generación silenciosa");
		}
		
		
		else if (nacimiento>=1946 && nacimiento<=1964) {
			System.out.println("Eres de la generación Boomers");
		}
		
		
		else if (nacimiento>=1965 && nacimiento<=1980) {
			System.out.println("Eres de la generación X");
		}
		
		else if (nacimiento>=1981 && nacimiento<=1996) {
			System.out.println("Eres de la generación Millennials");
		}
		
		else if (nacimiento>=1997 && nacimiento<=2013) {
			System.out.println("Eres de la generación Zoomers");
		}
		
		else {
			System.out.println("Eres de la generación Alfa");
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
