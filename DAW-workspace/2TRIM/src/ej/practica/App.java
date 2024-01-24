package ej.practica;

public class App {
	public static void main(String[] args) {
		String mensaje = "Hola como estas?";
		Boolean hacesol = true;
		Integer dias = 7; 
		System.out.println(mensaje);
		
		Caballo caballo1 = new Caballo();
		
		caballo1.imprimirCarrerasGanadas();
		
		int ano = caballo1.anoNacimiento();
		System.out.println("El año de Nacimiento del caballo es ");
		
		Caballo caballo2 = new Caballo("Fideo","blanco",5,1);
 		int carreras = caballo2.getCarrerasGanadas();
 		System.out.println(carreras);
 		
	}

}
