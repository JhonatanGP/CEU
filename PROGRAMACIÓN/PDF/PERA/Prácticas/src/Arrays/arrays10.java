package Arrays;

import java.util.Scanner;

public class arrays10 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub


		Scanner scanner = new Scanner(System.in);
		int tamaño;
		Integer numero1=0;
		Integer numero2=1;
		
	
		do {
		System.out.println("¿Cuantos números vas a introducir?");

        tamaño = scanner.nextInt();
        int[] numeros = new int[tamaño];
		
        for(int i=0; i<numeros.length;i++){
        	
        	if(i==tamaño-1){
    			System.out.print(numero2);
    		}
    		
    		else {
    			System.out.print(numero2+",");
    		}
        	
        	//fibonacci;
        	numero2=numero1+numero2;
    		
    		numero1=numero2-numero1;
    
        }
	
		}while(tamaño<2);  
        
		scanner.close();
	}

}
