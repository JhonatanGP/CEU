package Arrays;

import java.util.Scanner;

public class arrays18 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		

		Scanner scanner = new Scanner(System.in);
		
        System.out.println("Escribe un número y te diré si es capicúa");
        String numero = scanner.nextLine();
	
        String[] array= numero.split("");
        Boolean capicua=true;
       
        	for(int ini=0,fin=array.length-1;ini<fin;ini++,fin--){
        		String array1=array[ini];
        		String array2=array[fin];
        		System.out.println("ini: "+ array1);
        		System.out.println("fin: "+ array2);
        		if (!array1.equals(array2)){
        			
        			capicua=false;
        			break;
        		}
        	}

		
		scanner.close();
		
	}

}
