package ejercicioRepaso03;

import java.math.BigDecimal;

public class App {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		LocalizacionGPS localizacion = new LocalizacionGPS(new BigDecimal("37.7749"), new BigDecimal("-122.4194"));
		Movil movil = new Movil(localizacion,654654654);
		Fijo fijo = new Fijo("Calle Bailn, N 10, 3A", 954954954);
		
		System.out.println("Telfono mvil: " + movil.getNumero());		
		System.out.println("Telfono fijo: " + fijo.getNumero());
		
		movil.marcar(654654654);
		movil.marcar(610610610);
		movil.colgar();
		movil.colgar();

	}

}
