package EJ53;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DecimalFormat;

public class Hucha {


	private BigDecimal ahorros;
	
	public Hucha() {
		ahorros= BigDecimal.ZERO;
	}
	
	
	//meterDinero() que recibe un BigDecimal con el importe a introducir y nos devuelve otro BigDecimal con el importe que quedará en la Hucha 
	public BigDecimal meterDinero(BigDecimal dinero){
	this.ahorros=this.ahorros.add(dinero).setScale(2, RoundingMode.HALF_DOWN);
	return this.ahorros;
	}
	
	//sacarDinero() que recibe un BigDecimal con el importe a sacar y nos devuelve otro BigDecimal con el importe finalmente sacado. Si se intenta sacar más dinero del que hay, sólo se sacará lo que haya. 
	public BigDecimal sacarDinero(BigDecimal sacar){
		if(sacar.compareTo(ahorros)>0) {
			BigDecimal sacado=ahorros;
			ahorros =BigDecimal.ZERO;
			return sacado;
			}
			ahorros=ahorros.subtract(sacar).setScale(2,RoundingMode.HALF_DOWN);
			return sacar;	
		}	
	
	//contarDinero() que nos devuelve un BigDecimal con el importe que tenemos en la Hucha. 
	public BigDecimal contarDinero( ){
	return ahorros;
	}
	
	//romperHucha() saca todo el dinero de la Hucha y nos devuelve un BigDecimal con todo lo sacado. 
	public BigDecimal romperHucha() {
	return sacarDinero(ahorros);
	}



	//toString() que imprime el importe que hay en la Hucha con separadores decimales y de miles, siempre con dos decimales rellenos y al menos un dígito entero, y el símbolo del euro. Ejemplos: “0,35 €”, “123,40€”, “1.123,00 €”
	@Override
	public String toString() {
		DecimalFormat formato= new DecimalFormat("#,##0.00 ");
		return formato.format(ahorros);
	}
	
} 