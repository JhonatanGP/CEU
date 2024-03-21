package EJRepaso3;

public class telefono {
	private Integer numero;
	private Boolean llamada;


	
/*1 consultarNumero() -->Devuelve el número de teléfono*/
	private  Integer consultarNumero(Integer numero){
		this.numero=numero;
		return numero;
	}
	
/*2 Recibe un número de teléfono. 
	a. Debe imprimir “LLAMANDO A … “ y el número recibido.
	b. Si el número recibido es igual al del propio teléfono, imprimirá “COMUNICANDO” y no hará nada más.
	c. En caso contrario, imprimirá “EN COMUNICACIÓN”, y cambiará su atributo enLlamada a true.*/
	public void marcar(Integer numero, Boolean llamada){
		this.numero=numero;
			if(!this.equals(llamada)) {
				System.out.println("LLAMANDO A "+ numero);
			}
			if(this.numero.equals(llamada)){
				System.out.println("COMUNICANDO");
			}else {
				System.out.println("EN COMUNICACIÓN");
				llamada =true;
		}
	}
	
/*3 colgar() -->  No recibe ni devuelve nada.
a. Si estaba enLlamada  debe imprimir “COMUNICACIÓN TERMINADA” y cambiar el atributo enLlamada a false.
b. Si no estaba enLlamada, no hará nada.*/
	public void colgar(Boolean llamada) {
		if(!numero.equals(llamada)){
			System.out.println("COMUNICACIÓN TERMINADA");
			llamada= false;	
		}else{
			return;
		}	
	}

	public Boolean getLlamada() {
		return llamada;
	}

	public void setLlamada(Boolean llamada) {
		this.llamada = llamada;
	}
	
	
	
	
	
	
	
}
