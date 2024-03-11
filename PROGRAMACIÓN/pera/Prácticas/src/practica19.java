import java.util.Scanner;

public class practica19 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		Scanner scanner = new Scanner(System.in);
		Integer opcion=0;
		
		Double pesetas=0.0;
		
		do {
			System.out.println("\n"+"1 - Pasar de Pesetas a Euros"+"\n"+"2 - Pasar de Euros a Pesetas"+ "\n"+ "3 - Salir"+"\n");
			opcion= scanner.nextInt();	
			if (opcion==1) {
				System.out.println("Introduzca la cantidad de Pesetas que deseas convertir");
				Integer opcion1= scanner.nextInt();	
				pesetas= 0.0060;
				Double Resultado1= opcion1*pesetas;
				
				System.out.println("Resultado de Pesetas a Euros= " + Resultado1);
			}
			
			else if (opcion==2) {
				System.out.println("Introduzca la cantidad de Euros que deseas convertir");
				Integer opcion2= scanner.nextInt();	
				pesetas= 166.386;
				Double Resultado2= opcion2*pesetas;
				System.out.println("Resultado de Euros a Pesetas= " + Resultado2);
			}
			
			
			else if (opcion==3){
				System.out.println("Cerrando programa");
				break;
			}
	
			
		}while(opcion!=3);
		
		
		
		
		
		
		
		scanner.close();
		
		
		
	}

}
