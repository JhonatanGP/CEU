package Arrays;

import java.util.Scanner;

public class arrays3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner scanner = new Scanner(System.in);

        System.out.println("¿Cuantos números vas a introducir por consola?");

        int DimenArr = scanner.nextInt();

        int[] Arrayus = new int[DimenArr];

        for (int i = 0; i <DimenArr ; i++) {
            System.out.println("\nIntroduzca un número");
            Arrayus[i] = scanner.nextInt();
        }

        scanner.close();

        System.out.println();

        for (int i = 0; i < DimenArr; i++) {
            System.out.println(Arrayus[i]);
            
        }
	}

}
