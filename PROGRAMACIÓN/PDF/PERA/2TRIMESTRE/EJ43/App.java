package EJ43;

import java.util.ArrayList;
import java.util.List;

public class App {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
//Actores(4)
	actores actor1= new actores();
	actor1.setNombre("Blas Blau");
	actor1.setNacionalidad("España");
	actor1.setAñoNacimiento(1983);
	
	

	actores actor2= new actores();
	actor2.setNombre("Laura Pozo");
	actor2.setNacionalidad("Italia");
	actor2.setAñoNacimiento(1981);
	
		
	actores actor3= new actores();
	actor3.setNombre("Marcel Cade");
	actor3.setNacionalidad("Suiza");
	actor3.setAñoNacimiento(2001);
	

	actores actor4= new actores();
	actor4.setNombre("Violeta Volo");
	actor4.setNacionalidad("Rusia");
	actor4.setAñoNacimiento(1999);
	
//Guionistas(2)		
	guionistas guionista1=new guionistas();
	guionista1.setNombre("Marco Smith");
	guionista1.setAñoNacimiento(1988);
	guionista1.setNacionalidad("Reino Unido ");
		
	guionistas guionista2=new guionistas();
	guionista2.setNombre("Cheng Shu");
	guionista2.setAñoNacimiento(1977);
	guionista2.setNacionalidad("China");
		
//Directores(1)		
	directores director1=new directores();
	director1.setNombre("Sara Marea");
	director1.setAñoNacimiento(1994);
	director1.setNacionalidad("Portugal");
	
//Película(2)	
	Peliculas pelicula1 =new Peliculas();
	pelicula1.setTitulo("Do you know Joe Blas?");
	pelicula1.setAñoEstreno(2027);
	pelicula1.setDirector(director1);
	pelicula1.setGuionista(guionista1);
	
	List<actores> miLista =new ArrayList<>();
	miLista.add(actor1);
	miLista.add(actor2);
	pelicula1.setActores(miLista);
	
	//5
	Peliculas pelicula2 =new Peliculas();
	pelicula2.setTitulo("Muerte en la sombra");
	pelicula2.setAñoEstreno(2027);
	pelicula2.setDirector(director1);
	pelicula2.setGuionista(guionista2);
	
	pelicula2.getActores().add(actor1);
	pelicula2.getActores().add(actor2);
	pelicula2.getActores().add(actor3);
	pelicula2.getActores().add(actor4);
	//6
	System.out.println(pelicula1.getActores());
	
	//7
	System.out.println("Película 1. Guionista; ");
	System.out.println("\tSueldo: "+pelicula1.getGuionista().getSueldo());
	System.out.println("\tOrigen: "+ pelicula1.getGuionista().getNacionalidad());
	//8
	pelicula2.getActores().remove(actor3);
	pelicula1.getActores().add(actor3);
	//9
	System.out.println(pelicula1.getActores());
	System.out.println(pelicula2.getActores());
	}

}
