package deberes;

import java.util.Scanner;

public class boolean1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	
		Scanner scanner = new Scanner(System.in);
	
		System.out.println("Indique su nota en programación");
	
		Integer nota = scanner.nextInt();
	
		scanner.close();
		if (nota < 5) {
		System.out.println("SUSPENSO");
	}
	
		else if (5<= nota &&  nota<7) {
	
			System.out.println("APROBADO");
	
	
	}
	
	
		else if (nota>=7 && nota<=8) {
		
			System.out.println("NOTABLE");	
	
	
	}
	
	
		else {
		System.out.println("SOBRESALIENTE");
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	}
	
	

}
