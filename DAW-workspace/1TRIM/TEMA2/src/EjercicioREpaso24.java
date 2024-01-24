import java.util.Scanner;

public class EjercicioREpaso24 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		int num = 0;
		
		do {
			System.out.println("Dame un numero mayor a 0");
			num=scanner.nextInt();
		 }while (num < 0);
		  int suma = 0;
		  for (int i=1; i<=num; i++) {
			  if (i%2==1) {
				  suma=suma+i;
			  }
		  }
		  scanner.close();
		  System.out.println("La suma de los números impares del 1 al "+ num + " es "+suma);
	}
}