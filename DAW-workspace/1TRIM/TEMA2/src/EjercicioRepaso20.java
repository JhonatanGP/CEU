
public class EjercicioRepaso20 {

	public static void main(String[] args) {
		for (int i = 0; i < 5;  i++) {
			for (int j = 0; j < 5;  j++) {
				if (i == j) {
					System.out.print("* ");
			}
			else {
				System.out.print("- ");
			}
			
		}
			System.out.println();
		}
		int num1 = 10;
		int num2 = 5;
		double result = (double) num2/num1 ;
		System.out.println(result);
		
	}
}