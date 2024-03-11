package Semáforo;

public class App {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		//p1 Crea un Semáforo. 
		Semáforo semaforo=new Semáforo();
		System.out.println("p1 "+semaforo);
		
		//p2 Cambia el color a un color incorrecto. 

		semaforo.setColor("azul");
		System.out.println("p2 "+semaforo);
		
		//p3 Cambia el color a verde. 
		semaforo.setColor(Semáforo.VERDE);
		System.out.println("p3 "+semaforo);
		
		//p4 Pon el atributo parpadeando a cierto.
		semaforo.setParpadeando(true);
		System.out.println("p4 "+semaforo);
		
		//p5 Cambia el color a ámbar.
		semaforo.setColor(Semáforo.AMBAR);
		System.out.println("p5 "+semaforo);
		
		//p6 Pon el atributo parpadeando a cierto. 
		semaforo.setParpadeando(true);
		
		System.out.println("p6 "+semaforo);
		
		//p7 Llama 5 veces al método cambiarEstado (usando un bucle).
		for( int i=0; i<5;i++) {
			semaforo.cambiarEstado();
		}
		System.out.println("p7 "+semaforo);
		
		//p8 Crea un nuevo semáforo que sea copia del anterior.
		Semáforo copia= new Semáforo();
		copia.setColor(semaforo.getColor());
		copia.setParpadeando(semaforo.getParpadeando());
		System.out.println("p8 "+ copia);
	
		
	}

}
