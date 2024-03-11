import java.util.Scanner;

public class practica11 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		Integer opcion=0;
		Scanner scanner = new Scanner(System.in);
		
		
		System.out.println("Indica un número");
		Integer numero= scanner.nextInt();
		System.out.println("Indica un segundo número");
		Integer numero2= scanner.nextInt();
		
		
		
		
		System.out.println("\n"+"*** MENÚ ***"+"\n"+"1. Sumar"+ "\n"+ "2. Restar"+"\n"+"3. Multiplicar"+"\n"+"4. Dividir"+"\n"+"0. Salir"+"\n");
		opcion= scanner.nextInt();	
				
				
		do {
			if (opcion==1) {
				System.out.println("Resultado= " + (numero + numero2));
			}
			
			else if (opcion==2) {
				System.out.println("Resultado= " + (numero - numero2));
			}
			
			else if (opcion==3) {
				System.out.println("Resultado= " + (numero * numero2));
			}
			
			else if (opcion==4) {
				System.out.println("Resultado= " +( numero / numero2));
			}
			
			else if (opcion==0){
				System.out.println("Cerrando programa");
				break;
			}
	
			
		}while(opcion==0);
		
		scanner.close();
		
	}

}
