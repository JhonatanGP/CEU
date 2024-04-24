package ej02.app;

import java.sql.SQLException;
import java.util.Scanner;

import ej01.modelo.Persona;
import ej01.servicios.PersonaService;

public class App {

	public static void main(String[] args) {

		PersonaService service = new PersonaService();
		
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Indica el DNI de la persona");
		String vDNI = sc.nextLine();
		
		try {
			Persona p = service.consultarPersona(vDNI);
			
			if (p == null) {
				System.out.println("No existe persona con los datos introducidos");
			} else {
				System.out.println(p);
			}
		} catch (SQLException e) {
			System.out.println("Exception en main: " + e.getMessage());
		}finally {
			sc.close();
		}
	}

}
