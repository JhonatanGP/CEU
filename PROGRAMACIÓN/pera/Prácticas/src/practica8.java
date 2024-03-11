import java.util.Scanner;

public class practica8 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		
		String HASTA_LUEGO= "hasta luego";
		String HOLA= "hola";
			
			Scanner scanner = new Scanner(System.in);
			
			boolean repetir=false;
			do {
				System.out.println("Escribe un mensaje");
				String texto= scanner.nextLine();
			
				
			if (texto.startsWith(HOLA) && texto.endsWith(HASTA_LUEGO)) 
			{
				Integer pos1=texto.indexOf("a");
				String mensaje=texto.substring(pos1 + 1, texto.lastIndexOf(HASTA_LUEGO));
						
					repetir= false;
				System.out.println("Lo he entendido. Mensaje: "+ mensaje.trim());
			}
			
			else {System.out.println("Lo siento, no he entendido el mensaje");
				repetir=true;
			}
			
			}while(repetir == true);
		
			
			scanner.close();
			}
	

	}



