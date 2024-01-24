package Array;
import java.util.Scanner;

public class Ejercicio05 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.println("Cuantos números quieres poner");
		int tamaño = scanner.nextInt();
		//creamos el array con ese tamaño
		int [] numeros = new int [tamaño];
		//recorremos el array y solicitamos un numero
		//Al usuario para meterlo en la posicion i
		for ( int i = 0; i < numeros.length ;  i++) {
			System.out.println("Dime el número de la posición " + i);
			int x = scanner.nextInt();
			numeros [i]= x;
		}
		int maximo = numeros[0];	
		int minimo = numeros[0];
		int posMax = 0;		
		int posMin = 0;
		int suma = 0;
		
		System.out.println("****Lista total****");
			//recorrer el array para imprimirlo
			for (int i = 0; i < numeros.length ;  i++) {
				System.out.print(numeros[i]+ " ");
				System.out.println();
				
				if  (numeros[i] > maximo) {
					maximo = numeros[i];
					posMax=i;
				}
				else if(numeros[i]<minimo) {
					minimo = numeros[i];
					posMin = i;
				}
				suma = suma + numeros[i];
			}
				int media = suma/numeros.length;
				System.out.println("****Resultado Máximo/Mínimo/Media****");
				System.out.println("Máximo: " + maximo + " en posicion " + posMax);
				System.out.println("Mínimo: " + minimo + " en posicion " + posMin);
				System.out.println("Media: " + media);

		 scanner.close();
	}
}