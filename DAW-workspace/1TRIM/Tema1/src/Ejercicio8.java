import java.util.Scanner;

public class Ejercicio8 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("Dame un numero a");
		String a = scanner.nextLine(); 
		
		System.out.println(" Dame un número decimal b");
		Double b = scanner.nextDouble();
		
		System.out.println("dame un número decimal float c");
		Float c = scanner.nextFloat();
		
		System.out.println("PARSEO DE STRING A LONG");
		Long x1 = Long.parseLong(a);
		
		System.out.println("PARSEO DE DOUBLE A STRING");
		String x2 = b.toString();
		
		System.out.println("PARSEO DE DOUBLE A INTEGER");
		int x3 = b.intValue();
		
		System.out.println("PARSEO DE FLOAT A LONG");
		long x4 = c.longValue();
		
		System.out.println("x1: " + x1);
		System.out.println("x2: " + x2);
		System.out.println("x3: " + x3);
		System.out.println("x4: " + x4);
		
		scanner.close();

	}

}
