package EJ54;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

public class App {

	public static void main(String[] args) {
		// 1 Crea una cuenta corriente e imprime el dinero que tenemos.
		CuentaAhorros cuenta = new CuentaAhorros("1597963278950001");
		System.out.println("PASO 1: " + cuenta.getTotal());
		
		// 2 Añade 2 cargos, 2 ingresos y 1 retirada.
		MovimientoCargo cargo1 = new MovimientoCargo();
		cargo1.setFecha(LocalDate.of(2023, 3, 05));
		cargo1.setImporte(new BigDecimal(300));
		cargo1.setCif("12456789D");
		MovimientoCargo cargo2 = new MovimientoCargo();
		cargo2.setFecha(LocalDate.of(2023, 3, 2));
		cargo2.setImporte(new BigDecimal(80));
		cargo2.setCif("75987456L");
		
		MovimientoIngreso ingreso1 = new MovimientoIngreso();
		ingreso1.setFecha(LocalDate.of(2023, 3, 1));
		ingreso1.setImporte(new BigDecimal(1580));
		ingreso1.setDescripcion("Ingreso Lotera");
		MovimientoIngreso ingreso2 = new MovimientoIngreso();
		ingreso2.setFecha(LocalDate.of(2023, 2, 28));
		ingreso2.setImporte(new BigDecimal(152.50));
		ingreso2.setDescripcion("Bizum Lola");
		
		MovimientoRetirada retirada = new MovimientoRetirada();
		retirada.setFecha(LocalDate.of(2023, 3, 3));
		retirada.setImporte(new BigDecimal(71.12));
		
		cuenta.addMovimiento(cargo1);
		cuenta.addMovimiento(cargo2);
		cuenta.addMovimiento(ingreso1);
		cuenta.addMovimiento(ingreso2);
		cuenta.addMovimiento(retirada);
		System.out.println("PASO 2: Aadidos 2 cargos , 2 ingresos y 1 retirada"); 
		// 3 Imprime el dinero que tenemos.
		System.out.println("PASO 3: " + cuenta.getTotal());
		
		// 4 Imprime todos los movimientos.
		System.out.println("PASO 4: ");
		List<String> movimientos = cuenta.getMovimientosString();
		for (String mov : movimientos) {
			System.out.println(mov);
		}
		
		//5 Imprime los cargos.
		System.out.println("PASO 5: ingresos ");
		movimientos = cuenta.getIngresos();
		System.out.println("Ingresos:");
		for (String mov : movimientos) {
			System.out.println(mov);
		}
		//6 Imprime los ingresos.
		System.out.println("PASO 6: cargos ");
		movimientos = cuenta.getCargos();
		System.out.println("Cargos:");
		for (String mov : movimientos) {
			System.out.println(mov);
		}
		//7 Imprime las retiradas.
		System.out.println("PASO 7: retiradas ");
		movimientos = cuenta.getRetiradas();
		System.out.println("Retiradas:");
		for (String mov : movimientos) {
			System.out.println(mov);
		}
		
		
	}
	
}

