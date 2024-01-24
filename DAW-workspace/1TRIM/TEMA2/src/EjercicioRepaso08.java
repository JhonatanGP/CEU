import java.util.Scanner;

public class EjercicioRepaso08 {
	
	private static final String HASTA_LUEGO = " hasta luego ";
	private static final String HOLA = " hola ";


	public static void main(String[] args) {
		
		Scanner scanner= new Scanner (System.in);
		
		boolean repetir-false;
		
		do {
			System.out.println(" Esciba un texto ");
			String texto = scanner.nextLine(); 

			if ( texto.startsWith(HOLA) && texto.endsWith(HASTA_LUEGO)) {
			}
				Integer pos1= texto.indexOf('a');
				String mensaje=texto.substring(pos1 + 1,texto.lastIndexOf(HASTA_LUEGO));
				
				repetir = false;
				System.out.println("Lo he entendido. Mensaje: " + mensaje.trim());
				
     		}
			else {
				System.out.println("Lo siento, no he entendido el mensaje");
					}
				}
			}

			
		
		
		
		
