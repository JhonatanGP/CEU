package ejercicio7;

import java.math.BigDecimal;

public class Persona {
	private String genero;
	private BigDecimal altura;
	
	public String getGenero() {
		return genero;
	}
	public void setGenero(String genero) throws ParametroIncorrectoException {
		genero = genero.toUpperCase();
		if(!genero.equals("H") && !genero.equals("M")) {
			throw new ParametroIncorrectoException("El género tiene que ser ");
		}
		this.genero = genero;
		
	}
	public BigDecimal getAltura() {
		return altura;
	}
	public void setAltura(BigDecimal altura) throws ParametroIncorrectoException {
		if (altura.compareTo(new BigDecimal (3))>=0 ||altura.compareTo(BigDecimal.ZERO) <=0) {
			throw new ParametroIncorrectoException("La altura tiene que estarentre");
		}
		this.altura = altura;
	}
	@Override
	public String toString() {
		return "Persona [genero=" + genero + ", altura=" + altura.toString() + "]";
	}
	
	

	

}
