package EJRepaso4;

import java.time.LocalDate;

public class Digital extends Libro{


	public Digital(String titulo, String autor, LocalDate fechaEdicion, Integer paginas) {
		super(titulo,autor,fechaEdicion,paginas);
	}
	
	@Override
	public Integer getPeso() {
		return 0;
		
	}
	
	@Override
	public String toString() {
		return super.toString();
	}
	
	
	
}
