package EjercicioRepaso02;

public class Telefono {
	protected int numeroTlf;
	protected Boolean enLlamada;

	// constructor
	public Telefono(int numeroTlf) {
		this.numeroTlf = numeroTlf;
		this.enLlamada = false;
	}

	// metodos
	// Devuelve el número de teléfono
	public int consultarNumero() {
		return numeroTlf;
	}

	// Recibe un número de teléfono.
	public void marcar(int numeroRecibido) {

		// Debe imprimir “LLAMANDO A … “ y el número recibido
		System.out.println("Llamando a " + numeroRecibido);

		if (numeroRecibido == numeroTlf) {
			System.out.println("COMUNICANDO");
		} else {
			System.out.println("EN COMUNICACIÓN");
			this.enLlamada = true;
		}

	}

	// No recibe ni devuelve nada
	public void colgar() {
		if (enLlamada == true) {
			System.out.println("COMUNICACIÓN TERMINADA");
			this.enLlamada = false;
		}
	}
	@Override
	public String toString() {
		return "Telefono [numeroTlf=" + numeroTlf + ", enLlamada=" + enLlamada + "]";
	}

}
