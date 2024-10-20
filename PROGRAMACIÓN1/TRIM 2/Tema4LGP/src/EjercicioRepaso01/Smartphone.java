package EjercicioRepaso01;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.Month;
import java.time.Period;

public class Smartphone {
	// constante de año de uno de los metodos
	public static final LocalDate EDAD = LocalDate.of(2021, Month.APRIL, 1);
	public static final BigDecimal IVA = new BigDecimal(1.21);

	private String marca;
	private String modelo;
	private String imei;
	private BigDecimal precio;
	private LocalDate fechaFabricacion;
	private Boolean activo;

	// Todos los constructores deben inicializar el smartphone activo y precio 0.

	// Constructor por defecto
	public Smartphone() {
		precio = BigDecimal.ZERO;
		fechaFabricacion = LocalDate.now();
		activo = true;
	}

	// Constructor que reciba e inicialice el imei
	public Smartphone(String imei) {
		this.imei = imei;
		precio = BigDecimal.ZERO;
		activo = true;
	}

	// Constructor que reciba e inicialice el imei, la marca y el modelo
	public Smartphone(String imei, String marca, String modelo) {
		this.imei = imei;
		this.marca = marca;
		this.modelo = modelo;
		precio = BigDecimal.ZERO;
		activo = true;
	}

	// metodos

	// getters and setters
	// permite cambiar el precio del Smartphone
	public void setPrecio(BigDecimal precio) {
		this.precio = precio;
	}

	// activa el Smartphone
	public void activar() {
		this.activo = true;
	}

	// desactiva el Smartphone
	public void desactivar() {
		this.activo = false;
	}

	// devuelve los años transcurridos desde el 1 de abril del 2000 hasta la fecha
	// de fabricación del Smartphone
	public Period getEdad(LocalDate fecha) {
		Period periodo = EDAD.until(fecha);
		return periodo;
	}

	// recibe una marca y modelo para cambiar los del Smartphone
	public void cambiarMarcaModelo(String marca, String modelo) {
		this.marca = marca;
		this.modelo = modelo;
	}

	// recibe y cambia la fecha de fabricación del Smartphone
	public void establecerFabricacion(LocalDate nuevaFecha) {
		fechaFabricacion = nuevaFecha;
	}

	// devuelve el precio del Smartphone sumándole el IVA (21%)
	public BigDecimal getPrecioMasIva() {
		BigDecimal nuevoPrecio = precio.multiply(IVA);
		return nuevoPrecio;
	}

	/*
	 * recibe un precio base y devolverá un booleano indicando si el Smartphone es
	 * de alta gama o no. Los Smartphone de alta gama son aquellos cuyo precio es
	 * mayor al precio base recibido
	 */
	public Boolean isAltaGama(BigDecimal precioBase) {
		Boolean altaGama = false;
		if (precio.compareTo(precioBase) > 0) {
			altaGama = true;
		}
		return altaGama;
	}

	// devuelve un booleano indicando si los datos del Smartphone están completos.
	// Para que lo estén,al menos el imei debe no estar vacío ni contener sólo
	// espacios
	// en blanco, y el precio no puede ser null.

	public Boolean isDatosCompletos() {
		Boolean datosCompletos = true;
		if (imei == null || imei.isBlank() || precio == null) {
			datosCompletos = false;
		}
		return datosCompletos;
	}

	// devuelve si el precio del Smartphone es o no es 0 euros.
	public Boolean isGratis() {
		Boolean gratis = false;
		if (precio.equals(new BigDecimal(0))) {
			gratis = true;
		}

		return gratis;
	}

	// modifica el precio del Smartphone restándole 10 euros
	public BigDecimal rebajar() {
		if (precio.compareTo(BigDecimal.TEN) >= 0) {
			precio = precio.subtract(new BigDecimal(10));
		}
		return precio;
	}

	@Override
	public String toString() {
		if (activo.equals(false)) {
			return "Marca= " + modelo + "-" + " INACTIVO";
		} else {
			return "Marca= " + modelo;
		}
	}
}
