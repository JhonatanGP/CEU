package Arrays;

import java.util.Scanner;

public class arrays16 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scanner = new Scanner(System.in);

        System.out.println("Escribe una palabra");
        String palabra = scanner.nextLine();
        String[] array= palabra.split("");
		
        for (int i=array.length-1; i>=0;i--){
        	System.out.print(array[i]);
        }
			
		scanner.close();
	}
}

