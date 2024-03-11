package EJ37_38Abstrac.copy;

import java.util.ArrayList;
import java.util.List;

public class PilaCadenas extends Estructura{
	

	
	public PilaCadenas() {
		super();
	}
	
@Override	
    // Sacar el último de la lista.
	public String sacarCadena(){
		if(datos.isEmpty()) {
			return null;
		}													
		String cadena= datos.get(datos.size()-1);
		datos.remove(datos.size()-1);
		return cadena;
	}
}
	
