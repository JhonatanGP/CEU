import java.util.Scanner;

public class Ejercicio06y08 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scanner = new Scanner(System.in);

		System.out.println("Elige entre 'ADD', 'SUB', 'MUL', 'DIV'");
		String cadena = scanner.nextLine();
		System.out.println("Dime un numero");
		Integer num1 = scanner.nextInt();
		System.out.println("Dime otro numero");
		Integer num2 = scanner.nextInt();

		Integer calcular = Calculadora.calcular(cadena, num1, num2);
		System.out.println("La solucion es: " + calcular);
		scanner.close();
	}

}