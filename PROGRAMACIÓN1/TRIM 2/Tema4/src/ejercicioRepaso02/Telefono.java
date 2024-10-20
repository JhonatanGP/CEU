package ejercicioRepaso02;

public class Telefono {
	
	private Integer numero;
	private Boolean enllamada;

	public Telefono(Integer numero) {
		this.numero=numero;
		this.enllamada=false;
	}
	
	public Integer getNumero() {
		return this.numero;
	}
	
	public void marcar(Integer numero) {
		
		System.out.println("LLAMANDO A ..." + numero);
		if(this.numero.equals(numero)) {
			System.out.println("COMUNICANDO");
		}
		else {
			System.out.println("EN COMUNICACION");
			this.enllamada=true;				
		}
		
	}
	
	public void colgar() {
		if(this.enllamada) {
			System.out.println("COMUNICACION TERMINADA");
			this.enllamada=false;
		}
	}


}
