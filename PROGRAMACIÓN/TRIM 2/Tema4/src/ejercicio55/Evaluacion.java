package ejercicio55;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class Evaluacion {
	
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
				return null;

			}
	
	/*6. obtenerSuspensos() que devuelva una lista con todos los DNIs de los alumnos 	suspensos. */
			public List<String> obtenerSuspensos() {
				List<String> suspensos = new ArrayList();
				return null;
			}
	/*7. borrarAprobados() que borre todos los alumnos del mapa que estén aprobados.*/
	
	/*8. toString() que imprima el listado con este formato: */


}
