import java.util.Scanner;

public class EjercicioRepaso21 {

	public static void main(String[] args) {
		Scanner scanner= new Scanner (System.in);
		int num;
		do {
			System.out.println("Dame un numero mayor que 0");
			num = scanner.nextInt();
					
			}while (num <=0);
		
		for (int i = 0; i < num;  i++) {
			for (int j = 0; j < num;  j++) {
				if (i == j) {
					System.out.print("* ");
			}
			else {
				System.out.print("- ");
			}
		}
			System.out.println();
		}
	}
}