package switchCase;

import java.util.Scanner;

public class switchCase1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("Dime un número de 1 al 12");
		Integer meses= scanner.nextInt();
		
		
		
		switch(meses) {
		case 1:
			System.out.println("Se encuentra en Enero");
			
			break;
			
		case 2:
			System.out.println("Se encuentra en Febrero");
			break;
			
		case 3:
			System.out.println("Se encuentra en Marzo");
			break;
			
		case 4:
			System.out.println("Se encuentra en Abril");
			
			break;
			
		case 5:
			System.out.println("Se encuentra en Mayo");
			break;
			
		case 6:
			System.out.println("Se encuentra en Junio");
			break;
			
		case 7:
			System.out.println("Se encuentra en Julio");
			break;
			
		case 8:
			System.out.println("Se encuentra en Agosto");
			break;
			
		case 9:
			System.out.println("Se encuentra en Septiembre");
			break;
		case 10:
			System.out.println("Se encuentra en Octubre");
			
			break;
		case 11:
			System.out.println("Se encuentra en Noviembre");
			break;
		case 12:
			System.out.println("Se encuentra en Diciembre");
		default:
			System.out.println("No existe ese mes");
			
			
		}
		scanner.close();
			
		
			
			
			
			
			
			
			
		}
		
		
		

	}

