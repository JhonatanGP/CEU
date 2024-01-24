import java.util.Scanner;

public class EjercicioRepaso10 {
	
	private static final String PUNTO = ".";
	private static final String BARRAS = "//";
	
	public static void main(String[] args) {
		
		Scanner scanner= new Scanner (System.in);
		System.out.println("Escriba una URL");
		String url = scanner.nextLine(); 
		
		int indiceProtocolo= url.indexOf (BARRAS);
		int indicePPunto= url.indexOf (PUNTO);
		int indiceUPunto= url.lastIndexOf (PUNTO);
		
		if (indiceProtocolo!= -1 && indicePPunto != -1 && indicePPunto!=indiceUPunto)
		{
			System.out.println(url.substring(0,indiceProtocolo + 2));
			System.out.println(url.substring(indiceProtocolo + 2, indicePPunto));
			System.out.println(url.substring(indicePPunto + 1, indiceUPunto));
			System.out.println(url.substring(indiceUPunto + 1));

		}
		else 
			System.out.println("La cadena no cumple el formato correcto");
		
		scanner.close();


	}

}
