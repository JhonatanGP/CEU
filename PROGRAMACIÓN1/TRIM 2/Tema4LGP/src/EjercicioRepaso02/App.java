package EjercicioRepaso02;

import java.math.BigDecimal;

public class App {

	public static void main(String[] args) {

		// Crea un teléfono móvil y otro fijo
		LocalizacionGPS localizador = new LocalizacionGPS(new BigDecimal(12345), new BigDecimal(99111));
		Movil movil1 = new Movil(654654654, localizador);
		Fijo fijo1 = new Fijo(954954954, "Calle centro");

		// Usa el método consultarNumero() de cada uno para imprimirlo.
		System.out.println(movil1.consultarNumero());
		System.out.println(fijo1.consultarNumero());

		// Luego llama a marcar() del móvil pasando como número de destino el 654654654
		movil1.marcar(654654654);
		System.out.println(movil1);

		// Luego llama a marcar() de nuevo del móvil pasando como número el 610610610
		movil1.marcar(610610610);
		System.out.println(movil1);

		// Luego llama a colgar() del móvil
		movil1.colgar();
		System.out.println(movil1);

		// Vuelve a llamar a colgar() del móvil
		movil1.colgar();
		System.out.println(movil1);

	}

}
