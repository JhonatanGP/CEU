package EjercicioRepaso;

	public class Caballo {


		
		private String nombre;
		private String color;
		private int edad;
		private int carrerasGanadas;
		
		
		//5
		
		public void  imprimeCarreras() {
			System.out.println("El número de carreras ganadas es: "+ carrerasGanadas);
		}
		
		
		public Integer añoNacimiento() {
			
			return 2024 - edad;
		}
	
	
		public void IncrementarCarrerasGanadas() {
		
		this.carrerasGanadas= carrerasGanadas+1;
	}


		public int getCarrerasGanadas() {
			return carrerasGanadas;
		}


		public void setCarrerasGanadas(int carrerasGanadas) {
			this.carrerasGanadas = carrerasGanadas;
		}


	//9
	public void relincha(){
		System.out.println("HIIIIIIEEE");
		
	}
	//10

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


	public int getEdad() {
		return edad;
	}


	public void setEdad(int edad) {
		this.edad = edad;
	}
		
	//12 Método to string
	

	
	@Override
		public String toString() {
			return "Caballo [nombre=" + nombre + ", color=" + color + ", edad=" + edad + ", carrerasGanadas="
					+ carrerasGanadas + "]";
		}
	//13 constructor

	public Caballo(String nombre, String color, int edad, int carrerasGanadas) {
		super();
		this.nombre = nombre;
		this.color = color;
		this.edad = edad;
		this.carrerasGanadas = carrerasGanadas;
	}

	
	public Caballo(){
		this.nombre= "";
		color="";
		this.edad= 0;
		this.carrerasGanadas=0;
	}
	
	
}
