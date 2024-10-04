package ejRepaso;

import java.util.Scanner;

public class Ej01 {
	public static final Float PI = 3.1416F;

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		System.out.println("Introduce el radio del cículo:");
		Float r = sc.nextFloat();
		Float c = 2 * PI * r;
		Float a = PI * (r*r);
		System.out.println("Con el radio " + r + " la circunferencia es: " + c + " y el área es: " + a + ".");
		
		sc.close();
	}

}
