import java.util.Scanner;

public class EjercicioRepaso22 {

	public static void main(String[] args) {
		Scanner scanner= new Scanner (System.in);
		String num;
		
		System.out.println("Sucesión de números hasta el 10 de 1 en 1");
		for(int i = 1; i < 11; i++) {
			num = scanner.nextLine();
			System.out.print(i);
			/*switch(num) {
			case "":
				System.out.println(i);
				break;
			default:
				System.out.println("tiene que ser intro");
				i--;
				break;
			}*/
		}
	}
}