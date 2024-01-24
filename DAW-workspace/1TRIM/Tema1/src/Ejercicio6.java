import java.util.Scanner;

public class Ejercicio6 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("¿Cuál es el precio sin IVA de los pantalones?");
		Float preciosiniva = scanner.nextFloat();
		Double precioconiva = preciosiniva * 1.21;
		float preciosiniva2 = (float) (preciosiniva * 1.21);// otra opción
		System.out.println("Precio con IVA " + precioconiva + " euros.");
		scanner.close();
		
	}

}
