package tema1;

import java.util.Scanner;

public class Ej06 {
	
	public static final Double IVA = 0.21;

	public static void main(String[] args) {
	// 1. Solicita por consola al usuario cuál es el precio sin IVA del artículo (puede llevar decimales)
	System.out.println("¿Cuál es el precio sin IVA del artículo?");	
	// 2. Recoge el dato y calcula el IVA (21%)
	Scanner sc = new Scanner(System.in);
	Double precio = sc.nextDouble();
	Double iva = precio*0.21;
	// 3. Muestra como resultado en la consola el IVA calculado y el precio final (la suma del precio sin IVA más el IVA) 
	System.out.println("El IVA de "+ precio+ " euros" + " es " + iva + " euros.\n" + "El precio final es " + (precio+iva) + " euros.");
	}

}
