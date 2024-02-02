package ejercicio43;

public class Guionistas extends Trabajadores {
	
	public Guionistas() { // Esto es un constructor, primero los creo y luego los completo en la app.
		super();            //Super es para que herede los atributos de la clase padre
	}
	
	public Integer getSueldo() {
		return GUIONISTAS;
	}
}
