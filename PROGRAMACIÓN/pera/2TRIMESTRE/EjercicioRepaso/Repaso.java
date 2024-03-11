package EjercicioRepaso;

public class Repaso {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		//1
		
		String mensaje= "Hola como estás";
		Boolean haceSol=true;
		Integer dias=7;
		
		//2
		
		System.out.println(mensaje);
		
		//3
		Caballo caballo1= new Caballo();
		
		/*
		System.out.println(caballo1.color);
		
		//4
		caballo1.color="marrón";
		
		System.out.println(caballo1.color);
		
		Antes estaba en privado y lo hemos pasado a privado y da error
		*/
		
		//7
		caballo1.imprimeCarreras();
		
		
		int año= caballo1.añoNacimiento();
		System.out.println("El año del caballo es de: "+ caballo1.añoNacimiento());
		
		
		//8 Incrementar carreras ganadas
		
		caballo1.IncrementarCarrerasGanadas();
		caballo1.imprimeCarreras();
		
		caballo1.relincha();
		
		//11 Asignar nombre
	
		caballo1.setNombre("Bolita");
		System.out.println("El nombre del caballo es: "+ caballo1.getNombre());
		
		caballo1.setColor("Marrón");
		System.out.println("El color del caballo es: "+ caballo1.getColor());
		
		caballo1.setCarrerasGanadas(10);
		System.out.println("Ha ganado: "+ caballo1.getCarrerasGanadas());
		
		
		System.out.println(caballo1);;
		
		
		Caballo caballo2=new Caballo("Fideo","Blanco",4, 20);
		int carreras=caballo2.getCarrerasGanadas();		
		System.out.println(caballo2);
		
		Caballo caballo3 =new Caballo();
		System.out.println(caballo3);
		
		
		caballo3.setNombre("Ronaldo");
		caballo3.setColor("Blanco");
		caballo3.setEdad(4);
		caballo3.setCarrerasGanadas(150);
		System.out.println(caballo3);
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
