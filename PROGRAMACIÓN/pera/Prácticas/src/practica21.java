import java.util.Scanner;

public class practica21 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	
		Scanner scanner = new Scanner(System.in);
		System.out.println("Escribe un número para crear una tabla N x N");
		Integer n=scanner.nextInt();
	
		for(int i=0;i<n;i++){
			
			
			
			for(int x=0;x<i;x++){
				System.out.print(" - ");}
			
				System.out.print(" * ");
			
			
			for(int j=i+1; j<n; j++){
				System.out.print(" - ");}
			System.out.println();
			
		}
		
		
		scanner.close();
	
	
	
	
	
	
	
	
	
	
	}

}
