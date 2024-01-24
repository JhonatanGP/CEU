import java.util.Scanner;

public class Ejercicio02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scanner = new Scanner(System.in);
		System.out.println("¿Cuál es tu altura en metros?");
		Float altura = scanner.nextFloat();
		System.out.println("De acuerdo, ahora dime tu peso.");
		Float peso = scanner.nextFloat();
		float altura2 = altura * altura;
		float imc = peso / altura2;
		System.out.println("Ok, tu IMC es " + imc + " . ");
		
		 
	}

}
