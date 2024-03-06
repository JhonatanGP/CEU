package ejercicioRepaso01;
import java.math.BigDecimal;

public class SmartphoneBelen {
	private String marca;
	private String modelo;
	private String imei;
	private BigDecimal precio;
	private Integer anyoFabricacion;
	private Boolean activo;
	
	
	public SmartphoneBelen() {
		this.activo = true;
		this.precio = new BigDecimal(0);
	}
	public SmartphoneBelen(String imei) {
		this.activo = true;
		this.precio = new BigDecimal(0);
		this.imei = imei;
	}
	public SmartphoneBelen(String imei, String marca, String modelo) {
		this.activo = true;
		this.precio = new BigDecimal(0);
		this.imei = imei;
		this.marca = marca;
		this.modelo = modelo;
	}
	
	public void setPrecio(BigDecimal precio) {
		this.precio = precio;
	}
	
	public void activar() {
		this.activo = true;
	}
	
	
	public void desactivar() {
		this.activo = false;
	}
	
	
	public Integer getEdad() {
		return anyoFabricacion - 2000;
	}
	
	public void cambiarMarcaModelo(String marca, String modelo) {
		this.marca = marca;
		this.modelo = modelo;
	}
	
	public void establecerFabricacion(Integer anyo) {
		anyoFabricacion = anyo;
	}
	
	
	public BigDecimal getPrecioMasIva() {
		return this.precio.add(this.precio.multiply(new BigDecimal(0.21)));
		//return this.precio.multiply(new BigDecimal(1.21));
	}
	
	public Boolean isAltaGama(BigDecimal precioBase) {
		
		if (this.precio.compareTo(precioBase)>0) {
			return true;
		}
		return false;
		
		//return this.precio.compareTo(precioBase)>0;
	}
	
	public Boolean isDatosCompletos() {
		
		if (this.imei == null || this.imei.isBlank() || this.precio == null) {
			return false;
		}
		return true;
		//return imei != null && !imei.isBlank() && precio != null;
	}
	
	public Boolean isGratis() {
		if (this.precio.equals(new BigDecimal(0))) {
			return true;
		}
		return false;		
		//return this.precio.equals(new BigDecimal(0));
	}
	
	public void rebajar() {
		
		if(this.precio.compareTo(BigDecimal.TEN) >=0) {
			this.precio= this.precio.subtract(BigDecimal.TEN);
		}		
	}	
	
	@Override
	public String toString() {
		String resultado = this.marca + "(" + this.modelo + ")";
		if (!this.activo) {
			return resultado + " - INACTIVO";
		}
		return resultado;
	}

}
