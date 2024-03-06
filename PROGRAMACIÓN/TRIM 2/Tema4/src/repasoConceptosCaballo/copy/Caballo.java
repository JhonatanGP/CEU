package repasoConceptosCaballo.copy;
public class Caballo {

	// atributos
	private String nombre;
	private int edad;
	private String color;
	private int carrerasGanadas;

	// metodos
	public void imprimeCarrerasGanadas() {
		System.out.println("El numero de carreras ganadas es: " + this.carrerasGanadas);
	}

	public int yearNacimiento() {
		return 2024 - edad;
	}

	public void incrementarCarrerasGanadas() {
		carrerasGanadas += 1;
	}

	public void relincha() {
		System.out.println("Hiiiiiiieeeeee");
	}

	// geters and setters: metodos
	public int getEdad() {
		return edad;
	}

	public void setEdad(int edad) {
		this.edad = edad;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public int getCarrerasGanadas() {
		return carrerasGanadas;
	}

	public void setCarrerasGanadas(int carrerasGanadas) {
		this.carrerasGanadas = carrerasGanadas;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	//metodo toString
	@Override
	public String toString() {
		return "Caballo [nombre=" + nombre + ", edad=" + edad + ", color=" + color + ", carrerasGanadas="
				+ carrerasGanadas + "]";
	}

	//constructores
	//constructor con parametros:
	public Caballo(String nombre, int edad, String color, int carrerasGanadas) {
		super();
		this.nombre = nombre;
		this.edad = edad;
		this.color = color;
		this.carrerasGanadas = carrerasGanadas;
	}
	//constructor vacio: 
	public Caballo() {
		this.nombre="";
		this.color="";
		this.edad=0;
		this.carrerasGanadas=0;
	}
	
	

}
