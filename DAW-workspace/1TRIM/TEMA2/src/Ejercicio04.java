import java.util.Scanner;
public class Ejercicio04 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		Integer número ;
		Integer suma = 0;
		
		do { 
			System.out.println("SUMA DE NÚMEROS, HASTA QUE ESCRIBA 0.");
			número = scanner.nextInt();
			suma = suma + número; 
		}
		while (número != 0);
		System.out.println("LA SUMA DE TODOS LOS NUMEROS INTRODUCIDOS ES "+ suma + ".");
		scanner.close();
		
	}

}
