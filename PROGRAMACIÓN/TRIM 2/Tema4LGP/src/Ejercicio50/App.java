package Ejercicio50;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
 


public class App {

	public static void main(String[] args) {
	
		//1. Crea un Set vacío e imprímelo
		Set <Pais> setVacio = new HashSet <>();
		System.out.println(setVacio);
		
		//2. Crea tres países:
		Pais espana = new Pais("ES", "Espana");
		Pais cook = new Pais("CK", "Islas Cook");
		Pais caiman = new Pais("CK", "Isla Caiman");
		
		//3. Añade los 3 países al conjunto e imprímelo 
		setVacio.add(espana);
		setVacio.add(cook);
		setVacio.add(caiman);
		System.out.println(setVacio);
		
		//4. Crea otro país (es / España) y añádelo al conjunto
		Pais espana2 = new Pais("es", "Espana");
		setVacio.add(espana2);
		System.out.println(setVacio);
		
		//5. ¿Qué podrías hacer para que no ocurriera lo del punto anterior
		//modificar el equals, añadiendo "descripcion"
		
		//6. Borra todos los países que no sean “ES” del conjunto
		
		Iterator<Pais> it = setVacio.iterator();
		while(it.hasNext()) {
			Pais pais = it.next();
			if(!pais.getCodigo().equals("ES")) {
				it.remove();
			}
		}
		
		
		//7. Vacía el conjunto. 
		setVacio.clear();
		System.out.println(setVacio);
		
		
	}

}
