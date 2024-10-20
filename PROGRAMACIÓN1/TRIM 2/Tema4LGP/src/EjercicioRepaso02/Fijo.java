package EjercicioRepaso02;

public class Fijo extends Telefono {
	protected String direccion;

	public Fijo(int numeroTlf, String direccion) {
		super(numeroTlf);
		this.direccion = direccion;
		this.enLlamada = false;
	}
}