package repaso;

import java.util.Scanner;

public class repaso8 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub


		Scanner scanner = new Scanner(System.in);
		System.out.println("Escribe tu HTML");
		String html = scanner.nextLine();
		
		
		String[] mensaje= html.split("");
		
		for(int i=1;i<mensaje.length;i++){
			
			if(mensaje[i-1].equals(">") && !mensaje[i].equals("<")) {
	
			do{
				System.out.print(mensaje[i]);
				i++;
			}while(!mensaje[i].equals("<"));
				
					
				
			}
			
			
		}
		
		
		
		
		scanner.close();
	}

}
