package Arrays;

import java.util.Scanner;

public class arrays5 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner scanner = new Scanner(System.in);

        	System.out.println("¿Cuantos números vas a introducir por consola?");

        int tamaño = scanner.nextInt();

        int [] numero = new int[tamaño];

        for (int i = 0; i <numero.length ; i++){
        			System.out.println("Introduzca un número");
            int x =scanner.nextInt();
            
            numero[i]=x;
           
        }
    
        for (int i = numero.length -1; i >=0; i--){
            		System.out.println(numero[i]);
            
        }
				Integer maximo= numero[0];
        		Integer minimo = numero[0];
        		Integer posMaximo =0;
        		Integer posMinimo =0;
        		Integer suma= 0;
        		
        		for(int i=0; i<numero.length;i++){
        			System.out.print(numero[i]+ " ");
        			System.out.println();
        			
        			if (numero[i]> maximo){
        				maximo= numero[i];
        				posMaximo =i;
        				
        			}
        			else if (numero[i]< minimo){
        				minimo= numero[i];
        				posMinimo=i;
        			}
        			
        				suma = suma + numero[i];
        			
        	}
        		Integer media = suma/numero.length;
        		
        			System.out.println("Máximo: "+ maximo+ " en posición "+ posMaximo);
        			System.out.println("Mínimo: "+ minimo+ " en posición "+ posMinimo);
        			System.out.println("Media: "+ media);
  
        	scanner.close();
	}

}
