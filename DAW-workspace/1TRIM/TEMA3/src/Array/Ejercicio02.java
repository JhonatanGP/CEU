package Array;
import java.util.Scanner;
public class Ejercicio02 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		int num; 
		int num1;
		Integer [] num2=new Integer[6];
		System.out.println("Escribe un número");
		num = scanner.nextInt();
		for (int i = 0; i <6 ;  i++) {
			num1 = num*num;
			num++;
			num2[i]= num1;
		}
		for (int i=0; i<num2.length; i++) {
			System.out.println(num2[i]);
		}
		scanner.close();		
	}
}