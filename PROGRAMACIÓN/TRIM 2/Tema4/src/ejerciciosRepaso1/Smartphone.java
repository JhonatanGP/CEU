package ejerciciosRepaso1;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.Month;

public class Smartphone {
	
	private String marca;
	private String modelo;
	private String imei;
	private BigDecimal precio;
	private LocalDate fechaFabricacion;
	private boolean activo;
	
//Añade 3 constructores:
	
	// Constructor por defecto: no hay que hacer nada 
	public Smartphone () {
		this.precio = BigDecimal.ZERO;
		this.activo = true;		
				
	}
	// Constructor que reciba e inicialice el imei
	public  Smartphone (String imei) { //el nombre debe ser smp el nombre de la clase
		this.imei = imei;
		this.precio = BigDecimal.ZERO;
		this.activo = true;	
		
	}
	// Constructor que reciba e inicialice el imei, la marca y el modelo 
	public  Smartphone (String imei, String marca, String modelo) { //el nombre debe ser smp el nombre de la clase
		this.imei = imei;
		this.marca = marca;
		this.modelo = modelo;
		this.precio = BigDecimal.ZERO;
		this.activo = true;			
	}	
	// Todos los constructores deben inicializar el smartphone como activo y a precio 0.
	
	// setPrecio()  permite cambiar el precio del Smartphone
	public void setPrecio(BigDecimal precio) {
		this.precio = precio;
	}
	//Añadimos los métodos:
	// activar  activa el Smartphone
	public void activar() { //no devuelve nada es un boleano, no hace falta
		this.activo = true;
	}
	// desactivar  inactiva el Smartphone
	public void desactivar() {
		this.activo = false;		
	}
	// getEdad()  devuelve los años transcurridos desde el 1 de abril del 2000 hasta la fecha de fabricación del Smartphone
	private Integer getEdad() {
		LocalDate fecha2000 = LocalDate.of(2000, Month.APRIL, 1);
		return ;
	}
	// cambiarMarcaModelo()  recibe una marca y modelo para cambiar los del Smartphone
	
	// establecerFabricacion()  recibe y cambia la fecha de fabricación del Smartphone
	public void establecerFabricacion(LocalDate fabricacion) {
		this.fechaFabricacion = fabricacion;
	}
	// getPrecioMasIva()  devuelve el precio del Smartphone sumándole el IVA (21%)
	public BigDecimal getPrecioMasIva() {
		return this.precio.add(this.precio.multiply)
	}
	// isAltaGama()  recibe un precio base y devolverá un booleano indicando si el Smartphone es de alta gama o no. Los Smartphone de 
	   //alta gama son aquellos cuyo	precio es mayor al precio base recibido
	
	// isDatosCompletos()  devuelve un booleano indicando si los datos del Smartphone están completos. Para que lo estén, al menos el imai 
	   //debe no estar vacío ni contener sólo espacios en blanco, y el precio no puede ser null.
	public Boolean isDatosCompletos() {
		return ;
	}
	// isGratis()  devuelve si el precio del Smartphone es o no es 0 euros.
	public Boolean isGratis() {
		return ;
	}
	// rebajar()  modifica el precio del Smartphone restándole 10 euros.
	public void rebajar() {
		if (this.precio.compareTo(precio))
	}
	// toString()  sobrescribe el método toString de Object. Debe devolver una cadena con	el formato “marca (modelo)”. Si el Smartphone además está inactivo, la cadena será así “marca (modelo) – INACTIVO”. 
}
