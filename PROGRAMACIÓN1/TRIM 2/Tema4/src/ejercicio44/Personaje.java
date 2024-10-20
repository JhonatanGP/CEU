package ejercicio44;

import java.util.Objects;

public abstract class Personaje {
	private String nombre;
	private String codigo;
	private String equipoCombate;

	public abstract Integer getPuntosVida();
	public abstract Integer getDaño();
	public abstract Integer getDañoTiempo();
	
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public String getEquipoCombate() {
		return equipoCombate;
	}
	public void setEquipoCombate(String equipoCombate) {
		this.equipoCombate = equipoCombate;
	}
	
	

}
