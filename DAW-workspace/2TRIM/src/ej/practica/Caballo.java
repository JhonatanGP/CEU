package ej.practica;

public class Caballo {

	private String mensaje;
	private String color;
	private int edad; 
	private int carrerasGanadas;
	
 public void imprimirCarrerasGanadas() {
	 System.out.println("El número de carreras ganadas es: " + this.carrerasGanadas);
 }
 
 public int anoNacimiento() {
	 return 2024-edad;
 }

public void incrementarCarrerasGanadas() {
	carrerasGanadas = carrerasGanadas + 1;
}

public void relincha(){
	System.out.println("hiiiiiiiiii");
}

/*getters and setters*/

public String getMensaje() {
	return mensaje;
}

public void setMensaje(String mensaje) {
	this.mensaje = mensaje;
}

public String getColor() {
	return color;
}

public void setColor(String color) {
	this.color = color;
}

public int getEdad() {
	return edad;
}

public void setEdad(int edad) {
	this.edad = edad;
}

public int getCarrerasGanadas() {
	return carrerasGanadas;
}

public void setCarrerasGanadas(int carrerasGanadas) {
	this.carrerasGanadas = carrerasGanadas;
}

public Caballo(String mensaje, String color, int edad, int carrerasGanadas) {
	super();
	this.mensaje = mensaje;
	this.color = color;
	this.edad = edad;
	this.carrerasGanadas = carrerasGanadas;
}





}
