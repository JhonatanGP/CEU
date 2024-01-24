import java.util.Scanner;

public class Ejercicio4 {
	
	public static final int AÑO=2023;

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scanner = new Scanner(System.in);
		System.out.println("¿Cuál es tu fecha de nacimiento?");
		Integer fechadenacimiento = scanner.nextInt();
		Integer edad = AÑO -  fechadenacimiento;
		System.out.println("!Genial, tienes " + edad + " años¡");
		scanner.close();

	}

}
