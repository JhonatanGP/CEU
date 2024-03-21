import java.util.Scanner;

public class practicas4 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		Scanner scanner = new Scanner(System.in);
		System.out.println("Indique el precio de tu compra"); 
		Float compra= scanner.nextFloat();
		System.out.println("Indique las unidades de tu compra"); 
		Float unidades= scanner.nextFloat();
		
		scanner.close();
		
		Float precio= (compra * unidades);
		
		if (unidades>100) {
			 double resultado = (precio * 0.4); 
			 double result =(precio - resultado);
		 	System.out.println("Su compra es de "+ precio+ "€, su descuento es de "+ resultado+", y su precio final sería de "+result);
		}
		
		
		if (unidades>=25 && unidades<=100){
			double resultado1 = (precio * 0.2);
			 double result1 =(precio - resultado1);
			System.out.println("Su compra es de "+ precio+ "€, su descuento es de "+ resultado1+", y su precio final sería de " +result1);
		}
		
		
		
		if (unidades>=10 && unidades<=24){
			double resultado2 = (precio * 0.1);
			 double result2 =(precio - resultado2);
			System.out.println("Su compra es de "+ precio+ "€, su descuento es de "+ resultado2+", y su precio final sería de "+ result2);
		}
		
		
		
		if (unidades<10) {
			double resultado3 = (precio);
			 double result3 =(precio - resultado3);
			System.out.println("Su compra es de "+ precio+ "€, no tienes descuento, y su precio final sería de "+ result3);
		}
		
		
		
		
		
		
		
		
		
		
		
	}

}
