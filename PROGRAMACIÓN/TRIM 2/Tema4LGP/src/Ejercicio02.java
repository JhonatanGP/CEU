/*Crea un método llamado getMinusculas que reciba una cadena por parámetro y devuelva 
otra cadena que será el resultado de quitar los espacios en blanco de los extremos de 
la primera y de pasarla luego todo a minúsculas.
*/
public class Ejercicio02 {

	public static String getMinusculas(String cadenaInicial) {
		String cadenaFin = cadenaInicial.trim().toLowerCase();
		return cadenaFin;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println(getMinusculas(" HOlA SOY LUCIA   "));
	}

}