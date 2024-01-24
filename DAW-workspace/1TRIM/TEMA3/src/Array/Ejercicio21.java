package Array;

public class Ejercicio21 {
	public static void main(String[] args) {
		Double[] arrayNum = new Double[] {5.4, 3.1, 9.0, 4.7};
		System.out.println("imprimo el array");
		for (Double numero:arrayNum) {
			System.out.print(numero + "\t");
		}
		Double contador=0.0;
		for (Double numero : arrayNum) {
			contador += numero;
		}
		System.out.println();
		System.out.println("La suma del array es:" + contador);
	}
}