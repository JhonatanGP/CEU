package ejercicio54;

import java.util.ArrayList;
import java.util.List;

public class CuentaAhorros {

	private String numero; // STRING porque puede empezar por 0
	private List<Movimiento>movimientos;
	
// Constructor de la clase CuentaAhorros que reciba el número de cuenta
	public CuentaAhorros(String numero) { 
		this.numero = numero;
		this.movimientos =  new ArrayList<>();	//los moviminetos que haga se guardan en una lista
	}
	public void addMovimiento(Movimiento mov) {
		
	}
	
		
}

// Método para añadir un movimiento a la cuenta
// Método para obtener el total de dinero en la cuenta
// Método para obtener una lista de cadenas que muestre todos los movimientos de la cuenta.
// Método igual que el anterior pero que sólo devuelva las retiradas
// Método igual que el anterior pero que sólo devuelva los ingresos
// Método igual que el anterior pero que sólo devuelva los cargos 
