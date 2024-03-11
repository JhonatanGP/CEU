import java.util.Scanner;

public class practica12 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner scanner = new Scanner(System.in);
		
		System.out.println("Escribe un número para crear una tabla NxN");
		Integer n=scanner.nextInt();
		
		for(int x=0; x<n;x++){
			
			if(x==0){
				System.out.print(" __");
			}else {
				System.out.print("___");
			} 
		}
	
		System.out.println();
		
		for(int fila=0; fila< n; fila++){
			
			for(int columna=0;columna< n;columna++){
				
				System.out.print("|__");
				}
			
			System.out.print("|");
			System.out.println();
			}
	
		
		
		
		
		scanner.close();
		
	}

}
