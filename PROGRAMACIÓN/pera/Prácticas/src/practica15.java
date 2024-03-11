import java.util.Random;
import java.util.Scanner;

public class practica15 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub


		Scanner scanner = new Scanner(System.in);
		
		
		
		Boolean bucle= true;
		do {
			System.out.println("Adivina un número del 1 al 10");
			Integer número= scanner.nextInt();
			Random r1=new Random();
			int valordado= r1.nextInt(10);
			
			if(valordado==número) {
			
			
			 break;
			 
			}else {
				System.out.println("Vuelve a intentarlo");
			}
			
			
		}while(bucle==true);
		
		System.out.println("Has acertado el número");
		scanner.close();
		
		
		
		
		
		
		
		
	}

}
