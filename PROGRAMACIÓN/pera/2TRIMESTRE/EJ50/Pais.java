package EJ50;

import java.util.Objects;

public class Pais {
	private String codigo;
	private String descripción;
	

	
	//get y set
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public String getDescripción() {
		return descripción;
	}
	public void setDescripción(String descripción) {
		this.descripción = descripción;
	}
	
	
	//toString
	@Override
	public String toString() {
		return "Pais [codigo=" + codigo + ", descripción=" + descripción + "]";
	}
	
	//Constructor único que reciba los dos atributos.
	public Pais(String codigo, String descripción) {
		super();
		this.codigo = codigo;
		this.descripción = descripción;
	}
	
	//Método equals() hay que poner el UpperCase en todos los lados para que no falle 
	@Override
	public int hashCode() {
		return Objects.hash(codigo.toUpperCase());
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Pais other = (Pais) obj;
		return Objects.equals(codigo.toUpperCase(), other.codigo.toUpperCase());
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
