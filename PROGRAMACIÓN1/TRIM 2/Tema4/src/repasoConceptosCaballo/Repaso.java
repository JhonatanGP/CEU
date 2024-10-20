package repasoConceptosCaballo;

public class Repaso {

	public static void main(String[] args) {
		//creamos caballo1
		Caballo caballo1 = new Caballo();
		/*Para cuando los atributos son publicos: 
		 * caballo1.color = "marron";
		 * System.out.println(caballo1.color); */
	//LLAMO A LOS METODOS
		caballo1.imprimeCarrerasGanadas();
		caballo1.yearNacimiento();
		caballo1.incrementarCarrerasGanadas();
		caballo1.imprimeCarrerasGanadas();
		
		System.out.println("La edad del caballo es: " + caballo1.yearNacimiento());
		
		caballo1.imprimeCarrerasGanadas();
		caballo1.relincha();
		
		caballo1.setNombre("bolita");
		System.out.println(caballo1.getNombre());
		
		caballo1.setColor("marron");		
		System.out.println(caballo1.getColor());
		
		caballo1.setEdad(2);
		System.out.println(caballo1.getEdad());
		
		caballo1.setCarrerasGanadas(10);
		
		//invoco el tostring
		System.out.println(caballo1);
	
	}

}
