import java.util.Scanner;

public class practica24 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		
		Scanner scanner = new Scanner(System.in);
		System.out.println("Escribe un número superior a 0");
		Integer x = scanner.nextInt();
		Integer suma=0; 
	
		for(int i=1; i<=x;i++){
			int resto=i %2;
			if(resto!= 0) {
			suma = suma+i;
			}
		
		}
			
		System.out.println("La suma de los números impares som: "+ suma);
		
		scanner.close();
	}

}
