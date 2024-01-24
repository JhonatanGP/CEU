
import java.util.Scanner;
public class Hola {
	
	public static final String AÑO ="2023"; // El nombre de las constantes tienen que ser en mayusculas.
	public static final String ASIGNATURA ="programación";
	
	public static void main(String[] args) {
		String nombre;
		String apellido;
		int edad;
		nombre = "juan";
		apellido = "López Carmona";
		edad = 18;
		System.out.println("Mi nombre es " + nombre + ", mis apellidos son " + apellido + " y tengo " + edad + ", este año es el " + AÑO );
		System.out.println("Mi asignatura favorita es " + ASIGNATURA);
		Scanner Nombre = new Scanner(System.in);
	}

}
