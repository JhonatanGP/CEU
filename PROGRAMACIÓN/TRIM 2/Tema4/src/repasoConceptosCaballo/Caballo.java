package repasoConceptosCaballo;

//7. Crear una clase pública: Caballo
public class Caballo {
	//8. En la clase Caballo, crear 4 atributos privados: nombre, color, edad y carrerasGanadas
	private String nombre;
	private String color;
	private Integer edad;
	private Integer carrerasGanadas;
	
//12. Crear un método público en la clase Caballo: imprimeCarrerasGanadas() que 
//	  escriba por pantalla lo siguiente: “El número de carreras ganadas es: ” carrerasGanadas.
	  public void imprimeCarrerasGanadas() {
		System.out.println("El numero de carreras ganadas es: " + this.carrerasGanadas);
	  }
//15. Crear un método público en la clase Caballo: anyoNacimiento() que devuelve el año del nacimiento del caballo.
	  public Integer yearNacimiento() {
		  return 2024-edad;
	  }
//18. Crear un método público incrementarCarrerasGanadas que incremente en una unidad el numero de carrerasGanadas.
	  public void incrementarCarrerasGanadas() {
		carrerasGanadas= +1;
	  }
//21. Escribir un método en la clase Caballo: relincha() que escriba por pantalla: “Hiiiiiiieeeeee”.
	  public void relincha() {
		  System.out.println("Hiiiiiiiiiiieeeeeeeeeee");
	  }
//24.26.28.30 Crear todos los get and set para poder asignar y recuperar el nombre del caballo, etc.
		public String getNombre() {
			return nombre;
		}
		public void setNombre(String nombre) {
			this.nombre = nombre;
		}
		public String getColor() {
			return color;
		}
		public void setColor(String color) {
			this.color = color;
		}
		public Integer getEdad() {
			return edad;
		}
		public void setEdad(Integer edad) {
			this.edad = edad;
		}
		public Integer getCarrerasGanadas() {
			return carrerasGanadas;
		}
		public void setCarrerasGanadas(Integer carrerasGanadas) {
			this.carrerasGanadas = carrerasGanadas;
		}
//32. Escribir un método público en la clase Caballo: toString() que devuelva en una cadena todos los datos del caballo de esta manera:
//	Caballo [nombre=" + nombre + ", color=" + color + ", edad=" + edad + ", carreras Ganadas=" + this.carrerasGanadas +"]";
		@Override
		public String toString() {
			return "Caballo [nombre=" + nombre + ", color=" + color + ", edad=" + edad + ", carrerasGanadas=" + this.carrerasGanadas + "]";
		}
	  
		//creo un constructor con parametros
	
	//constructor vacio: 
		public Caballo() {
			this.nombre="";
			this.color="";
			this.edad=0;
			this.carrerasGanadas=0;	
		}
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

}

