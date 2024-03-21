package EJRepaso3;





public class movil extends telefono{
	private LocalizacionGPS localizacion;	
	
	
	public  movil(LocalizacionGPS localizacion,Integer numero) {
		super(numero);
		this.localizacion=localizacion;
}
}