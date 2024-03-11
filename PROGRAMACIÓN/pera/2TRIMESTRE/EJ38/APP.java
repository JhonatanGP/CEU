package EJ38;

public class APP {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		//1 Crea un objeto cola. 
		PilaCadenas pila= new PilaCadenas();
		System.out.println("1: "+pila);
		
		
		//2 Añade a la cola las palabras “primero” y “segundo” 
		pila.añadirCadena("primero");
		pila.añadirCadena("segundo");    
		System.out.println("2: "+ pila);
		
		//3 Saca de la pila un elemento e imprímelo(primero). 
		String elemento=pila.sacarCadena();
		System.out.println("3: "+ elemento);
		System.out.println(pila);
		
		//4 Añade a la pila la palabra “tercero”
		
		pila.añadirCadena("tercero");
		System.out.println("4: "+ pila);
		
		//5 Saca todos los elementos que queden en la pila e imprímelos. 
		while(pila.getTamaño()>0) {
			elemento= pila.sacarCadena();
			System.out.println(pila.sacarCadena());
		}
			System.out.println("5: "+ pila);

		//6 Añade a la pila la palabra cuarto. 

			pila.añadirCadena("cuarto");
			System.out.println("6: "+ pila);
			
	}

}
