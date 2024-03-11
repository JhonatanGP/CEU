import java.util.Scanner;

public class practica20 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		Scanner scanner = new Scanner(System.in);
		
		
		for(int i=0;i<5;i++){
			
			
			
			for(int x=0;x<i;x++){
				System.out.print(" - ");}
			
				System.out.print(" * ");
			
			
			for(int j=i+1; j<5; j++){
				System.out.print(" - ");}
			System.out.println();
			
		}
	
		
		
		scanner.close();	
	
	
	
	}

}
