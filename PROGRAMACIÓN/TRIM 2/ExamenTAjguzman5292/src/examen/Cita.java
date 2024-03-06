package examen;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Objects;

public class Cita {
	
	private LocalDate fecha;
	private Integer hora;
	private String nombre;
	private Boolean seguro;
	private Boolean facturada;
	
	//a) Constructores
	public Cita (String nombre, Boolean seguro, Boolean facturada) {
		this.nombre = nombre;
		this.seguro = false;
		this.facturada = false;
	}
	
	public Cita (String nombre, LocalDate fecha, Integer hora, Boolean seguro, Boolean facturada) {
		this.nombre = nombre;
		this.fecha = fecha;
		this.hora = hora;
		this.seguro = false;
		this.facturada = false;
	}
	
	//b) get and set

	public LocalDate getFecha() {
		return fecha;
	}
	public void setFecha(LocalDate fecha) {
		this.fecha = fecha;
	}
	public Integer getHora() {
		return hora;
	}
	public void setHora(Integer hora) {
		this.hora = hora;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public Boolean getSeguro() {
		return seguro;
	}
	public void setSeguro(Boolean seguro) {
		this.seguro = seguro;
	}
	public Boolean getFacturada() {
		return facturada;
	}
	public void setFacturada(Boolean facturada) {
		this.facturada = facturada;
	}
		
	@Override
	public boolean equals(Object obj) {
		if(this ==obj)
			return true;
		if(obj == null)
			return false;
		if(getClass() != obj.getClass())
			return false;
		Cita other = (Cita)obj;
		return Objects.equals(fecha,hora);
	}
	
	//c) Métodos
	public BigDecimal getImporteFactura() {
		boolean cita;
		if(cita = true   ) {
			
		}
		else {
			
		}
		return facturada;
	}
	//toString
	@Override
	public String toString() {
		return "Cita [fecha=" + fecha + ", hora=" + hora + ", nombre=" + nombre + ", seguro=" + seguro + ", facturada="
				+ facturada + "]";
	}
	
	public LocalDate getDiasHastaCita() {
		LocalDate fecha = LocalDate.now();
		
		return fecha;
	}

	public void add(Cita cita) {
		
	}
	
	

}
