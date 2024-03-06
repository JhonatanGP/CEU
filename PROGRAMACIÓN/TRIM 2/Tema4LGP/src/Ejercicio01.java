/* Crea un método llamado getMayusculas que reciba una cadena por parámetro y devuelva 
 * otra cadena que será el resultado de quitar los espacios en blanco de los extremos 
 *de la primera y de pasarla luego todo a mayúsculas.
*/
public class Ejercicio01 {
	public static String getMayusculas (String cadenaInicial) {
		String cadenaFin = cadenaInicial.trim().toUpperCase();
		return cadenaFin;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println(getMayusculas(" hola soy lucia "));
	}

	

}