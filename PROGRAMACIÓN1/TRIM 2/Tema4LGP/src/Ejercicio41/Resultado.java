package Ejercicio41;

import java.util.Objects;

public class Resultado {
	private Integer golesLocales;
	private Integer golesVisitantes;

	// constructores
	public Resultado() {
		this.golesLocales = 0;
		this.golesVisitantes = 0;
	}

	// metodos
	public Integer getGolesLocales() {
		return golesLocales;
	}

	public void setGolesLocales(Integer golesLocales) {
		this.golesLocales = golesLocales;
	}

	public Integer getGolesVisitantes() {
		return golesVisitantes;
	}

	public void setGolesVisitantes(Integer golesVisitantes) {
		this.golesVisitantes = golesVisitantes;
	}

	public Boolean isVictoriaLocal() {
		return golesLocales > golesVisitantes;
	}

	public Boolean isVictoriaVisitantes() {
		return golesVisitantes > golesLocales;
	}

	public Boolean isEmpate() {
		return golesVisitantes == golesLocales;
	}

	// equals
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Resultado other = (Resultado) obj;
		return Objects.equals(golesLocales, other.golesLocales)
				&& Objects.equals(golesVisitantes, other.golesVisitantes);
	}

	// toString
	@Override
	public String toString() {
		return golesLocales + " - " + golesVisitantes;
	}

}
