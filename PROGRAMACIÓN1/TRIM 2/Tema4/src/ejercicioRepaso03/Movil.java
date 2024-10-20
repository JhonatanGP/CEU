package ejercicioRepaso03;

public class Movil extends Telefono {
	
private LocalizacionGPS localizador;
	
	public Movil(LocalizacionGPS localizador,Integer numero) {
		super(numero);
		this.localizador= localizador;
	}

}

