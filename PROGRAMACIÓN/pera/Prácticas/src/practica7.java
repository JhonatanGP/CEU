import java.util.Scanner;

public class practica7 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scanner = new Scanner(System.in);
		int numero=0;
		
		
		
		
		do {
			
			System.out.println("Escribe un número");
			 numero = scanner.nextInt();
			 
			 int suma=0;
			
			 if (numero>=1 && numero<=10) {
				 	for(int contador= numero; contador<=(numero*10); contador= contador+numero){
				 	
				 
				 	
				if(contador == numero) {
				System.out.print(contador);	
				
				}else {
					
					System.out.print("+");
					System.out.print(contador);
				}
				suma=suma+contador;	
			}
			
				 	
			System.out.println("\n"+ suma +"\n");	 	
				 	
		}
			
		
		else if (numero==0) {
			System.out.println("Cerrando programa");
			break;
			}
				
		else {
			System.out.println("Número incorrecto \n");
		}
	}while (numero!=0);
				
			scanner.close();	
		}
	
	
	}



