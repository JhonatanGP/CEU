package tarea1;

import java.util.Scanner;

public class tarea8 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner scanner = new Scanner(System.in);
		
	System.out.println("Indique el primer número");
		
	String a = scanner.nextLine();
	
		
	System.out.println("Indique el segundo valor");
	
	Double b = scanner.nextDouble();
	
	
	System.out.println("Indique el último valor numérico");
		
	Float c = scanner.nextFloat();
	scanner.close();
	
	Long x1=  Long.parseLong(a);
	String x2= Double.toString(b);
	Integer x3= b.intValue();
	Long x4= c.longValue();
	
	
	System.out.println("El primer valor es"+" "+ x1+","+ " "+ "el segundo valor es"+ " "+ x2+","+ "el tercer valor es"+" "+ x3+ " "+ "y el último valor es"+ " "+ x4);
	
	}

}