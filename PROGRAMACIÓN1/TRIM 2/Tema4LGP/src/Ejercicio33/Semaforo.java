package Ejercicio33;

public class Semaforo {
	// constantes
	public static final String ROJO = "rojo";
	public static final String VERDE = "verde";
	public static final String AMBAR = "ambar";
	// atributos
	private String color;
	private boolean parpadeando;

	// constructores
	public Semaforo() {
		this.color = ROJO;
		this.parpadeando = false;
	}

	// metodos
	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
		if (color.equals(ROJO) || color.equals(VERDE) || color.equals(AMBAR)) {
			this.color = color;
		}
	}

	public boolean getParpadeando() {
		return parpadeando;
	}

	public void setParpadeando(boolean parpadeando) {
		this.parpadeando = parpadeando;
		if (!color.equals(AMBAR) && parpadeando) {
			return;
		}
		this.parpadeando = parpadeando;
	}

	public void cambiarEstado() {
		if(color.equals(AMBAR)&& parpadeando==true) {
			color=AMBAR;
			parpadeando= false;
		}else if(color.equals(AMBAR)&& parpadeando == false) {
			color = ROJO;
			parpadeando =false;
		}else if(color.equals(ROJO)&& parpadeando == false) {
			color = VERDE;
			parpadeando =false;
		}else if(color.equals(VERDE)&& parpadeando == false) {
			color = AMBAR;
			parpadeando =true;
		}
	}
	
	
	//toString
	@Override
	public String toString() {
		if(color.equals(AMBAR) && parpadeando==true) {
			return "Semáforo en " + color + " parpadeando";
		}
		return "Semaforo en " + color; 
		
	}

}
