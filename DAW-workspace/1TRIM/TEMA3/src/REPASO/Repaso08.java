package REPASO;
import java.util.Scanner;
public class Repaso08 {

	public static void main(String[] args) {
		Scanner scanner= new Scanner (System.in);
		System.out.println("Escribe un código HTML");
		String html = scanner.nextLine();
		System.out.println("Texto extraido");
		String [] caracteres = html.split("");
		Boolean etiquetaAbierta = false;
		//Bolean textoescrito = false;
		for(String caracter : caracteres) {
			if (caracter.equals("<")) {
				etiquetaAbierta = true;
			}
			else if (caracter.equals(">")) {
				etiquetaAbierta = false;
			}
			else if (!etiquetaAbierta) {
				System.out.print(caracter);
			}
		}
		
	}

}