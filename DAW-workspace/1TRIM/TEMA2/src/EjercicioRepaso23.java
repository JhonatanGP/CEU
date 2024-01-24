import java.util.Random;
import java.util.Scanner;

public class EjercicioRepaso23 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		int num = 0;
		
		do {
			System.out.println("Dame un numero mayor a 0");
			num=scanner.nextInt();
		  }
		while (num <=0);
		Random random= new Random();
		
		for (int i=1; i<=num; i++) {
			int resultado=random.nextInt(1,7);
			System.out.print("resultado de la tirada " +i+": ");
			System.out.println(resultado);
		}
	}
}