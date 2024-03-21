package EJ37_38Abstrac.copy;

import java.util.Scanner;

import EJ37.ColaCadenas;

public class appcola {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
Scanner scanner = new Scanner(System.in);
		
		//1 Crea un objeto cola. 
		ColaCadenas cola= new ColaCadenas();
		System.out.println("1: "+cola);
		
		//2 Añade a la cola las palabras “primero” y “segundo” 
		cola.añadirCadena("primero");
		cola.añadirCadena("segundo");
		System.out.println("2: "+ cola);
		
		//3 Saca de la cola un elemento e imprímelo. 
		String elemento=cola.sacarCadena();
		System.out.println("3: "+ elemento);
		System.out.println(cola);
		
		//4 Añade a la cola la palabra “tercero” 
		cola.añadirCadena("tercero");
		System.out.println("4: "+ cola);
		
		//5 Saca todos los elementos que queden en la cola e imprímelos. 
		while(cola.getTamaño()>0) {
			elemento= cola.sacarCadena();
			System.out.println(cola.sacarCadena());
		}
			System.out.println("5: "+ cola);
			
		//6 Añade a la cola la palabra cuarto
			cola.añadirCadena("cuarto");
			System.out.println("6: "+ cola);
		
                                                 
		
	}

}
