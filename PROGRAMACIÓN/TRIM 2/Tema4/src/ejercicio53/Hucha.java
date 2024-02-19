package ejercicio53;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DecimalFormat;

public class Hucha {

	private BigDecimal ahorro;
	
//Creo los métodos no puedo ponerlo static porque si no metería dinero en todos
	
	public Hucha() {
		this.ahorro = BigDecimal.ZERO;//esto iguala a cero
	}
	public  BigDecimal meterDinero(BigDecimal dinero) {
		this.ahorro = this.ahorro.add(dinero).setScale(2, RoundingMode.HALF_DOWN);
		return this.ahorro;
	}
	
	public  BigDecimal sacarDinero(BigDecimal sacar) {
		
		if (sacar.compareTo(ahorro)>0) { //si quiero sacar mas de lo que quiero
			BigDecimal sacado = ahorro;
			ahorro = BigDecimal.ZERO;
			return sacado;
		}
		ahorro = ahorro.subtract(sacar).setScale(2, RoundingMode.HALF_DOWN);
		return sacar; //este lo hace en el caso de que quiera sacar lo mismo o menos
	}
	
	public  BigDecimal contarDinero(BigDecimal ahorro) {
		return ahorro;
	}
	
	public  BigDecimal romperHucha(BigDecimal ahorro) {
		return sacarDinero (ahorro);
	}

	@Override
	public String toString() {
		DecimalFormat formato = new DecimalFormat.ofPattern ;
		return "";
	}
	
		
}
