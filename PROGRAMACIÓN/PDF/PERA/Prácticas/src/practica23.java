import java.util.Random;
import java.util.Scanner;

public class practica23 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		
		Scanner scanner = new Scanner(System.in);
	
		System.out.println("Ingrese cuántas veces desea lanzar el dado");
		Integer n=scanner.nextInt();
		
		for(int i=1;i<n;i++) {
	
		Random random = new Random();
		Integer aleatorio= random.nextInt(1,7);
		
		System.out.println("Lanzamiento dado "+ i+ "= "+ aleatorio);
		
		}
		
		

		
		
	
		
		
		
		scanner.close();
	}

}
