package EJ44;

public class App {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//1	
		Asesino asesino1= new Asesino();
		asesino1.setNombre("Blau");
		asesino1.setCodigo("A1");
	
		Asesino asesino2= new Asesino();
		asesino2.setNombre("Situletienes");
		asesino2.setCodigo("A1");
	
		Asesino asesino3= new Asesino();
		asesino3.setNombre("ContructorAsesino");
		asesino3.setCodigo("A3");
	

		Jugador jugador =new Jugador();
		jugador.setNombre("TeamBlas");
		EquipoCombate equipo= new EquipoCombate();
		jugador.setEquipo(equipo);
		equipo.añadirPersonaje(asesino1);
		jugador.getEquipo().añadirPersonaje(asesino2);
		equipo.añadirPersonaje(asesino3);
		
		//2
		Parasito parasito = new Parasito();
		parasito.setCodigo("B69");
		parasito.setNombre("Blas");
		System.out.println(parasito.getDaño()+ " cada " +parasito.getDañoTiempo());
		
		//3
		jugador.getEquipo().añadirPersonaje(parasito);

		//4
		System.out.println("Puntos totales del equipo: ");
		jugador.getEquipo().getTotalPuntosVida();
		
		//5
		jugador.getEquipo().añadirPersonaje(parasito);
		System.out.println("Puntos totales del equipo: "+ jugador.getEquipo());
		
		//6
		System.out.println(jugador.getEquipo());	
		
		//7	
		Parasito parasito2= new Parasito();
		parasito2.setCodigo("B68");
		parasito2.setCodigo("Garrapata");
		Parasito parasito3= new Parasito();
		parasito3.setCodigo("B67");
		parasito3.setCodigo("Chinche");
		jugador.getEquipo().añadirPersonaje(parasito2);
		jugador.getEquipo().añadirPersonaje(parasito3);
		
		//8
		System.out.println(jugador.getEquipo());

		//9
		System.out.println("Puntos totales del equipo: "+ jugador.getEquipo().getTotalPuntosVida());
		
	}

}
