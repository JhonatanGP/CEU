package ej02.app;

import java.sql.SQLException;
import java.util.List;
import java.util.Scanner;

import ej01.modelo.Persona;
import ej01.servicios.PersonaService;

public class App {

	public static void main(String[] args) {

		PersonaService service = new PersonaService();
		Scanner sc = new Scanner(System.in);
		
		try {
			// Por DNI
			//consultarPersona(service, scanner);

			System.out.println("Indica el DNI de la persona");
			String vDNI = sc.nextLine();
			Persona p = service.consultarPersona(vDNI);
			
			if (p == null) {
				System.out.println("No existe persona con los datos introducidos");
			} else {
				System.out.println(p);
			}
			// Filtro para buscar por nombre o apellidos

			//consultarPersonas(service, scanner);
				System.out.println("Indica nombre o apellidos a buscar:");
				String filtro = "";
				do {
					filtro = scanner.nextLine();
				} while (filtro.isEmpty());

				List<Persona> lista = service.consultarPersonas(filtro);
				if(lista.isEmpty())
						System.out.println("No hay ninguna persona con ese filtro");
				for (Persona persona : lista) {
							System.out.println(persona);
						}

		} catch (SQLException e) {
			System.out.println("Exception en main: " + e.getMessage());
		}finally {
			sc.close();
		}
	}

}
