package ejercicio6;

import java.math.BigDecimal;

public class Persona {
	private String genero;
	private BigDecimal altura;
	
	public String getGenero() {
		return genero;
	}
	public void setGenero(String genero) {
		genero = genero.toUpperCase();
		if(!genero.equals("H") && !genero.equals("M")) {
			throw new ParametroIncorrectoException("El género tiene que ser ");
		}
		this.genero = genero;
		
	}
	public BigDecimal getAltura() {
		return altura;
	}
	public void setAltura(BigDecimal altura) {
		if (altura.compareTo(new BigDecimal (3))>=0 ||altura.compareTo(BigDecimal.ZERO) <=0) {
			throw new ParametroIncorrectoException("La altura tiene que estarentre")
		}
		this.altura = altura;
	}
	

	

}
