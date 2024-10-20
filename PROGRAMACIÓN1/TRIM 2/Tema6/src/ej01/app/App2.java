package ej01.app;

import java.sql.SQLException;
import java.util.Scanner;

import ej01.modelo.Persona;
import ej01.servicios.PersonaService;
import ej01.servicios.PersonaService2;

public class App2 {

	public static void main(String[] args) {

		PersonaService2 service = new PersonaService2();
		
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
