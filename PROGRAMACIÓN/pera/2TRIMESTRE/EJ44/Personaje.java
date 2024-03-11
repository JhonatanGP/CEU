package EJ44;

import java.util.Objects;

public abstract class Personaje{
	private String nombre;
	private String codigo;
	
	
//GET Y SET
	public String getNombre(){
		return nombre;
	}
	public void setNombre(String nombre){
		this.nombre = nombre;
	}
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	
//EQUALS PERSONAJES
	@Override
	public int hashCode() {
		return Objects.hash(codigo, nombre);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Personaje other = (Personaje) obj;
		return Objects.equals(codigo, other.codigo);
	}
	
	
//ABSTRACT, ya que si quieres tener en cada clase un get daño o lo q sea la clase padre tiene que ser abstract
	public abstract Integer getPuntosVida();
	public abstract Integer getDaño();
	public abstract Integer getDañoTiempo();
	
	
}
