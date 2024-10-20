package EjercicioRepaso02;

public class Movil extends Telefono {
	protected LocalizacionGPS localizacion;

	public Movil(int numeroTlf, LocalizacionGPS localizacion) {
		super(numeroTlf);
		this.localizacion = localizacion;
		this.enLlamada = false;
	}

}
