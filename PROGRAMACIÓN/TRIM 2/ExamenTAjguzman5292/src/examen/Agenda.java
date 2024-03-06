package examen;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Agenda {
	private String medico;
	private List <Cita> citas; 
	
	   
	//a) Constructor
		public Agenda (String medico) {
			this.medico = medico;
			this.citas = new ArrayList<Cita>();
			
		}

		public String getMedico() {
			return medico;
		}

		public void addCita(Cita cita) {
			citas.add(cita);
		}
		public List<Cita> getCitasDias(LocalDate fecha) {
			return citas;
		}
		
		public BigDecimal getImportePendienteFacturar() {
			
			return ;
		}
		
		public Boolean tieneCitaPróxima(Paciente paciente) {
			
			return ;
		}
		
		public void borrarCitasFacturadas (boolean facturada) {
			if(facturada = true) { 
				citas.remove(Cita);
			}
		}
		
		public void citasPendientes(Paciente paciente){
			
		}
		
}
