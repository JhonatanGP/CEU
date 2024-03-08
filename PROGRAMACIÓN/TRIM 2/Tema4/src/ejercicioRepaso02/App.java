package ejercicioRepaso02;

import java.math.BigDecimal;

public class App {

	public static void main(String[] args) {
		Movil movil = new Movil(new BigDecimal("37.7749"), new BigDecimal("-122.4194"),654654654);
		Fijo fijo = new Fijo("Calle Bailn, N 10, 3A", 954954954);
		
		System.out.println("Telefono movil: " + movil.getNumero());		
		System.out.println("Telefono fijo: " + fijo.getNumero());
		
		movil.marcar(654654654);
		movil.marcar(610610610);
		movil.colgar();
		movil.colgar();

	}

}
