import java.util.Scanner;

public class practica17 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		Scanner scanner = new Scanner(System.in);
		
		
		int numero2=0;
		int numero1=1;
		
		
		System.out.println("Escribe un número superior a 2 y entero");
		Integer numero= scanner.nextInt();
		
	while(numero<=2) {
		System.out.println("El número no es correcto, escribe uno nuevo");
		numero= scanner.nextInt();
	}
	
	
		
		for(int i=0; i<numero;i++){
			
		if(i==numero-1) {
			System.out.print(numero2);
		}
		
		else {
			System.out.print(numero2+",");
		}
		
		numero2=numero1+numero2;
		
		numero1=numero2-numero1;
		
		
		}
		
		
		
		
		
		
		
		
		
			
		scanner.close();

	}

}
