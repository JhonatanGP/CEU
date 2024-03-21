package Semáforo;

public class Semáforo {
//CONSTANTE
	public static final String ROJO="ROJO";
	public static final String VERDE="VERDE";
	public static final String AMBAR="AMBAR";

	
	private String color;
	private Boolean parpadeando;
	
	
	
	//Constructor por defecto, es constructor sin parámetros, pero inicializa a lo que te pide el ejercicio
	
	public Semáforo(){
		this.color=ROJO;
		this.parpadeando=false;
	}


  //crear get y set de atributos, (Las constantes no se escriben)
	
	public String getColor() {
		return color;
	}
	
	/* Cuando se intente cambiar el color, si se indica un color no válido, entonces no
	se modificará el atributo. Si se indica un color no válido que no se cambie.
	
	Antiguo------>public String setColor() {
		this.color= color;
	}
	Nuevo------> public void setColor(String color) {
		if(this.color != ROJO || this.color != VERDE || this.color != AMBAR) {
			
		}else {
			this.color = color;
		}		
	}
	*/
	public void setColor(String color) {
		if(color.equals(ROJO) || color.equals(VERDE)||color.equals(AMBAR)){
			
			this.color=color;
		}
			
	}
	
	public Boolean getParpadeando() {
		return parpadeando;
	}
	/*Cuando se intente cambiar el estado de parpadeo, si se intenta activar el
	parpadeo cuando el color es distinto a Ámbar, entonces no se modificará. */
	
	public void setParpadeando(Boolean parpadeando) {
	if(parpadeando && !color.equals(AMBAR)) {
		return;
	}
	this.parpadeando=parpadeando;
	}


	@Override
	public String toString() {
		if(color.equals(AMBAR) && parpadeando) {
			return "Semáforo en "+ AMBAR+ " parpadeando";
		}
		return "Semáforo en "+ color;
	
	}
	public void cambiarEstado() {
		if(color.equals(VERDE)) {
			color= AMBAR;
			parpadeando=true;
			
		}else if (color.equals(AMBAR)&& parpadeando) {
			parpadeando=false;
			
		}else if(color.equals(AMBAR)) {
			color=ROJO;
		}else {
			color=VERDE;
		}
	}
}
	
	

