package EJ41;

public class Partido {
	private Equipo equipoLocal;
	private Equipo equipoVisitante;
	private Resultado resultado;
	
	public Partido() {
	}
	
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
	
	@Override
	public String toString() {
		return equipoLocal.getNombre() 
				+ " vs " + equipoVisitante.getNombre() 
				+ " " + resultado;
	}
	
	public Equipo getEquipoGanador() {
		if(resultado.isVictoriaLocal()) {
			return equipoLocal;
		}
		else if(resultado.isVictoriaVisitante()) {
			return equipoVisitante;
		}
		return null; // empate
	}
}

