package examen;

public class CitaRevison extends Cita {

	private Integer revision;

	public Integer getRevision() {
		return revision;
	}
	public void setRevision(Integer revision) {
		this.revision = revision;
	}
	public CitaRevison(String nombre, Boolean seguro, Boolean facturada) {
		super(nombre, seguro, facturada);
		// TODO Auto-generated constructor stub
	}

	
}
