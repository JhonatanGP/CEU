package tema5;

import java.util.ArrayList;
import java.util.List;

public class SacoNumeros {

	/*Amplia el programa anterior creando una clase que sea SacoNumeros que tenga como atributo una lista de Integer. 
	Haz que tu aplicación use esta clase en lugar de tenerlo todo “apiñado”. La clase SacoNumeros tendrá que tener un  
	método addNumero() que te permita ir añadiendo dichos números y otro método toString() que imprima todos los números.
	Una vez que lo tengas modificado, añade otro método que sea getNumero() que recibe un Integer que será la posición y 
	devuelve el número que está en dicha posición. Haz que tu programa pregunte al usuario qué números quiere ver solicitando 
	posiciones y se los muestre. Hasta que el usuario indique la posición -1. En tal caso, dejarás de preguntarle.*/
			
		private List<Integer> numeros;
		
		public SacoNumeros() {
			numeros = new ArrayList<>();
		}
		
		public void addNumero(Integer numero) {
			numeros.add(numero);
		}
		
		public Integer getNumero(Integer posicion) {
			try {
				return numeros.get(posicion);
			}
			catch(IndexOutOfBoundsException e) {
				return null;
			}
		}
		
		@Override
		public String toString() {
			return numeros.toString();
		}
	}

