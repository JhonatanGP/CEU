package EJ37_38Abstrac.copy;

import java.util.ArrayList;
import java.util.List;


public class ColaCadenas extends Estructura{

	

	public ColaCadenas(){
		super();
	}

@Override
	public String sacarCadena(){
		if(datos.isEmpty()) {
			return null;
		}
		return datos.remove(0);
		}
	
}
