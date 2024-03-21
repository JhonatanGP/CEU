package EJ34;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;
import java.util.Set;

import Set.Artículo;

public class EJ34{

	public static void main(String[] args){
		// TODO Auto-generated method stub
		Scanner scanner = new Scanner(System.in);
		Set<String> cadenas=new HashSet<>();
		
		//Pedimos 5 palabras
		for(int i=0;i<5;i++){
			System.out.println("Dame una palabra" + i);
			String cadena=scanner.nextLine();
			cadenas.add(cadena);
		}
		
		//imprimos la lista
		System.out.print(cadenas);
		
		//Poner en mayúscula		Hay que crear otro set para ponerlo en mayúscula
		Set<String> auxiliar=new HashSet<>();
		for(String cadena : cadenas){
		String cadenaMay= cadena.toUpperCase();
		auxiliar.add(cadenaMay);
		}
		//Buscar si hay cadena vacía
		if(cadenas.contains("")){
			System.out.println("Hay alguna cadena vacía, ERROR");
			}
		
		//Borrar con iterador las cadenas con longitud menor a 6 caractéres, ver si hay una con menos de 6 carácteres
		Iterator<String> it= cadenas.iterator();
		while(it.hasNext()) {
			if(it.next().length()<6) {
				it.remove();
			}
		}
		System.out.println(cadenas);
		scanner.close();
	}
}
