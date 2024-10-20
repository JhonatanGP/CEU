package Ejercicio41;

public class Partido {
	private Equipo equipoLocal;
	private Equipo equipoVisitante;
	private Resultado resultado;

	// constructores
	public Partido(Equipo equipoLocal, Equipo equipoVisitante, Resultado resultado) {
		super();
		this.equipoLocal = equipoLocal;
		this.equipoVisitante = equipoVisitante;
		this.resultado = resultado;
	}

	// metodos
	public Equipo getEquipoLocal() {
		return equipoLocal;
	}

	public void setEquipoLocal(Equipo equipoLocal) {
		this.equipoLocal = equipoLocal;
	}

	public Equipo getEquipoVisitante() {
		return equipoVisitante;
	}

	public void setEquipoVisitante(Equipo equipoVisitante) {
		this.equipoVisitante = equipoVisitante;
	}

	public Resultado getResultado() {
		return resultado;
	}

	public void setResultado(Resultado resultado) {
		this.resultado = resultado;
	}

	public Equipo getEquipoGanador() {
		if (resultado.isVictoriaLocal()) {
			return equipoLocal;
		} else if (resultado.isVictoriaVisitantes()) {
			return equipoVisitante;
		}
		return null;
	}
	// toString
	@Override
	public String toString() {
		return equipoLocal + " vs " + equipoVisitante + "[" + resultado + "]";
	}
}
