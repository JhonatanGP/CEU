import java.util.Scanner;

public class practica2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
	
		
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("Indique un nombre de una ciudad");
		String nombre1= scanner.nextLine();
		
		System.out.println("Indique un segundo nombre de una ciudad");
		String nombre2= scanner.nextLine();
		
		System.out.println("Indique por último un nombre de una ciudad");
		String nombre3= scanner.nextLine();
		scanner.close();
		
		Integer longitud1= nombre1.length();
		Integer longitud2= nombre2.length();
		Integer longitud3= nombre3.length();
		
		
		if(longitud1<longitud2) {
			if(longitud2<longitud3) {
				System.out.println(nombre1);
				System.out.println(nombre2);
				System.out.println(nombre3);
			}
		}
		
		if(longitud1<longitud3) {
			if(longitud3<longitud2) {
				System.out.println(nombre1);
				System.out.println(nombre3);
				System.out.println(nombre2);
			}
		}
		
		if(longitud2<longitud1) {
			if(longitud1<longitud3) {
				System.out.println(nombre2);
				System.out.println(nombre1);
				System.out.println(nombre3);
			}
		}
		
		if(longitud2<longitud3) {
			if(longitud3<longitud1) {
				System.out.println(nombre2);
				System.out.println(nombre3);
				System.out.println(nombre1);
			}
		}
		
		if(longitud3<longitud2) {
			if(longitud2<longitud1) {
				System.out.println(nombre3);
				System.out.println(nombre2);
				System.out.println(nombre1);
			}
		}
		
		if(longitud3<longitud1) {
			if(longitud1<longitud2) {
				System.out.println(nombre3);
				System.out.println(nombre1);
				System.out.println(nombre2);
			}
		}
		
		
		
		
		

	}

}
