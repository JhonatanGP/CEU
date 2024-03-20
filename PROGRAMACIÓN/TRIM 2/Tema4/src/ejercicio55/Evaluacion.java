package ejercicio55;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;


public class Evaluacion {
	
	private static final BigDecimal NOTA_APROBADO = null;
	private Map<String, BigDecimal> notas ;
	
	
	//a) Constructor
			public Evaluacion ()  {
				this.notas= new HashMap<String, BigDecimal>();
			}
	
	
/*1 addNota() que reciba el dni del alumno, su nota, y lo añada al mapa. Si ya tenemos registrada una nota para el mismo
alumno, no haremos nada (no sobrescribimos). El método debe devolver un booleano indicando si finalmente hemos añadido 
o no algo al mapa. */	
			public boolean addNota(String dni, BigDecimal nota) {
				if(this.notas.containsKey(dni)) {
					notas.put(dni,nota);
					return false;
				}
				else {
					notas.put(dni,nota);
					return true;
				}
			}
	
/*2.corregirNota() que reciba el dni del alumno y su nota. Si ya tenemos para el alumno una nota, la cambiamos. Si no tenemos
ninguna, no hacemos nada. El método debe devolver un booleano indicando si finalmente hemos corregido algo o no en el mapa. */
			public boolean corregirNota(String dni, BigDecimal nota) {
				if(this.notas.containsKey(dni)) {
					notas.put(dni,nota);
					return true;
				}
					return false;
			}
	
/*3. obtenerNotaAlumno() que recibe un dni y devuelve la nota de ese alumno. Si no la
tuviéramos registrada, devolveremos un 0.*/
			
			public boolean obtenerNotaAlumno(String dni) {
				if(this.notas.containsKey(dni)) {
					return notas.get(dni);
				}
					
				
			}
/*4. obtenerNotaMedia() que no recibe nada y devuelve un BigDecimal con la nota media
calculada de todos los alumnos.	*/
			public Integer obtenerNotaMedia() {
				return null;
	
			}
/*5. obtenerCantidadAprobados() que devuelva un entero con la cantidad de alumnos que
tengan al menos un 5. */
			public Integer obtenerCantidadAprobados() {
				//return notas.size()-obtenersuspensos();(usando el metodo siguiente
				Integer cantidad = 0;
				Collection<BigDecimal>listaNotas = notas.values();
				for(BigDecimal nota : listaNotas) {
					
				}
				return cantidad;
			}
	
/*6. obtenerSuspensos() que devuelva una lista con todos los DNIs de los alumnos 	suspensos. */
			public List<String> obtenerSuspensos() {
				List<String> suspensos = new ArrayList<>();
				Set<String>dnis = notas.keySet();
				for (String dni : dnis) {
					if(notas.get(dni).compareTo(NOTA_APROBADO) <0) {
						
					}
				}
				return suspensos;
			}
/*7. borrarAprobados() que borre todos los alumnos del mapa que estén aprobados.*/
			public void borrarAprobados() {
				Set<String>dnis = notas.keySet();
				Iterator<String>it = dnis.iterator();
				while (it.hasNext()) {
					String dni = (String) it.next();
					if(notas.get(dni).compareTo(NOTA_APROBADO) >= 0) {
						it.remove();
					}
				}
			}
/*8. toString() que imprima el listado con este formato: */


			@Override
			public String toString() {
			DecimalFormat ft = new DecimalFormat("#.0");
			String aprobados = ("Aprobados:\n");
			String suspensos = ("Suspensos:\n");
			
			Set<String>dnis = notas.keySet();
			for(dni : dnis) {
				if(notas.get(dni).compareTo(NOTA_APROBADO) >= 0) {
					
				}
				
			}
					

			}


}
