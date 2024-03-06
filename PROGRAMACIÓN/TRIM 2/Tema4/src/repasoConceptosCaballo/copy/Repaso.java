package repasoConceptosCaballo.copy;
public class Repaso {

	public static void main(String[] args) {

		// creamos caballo1
		Caballo caballo1 = new Caballo();

		/*
		 * Para cuando los atributos son publicos: 
		 * caballo1.color = "marron";
		 * System.out.println(caballo1.color);
		 */
		// llamar metodos
		caballo1.imprimeCarrerasGanadas();
		caballo1.yearNacimiento();
		caballo1.incrementarCarrerasGanadas();
		caballo1.imprimeCarrerasGanadas();

		System.out.println("La edad del caballo es: " + caballo1.yearNacimiento());

		caballo1.imprimeCarrerasGanadas();
		caballo1.relincha();

		caballo1.setNombre("Bolita");
		System.out.println(caballo1.getNombre());

		caballo1.setColor("Marron");
		System.out.println(caballo1.getColor());

		caballo1.setEdad(2);
		System.out.println("La edad del caballo es:  " + caballo1.getEdad());

		System.out.println(caballo1);

		// creamos caballo2
		Caballo caballo2 = new Caballo("Fideo", 4, "Blanco", 20);

		int carreras = caballo2.getCarrerasGanadas();
		System.out.println(carreras);
		System.out.println(caballo2);

		// creamos caballo3
		Caballo caballo3 = new Caballo();
		caballo3.setNombre("amapola");
		caballo3.setColor("negro");
		caballo3.setEdad(15);
		caballo3.setCarrerasGanadas(50);

		System.out.println(caballo3);
	}

}
