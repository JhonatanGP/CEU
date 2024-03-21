package src.Ejercicios_primeros;

public class EJ2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		String resultado=getMinusculas(" ¿QUE TAL?" );
		System.out.println(resultado);
	
	}

	public static String getMinusculas(String cadena){
		return cadena.trim().toLowerCase();
		
	}
}
