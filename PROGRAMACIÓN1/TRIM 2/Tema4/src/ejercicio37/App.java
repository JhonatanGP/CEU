package ejercicio37;

public class App {

	public static void main(String[] args) {
		//1. Crear objeto cola.
		ColaCadenas Cola = new ColaCadenas();
		System.out.println("1: " + cola);
		
		//2. Añade a la cola
		
		
		//3. Saca de la cola un elemento e imprime 
		
		//4. Añade a la cola la palabra tercero
		cola.añadirCadena("tercero");
		System.out.println("4:" + cola);
		//5. Saca todos los elementos que queden
		while (cola.getTamaño() > 0) {
			elemento = cola.sacarCadena();
			System.out.println(elemento);
		}
		
	}

}
