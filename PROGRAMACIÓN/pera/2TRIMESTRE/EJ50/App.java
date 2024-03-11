package EJ50;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;


public class App {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//SET 50
		
		//1 Crea un Set vacío e imprímelo
		Set<Pais> paises=new HashSet<>();
		
		//2 Crea tres países:
		
		Pais pais1= new Pais("ES", "España");
		Pais pais2= new Pais("CK", "Islas Cook");
		Pais pais3= new Pais ("CK", "Islas Caimán");
		
		//3 Añade tres paises al conjunnto e imprímelo
		paises.add(pais1);
		paises.add(pais2);
		paises.add(pais3);
		
		//3 Añade los 3 países al conjunto e imprímelo (Deberían aparecer 2. ¿Sabes por qué?) 
		System.out.println(paises);
	
		//4 Crea otro país (es / España) y añádelo al conjunto. Imprímelo.
	    Pais pais4 =new Pais ("es", "España");
	    paises.add(pais4);
		System.out.println(paises);
		//5 ¿Qué podrías hacer para que no ocurriera lo del punto anterior (el que se puedan añadir países al conjunto que son iguales a otro, aunque el código esté en minúsculas)? Si sabes qué… hazlo y repite el punto anterior. 
	    
		
		//6 Borra todos los países que no sean “ES” del conjunto. Luego imprímelo. 
		Iterator<Pais> it= paises.iterator();
	    while(it.hasNext()) {
	    	Pais pais = it.next();
	    	if(!pais.getCodigo().equals("ES")) {
	    		it.remove();
	    	}
	    }
		
		//7 Vacía el conjunto. 
	    paises.clear();
		System.out.println(paises);

	}

}
