package For;

import java.util.Scanner;

public class for6 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		//1
		
		for(int i=1;i<=100;i ++){
			System.out.println(i);
		}
		
		
		//2
		for(int i=100;i>=1;i--){
			
		System.out.println(i);
		}
		
		//3
		for(int i=0; i<=100; i=i+7) {
			
			System.out.println(i);
		}
		
		//4
		Scanner scanner = new Scanner(System.in);
		System.out.println("Dame un número");
		Integer numero = scanner.nextInt();

		
		for(int i=0; i<=numero;i++) {
			System.out.println(i);
		}
		
		scanner.close();
		
		
		
		
	}

}
