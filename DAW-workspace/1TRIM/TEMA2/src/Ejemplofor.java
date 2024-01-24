import java.util.Scanner;

public class Ejemplofor {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		for (int i=1;i<=100;i++) {
			System.out.println(i);
		}
		System.out.println("*************************************");
		for(int i = 100; i>=1;i--) {
			System.out.println(i); 
		}
		System.out.println("*************************************");
		
		for (int i=0;i<=100; i+=7) {
			System.out.println(i);
		}
		System.out.println("*************************************");
		
		Scanner scanner = new Scanner(System.in);
		System.out.println("Dame un número");
		Integer num=scanner.nextInt();
		
		for (int i=0; i<=num; i++) {
			System.out.println(i);
		}
	}

}
