package EJRepaso1;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.Period;

public class Smartphone{

//1 Crea una clase llamada Smartphone con los siguientes atributos privados:
	private String marca;
	private String modelo;
	private String imei;
	private LocalDate fechaFabricacion;
	private Boolean activo;
	private BigDecimal precio;
	
	
	
/*2	Tres constructores.Constructor por defecto,Constructor que reciba e inicialice el imei,Constructor que reciba e inicialice el imei, la marca y el modelo
Todos los constructores deben inicializar el smartphone como activo y a precio 0. */
	public Smartphone(){
		this.activo=true;
		this.precio= new BigDecimal(0);
	}

	
	public Smartphone(String imei){
		this.imei=imei;
		this.activo=true;
		this.precio=new BigDecimal(0);
	}
	

	public Smartphone(String imei, String marca, String modelo){
		this.imei=imei;
		this.marca=marca;
		this.modelo=modelo;
		this.precio=new BigDecimal(0);
		this.activo=true;
		
	}
	
/*3|| 1 setPrecio()-->permite cambiar el precio del Smartphone, 2 activar --> activa el Smartphone, 3 desactivar--> inactiva el Smartphone
4 getEdad()--> devuelve los años transcurridos desde el 1 de abril del 2000 hasta la fecha de fabricación del Smartphone
5 cambiarMarcaModelo() --> recibe una marca y modelo para cambiar los del Smartphone, 6 establecerFabricacion() --> recibe y cambia la 
fecha de fabricación del Smartphone,7 getPrecioMasIva() --> devuelve el precio del Smartphone sumándole el IVA (21%)
8 isAltaGama() --> recibe un precio base y devolverá un booleano indicando si el Smartphone es de alta gama o no. Los Smartphone de alta 
gama son aquellos cuyo precio es mayor al precio base recibido, 9 isDatosCompletos() --> devuelve un booleano indicando si los datos del Smartphone
están completos. Para que lo estén, al menos el imai debe no estar vacío ni contener sólo espacios en blanco, y el precio no puede ser null., 
10 isGratis() --> devuelve si el precio del Smartphone es o no es 0 euros., 11 rebajar() --> modifica el precio del Smartphone restándole 10 euros. ,
12 toString() --> sobrescribe el método toString de Object. Debe devolver una cadena con el formato “marca (modelo)”. Si el Smartphone además está 
inactivo, la cadena será así “marca (modelo) – INACTIVO”.*/

	
	public void setPrecio(BigDecimal precio){
		this.precio=precio;
	}
	
	public void activar(){
		this.activo =true;
	}
	
	public void desactivar (){
		this.activo=false;
	}
	public Integer getEdad(){
		LocalDate fecha=LocalDate.of(2000, 4,1);
		Period periodo=fecha.until(fechaFabricacion);
		return periodo.getYears();
	}
	
	public void cambiarMarcaModelo(String marca1, String modelo1){
		this.marca=marca1;
		this.modelo=modelo1;
		
	}
	public void establecerFabricacion(LocalDate fechaFabricacion){
		this.fechaFabricacion=fechaFabricacion;
	}
	
	public BigDecimal getPrecioMasIva(){
		precio=precio.add(precio.multiply(new BigDecimal(0.21)));
		return precio;
	}
	
	public Boolean isAltaGama(BigDecimal precioBase){
		if(this.precio.compareTo(precioBase)>0) {
			return true;
		}
		return false;
	}	
	
	public Boolean isDatosCompletos(){
		if(this.imei==null || this.imei.isBlank() || this.precio==null){
			return false;
		}
		return true;
	}
	
	public Boolean isGratis(){
		if(this.precio.equals(new BigDecimal(0))){
			return true;
		}
		return false;
	}
	public void rebajar() {
		if(this.precio.compareTo(BigDecimal.TEN)>=0){
			this.precio=this.precio.subtract(BigDecimal.TEN);
		}
	}

	
	//ToString

	@Override
	public String toString(){
		String resultado= this.marca + "("+ this.modelo + ")";
		if(!this.activo) {
			return resultado + " - INACTIVO";
		}
		return resultado;
	}
	
	
}

















































