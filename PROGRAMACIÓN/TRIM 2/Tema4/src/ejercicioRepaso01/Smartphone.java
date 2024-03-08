package ejercicioRepaso01;

import java.math.BigDecimal;
import java.time.LocalDate;


public class Smartphone {
	
	private String marca;
	private String modelo;
	private String imei;
	private BigDecimal precio;
	private LocalDate fechaFabricacion;
	private boolean activo;
	
//Añade 3 constructores:
	
	// Constructor por defecto: no tiene nada 
	public Smartphone () {
		this.activo = true;
		this.precio = new BigDecimal(0);
	}
	// Constructor que reciba e inicialice el imei (cuando pone que recibe, se debe de poner entre parentesis lo que recibe)
	public Smartphone(String imei) {
		this.imei = imei;
		this.activo = true;
		this.precio = new BigDecimal(0);
	}
	// Constructor que reciba e inicialice el imei, la marca y el modelo 
	public Smartphone(String imei,String marca,String modelo) {
		this.imei = imei;
		this.marca = marca;
		this.modelo = modelo;
		this.activo = true;
		this.precio = new BigDecimal(0);
	}	
	// Todos los constructores deben inicializar el smartphone como activo y a precio 0.
	//Añadimos los métodos:
	// setPrecio()  permite cambiar el precio del Smartphone,(con el set cambio el precio) void no devuelve nada
		public void setPrecio(BigDecimal precio) {
		this.precio = precio;
	}	 
	// activar  activa el Smartphone
	public void activar() {
		this.activo = true;
	}
	// desactivar  inactiva el Smartphone (ponemos a false el boolean y se desactiva)
	public void desactivar () {
		this.activo = false;
	}
	// getEdad()  devuelve los años transcurridos desde el 1 de abril del 2000 hasta la fecha de fabricación del Smartphone
	public LocalDate getedad() {
		LocalDate fechaFabricacion = LocalDate.of(2000, 04, 01);
		return fechaFabricacion;
	}
	
	// cambiarMarcaModelo()  recibe una marca y modelo para cambiar los del Smartphone
	public void cambiarMarcaModelo(String marca,String modelo) {
		this.marca = marca;
		this.modelo = modelo;
	}
	// establecerFabricacion()  recibe y cambia la fecha de fabricación del Smartphone
	public void establecerFabricacion(LocalDate fechaFabricacion) {
		this.fechaFabricacion = fechaFabricacion;
	}
	// getPrecioMasIva()  devuelve el precio del Smartphone sumándole el IVA (21%)
	public BigDecimal getPrecioMasIva() {
		return this.precio.add(this.precio.multiply(new BigDecimal(0.21)));
	}
	// isAltaGama()  recibe un precio base y devolverá un booleano indicando si el Smartphone es de alta gama o no. Los Smartphone de 
	   //alta gama son aquellos cuyo precio es mayor al precio base recibido
	
	// isDatosCompletos()  devuelve un booleano indicando si los datos del Smartphone están completos. Para que lo estén, al menos el imai 
	   //debe no estar vacío ni contener sólo espacios en blanco, y el precio no puede ser null.
	
	
	// isGratis()  devuelve si el precio del Smartphone es o no es 0 euros.
	
	
	// rebajar()  modifica el precio del Smartphone restándole 10 euros.
	
	
	
	// toString()  sobrescribe el método toString de Object. Debe devolver una cadena con	el formato “marca (modelo)”. Si el Smartphone además está inactivo, la cadena será así “marca (modelo) – INACTIVO”. 
}
