
public class ArrayUtils {

	public static void imprimirArray(String cadena1) {
		System.out.println(cadena1);
	}

	public static String obtenerPalabra(String cadena, Integer n) {
		String[] arrayCadenas = cadena.split(" ");

		String hueco = "";
		for (int i = 0; i < arrayCadenas.length; i++) {
			hueco = arrayCadenas[i];
			if (i == n) {
				break;
			}
			else {
				hueco =" ";
			}
		}
		return hueco;
	}
	
	public static Integer buscarPalabra (String cadena, String palabra) {
		Integer posicion = 0;
		String[] arrayCadenas = cadena.split(" ");

		String hueco = "";
		for (int i = 0; i < arrayCadenas.length; i++) {
			hueco = arrayCadenas[i];
			if (hueco.equalsIgnoreCase(palabra)) {
				posicion = i;
				break;
			}
			else {
	  
		posicion=-1;
			}
		}
		
		return posicion;
	}	
		
		
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
	}
}