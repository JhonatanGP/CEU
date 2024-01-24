public class Ejercicio05 {

	public static void main(String[] args) {
		int resultadoSuma = 0; //Acumulará las sumas parciales
		int contador = 1;
		
		while (contador <= 10000) {  // I
			resultadoSuma += contador ;
			contador++;
		}
		System.out.println("LA SUMA DE TODOS LOS NÚMEROS ES " + resultadoSuma);
	}

}
