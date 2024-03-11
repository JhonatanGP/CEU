import java.util.Scanner;

public class practica13 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		Scanner scanner = new Scanner(System.in);
		
		String frase="";
		String resultado="";
		
		do {
			System.out.println("Me puedes decir una frase (Escribe Fin para terminar)");
			frase = scanner.nextLine();
			resultado= resultado+"\n"+frase;
		}while (!frase.equalsIgnoreCase("Fin"));
		System.out.println("Esto es lo que has escrito: ");
		System.out.println(resultado.substring(0, resultado.length()-3));
		
		
	}

}
