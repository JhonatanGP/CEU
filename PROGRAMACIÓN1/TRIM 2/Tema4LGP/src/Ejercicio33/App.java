package Ejercicio33;

public class App {

	public static void main(String[] args) {
		// creamos el semaforo
		Semaforo semaforo1 = new Semaforo();
		// vemos el estado del Semaforo
		System.out.println(semaforo1);

		semaforo1.setColor(Semaforo.VERDE);
		System.out.println(semaforo1);

		semaforo1.setParpadeando(true);
		System.out.println(semaforo1);

		semaforo1.setColor(Semaforo.AMBAR);
		System.out.println(semaforo1);
		semaforo1.setParpadeando(true);

		for (int i = 0; i < 5; i++) {
			semaforo1.cambiarEstado();
		}
		System.out.println(semaforo1);
		// semaforo nuevo copia del primero
		Semaforo semaforo2 = new Semaforo();
		semaforo2.setColor(semaforo1.getColor());
		semaforo2.setParpadeando(semaforo1.getParpadeando());
		System.out.println(semaforo2);
	}

}