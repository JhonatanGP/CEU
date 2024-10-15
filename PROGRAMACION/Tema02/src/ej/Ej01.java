package ej;

import java.util.Scanner;

public class Ej01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		System.out.println("¿Cuál es tu año de nacimiento?");
		Integer año = sc.nextInt();
		
		if (año >= 1883 && año <= 1900) {
			System.out.println("Perteneces a la Generación Perdida.");
		}
		
		else if (año >= 1991 && año <= 1927) {
			System.out.println("Perteneces a la Generación Grandiosa/2GM.");
		}
		
		else if (año >= 1928 && año <= 1945) {
			System.out.println("Perteneces a la Generación Silenciosa.");
		}
		else if (año >= 1946 && año <= 1964) {
			System.out.println("Perteneces a la Generación Baby Boomers.");
		}
		
		else if (año >= 1965 && año <= 1980) {
			System.out.println("Perteneces a la Generación X.");
		}
		else if (año >= 1981 && año <= 1996) {
			System.out.println("Perteneces a la Generación Y/Milenials.");
		}
		
		else if (año >= 1997 && año <= 2012) {
			System.out.println("Perteneces a la Generación Z/Zoomers.");
		}
		
		else if (año > 2012) {
			System.out.println("Perteneces a la Generación Alfa.");
		}
		
		else {
			System.out.println("No pertenece a ninguna.");
		}
	}

}
