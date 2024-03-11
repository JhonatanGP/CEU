package Arrays;

import java.util.Scanner;

public class arrays8 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		Scanner scanner = new Scanner(System.in);

        System.out.println("¿Cuantos números vas a introducir por consola?");

        int tamaño = scanner.nextInt();

        int[] numeros = new int[tamaño];

        for (int i = 0; i <numeros.length ; i++){
            System.out.println("\nIntroduzca un número");
            Integer x= scanner.nextInt();
            
            numeros[i] = x;
        }

        scanner.close();

       

        for (int i = 0; i < numeros.length; i++){
            System.out.print(numeros[i]+ " ");   
        }
	
        System.out.println();
        for(int i=0, j=numeros.length-1;i<j;i++,j--){
        	Integer auxiliar=numeros[i];
        	numeros[i]= numeros[j];
        	numeros[j]= auxiliar;
        
        }
        for (int i=0; i<numeros.length;i++) {
        	System.out.print(numeros[i]+ " ");
        }
        System.out.println();
        
	}

}
		
		
	
	