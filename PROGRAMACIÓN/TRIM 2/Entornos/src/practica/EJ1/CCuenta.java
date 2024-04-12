package practica.EJ1;



public class CCuenta {

	protected String nombre;
	private String cuenta;
	private double saldo;
	private double tipoInteres;

	public CCuenta() {
	}

	public CCuenta(String nom, String cue, double sal, double tipo) {
		nombre = nom;
		cuenta = cue;
		saldo = sal;
		tipoInteres = tipo;
	}

	public void asignarNombre(String nom) {
		nombre = nom;
	}

	public String obtenerNombre() {
		return nombre;
	}

	public double estado() {
		return saldo;
	}

	public void ingresar(double cantidad) throws Exception {
		if (cantidad < 0) {
			throw new Exception("No se puede ingresar una cantidad negativa");
		}
		saldo = saldo + cantidad;
	}

	public void retirar(double cantidad) throws Exception {
		if (cantidad < 0) {
			throw new Exception("No se puede retirar una cantidad negativa");
		}
		if (estado() < cantidad) {
			throw new Exception("No se hay suficiente saldo");
		}
		saldo = (saldo - cantidad);
	}

	
}
