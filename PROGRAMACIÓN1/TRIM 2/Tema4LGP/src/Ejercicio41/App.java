package Ejercicio41;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class App {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		//Equipo local
		
		System.out.println("Como se llama el equipo local");
		String nombreEquipoLocal = scanner.nextLine();
		Equipo equipoLocal = new Equipo(nombreEquipoLocal);
		
		//crear lista
		List<Jugador> jugadoresEquipoLocal = new ArrayList<>();
		
		for (int i = 0; i < 3; i++) {
			// introducir datos
			// nombre
			System.out.println("Dime tu nombre");
			String nombreJugador = scanner.nextLine();

			// dorsal
			System.out.println("Dime tu numero de dorsal");
			Integer dorsal = scanner.nextInt();

			scanner.nextLine();

			// añadir a tipo jugador
			Jugador jugador = new Jugador(nombreJugador, dorsal);

			// añadir a la lista
			jugadoresEquipoLocal.add(jugador);

			// añadir al equipo
			equipoLocal.setJugadores(jugadoresEquipoLocal);
			// designar capitan
			if (i == 0) {
				equipoLocal.setCapitan(jugador);
			}
		}
		System.out.println(equipoLocal);
		
		
		//Equipo visitante
		System.out.println("Como se llama el equipo visitante");
		String nombreEquipoVisitante = scanner.nextLine();
		Equipo equipoVisitante = new Equipo(nombreEquipoVisitante);

		//crear lista
		List<Jugador> jugadoresEquipoVisitante = new ArrayList<>();
		for (int i = 0; i < 3; i++) {
			// introducir datos
			// nombre
			System.out.println("Dime tu nombre");
			String nombreJugador = scanner.nextLine();

			// dorsal
			System.out.println("Dime tu numero de dorsal");
			Integer dorsal = scanner.nextInt();

			scanner.nextLine();

			// añadir a tipo jugador
			Jugador jugador = new Jugador(nombreJugador, dorsal);
			
			
			// añadir a la lista
			jugadoresEquipoVisitante.add(jugador);

			// añadir al equipo
			equipoVisitante.setJugadores(jugadoresEquipoVisitante);
			// designar capitan
			if (i == 0) {
				equipoVisitante.setCapitan(jugador);
			}
		}
		System.out.println(equipoVisitante);
		
		//Resultados del partido
		Resultado resultadoPartido1 = new Resultado();
		resultadoPartido1.setGolesLocales(0);
		resultadoPartido1.setGolesVisitantes(0);
		
		//Partido
		Partido partido1 = new Partido(equipoLocal, equipoVisitante, resultadoPartido1);
		System.out.println(partido1);
		
		System.out.println("Cual es el resultado del equipo 1 en el partido?");
		Integer nuevoResultadoLocal = scanner.nextInt();
		resultadoPartido1.setGolesLocales(nuevoResultadoLocal);
		
		System.out.println("Cual es el resultado del equipo 2 en el partido?");
		Integer nuevoResultadoVisitante = scanner.nextInt();
		resultadoPartido1.setGolesLocales(nuevoResultadoVisitante);
		
		System.out.println(partido1.getEquipoGanador());
		
		Jugador jugador = new Jugador("Blas infiltrado", 99);
		jugadoresEquipoVisitante.add(jugador);
		equipoVisitante.setJugadores(jugadoresEquipoVisitante);
		
		//falta el punto 4 
		
		scanner.close();
	}
}
