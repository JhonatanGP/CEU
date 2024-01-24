import java.util.Scanner;

public class EjDepuracionBien {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		int numero=0;
		do {
			System.out.println("Sepa la suma de los números par de su número:");
			numero=scanner.nextInt();
		 }while (numero < 0);
		  int suma = 0;
		  for (int i=0; i<=numero; i++) {
			  if (i%2==0) {
				  suma=suma+i;
			  }
		  }
		  System.out.println("La suma de los números pares del 1 al "+ numero + " es " + suma + ".");
		  scanner.close();
	}
}