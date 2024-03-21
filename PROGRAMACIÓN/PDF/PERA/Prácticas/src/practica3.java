import java.util.Scanner;

public class practica3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub


		Scanner scanner = new Scanner(System.in);
		
		
			
		Integer numero= scanner.nextInt();
		
		scanner.close();
		
		if (numero ==1) {
			System.out.println("Entrando en Abrir");
		}
		
			else if (numero==2) {
		
				System.out.println("Entrando en Guardar");
		
		
		}
		
		
			else if (numero==3) {
			
				System.out.println("Entrando en Modificar");	
		
		
		}
		
			else if(numero==4)
		
				System.out.println("Saliendo del programa");
		
		
			else if(numero>=4)
		
		System.out.println("Esa opción no es correcta");
		
	}
	


}

		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
