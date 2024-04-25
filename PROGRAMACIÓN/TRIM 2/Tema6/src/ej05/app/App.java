package ej05.app;

import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.List;
import java.util.Scanner;

import ej05.modelo.Persona;
import ej05.services.DatosIncompletosException;
import ej05.services.PersonasService;

public class App {

	private static Scanner scanner;
	private static PersonasService service;

	public static void main(String[] args) {

		try {
			service = new PersonasService();
			scanner = new Scanner(System.in);

			String opcionElegida = "";

			do {

				opcionElegida = mostrarMenu();

				switch (opcionElegida) {
				case "1":
					consultarPersonaPorDni();
					break;

				case "2":
					consultarPersonasPorFiltro();
					break;

				case "3":
					insertaPersona();
					break;

				case "4": {
					actualizarPersona();
					break;
				}
				case "5": {
					borrarPersona();
					break;
				}

				case "0":
					System.err.println("Has salido del men");
					break;
				default:
					System.out.println("La opcin elegida no es correcta");
				}

			} while (!opcionElegida.equals("0"));

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			scanner.close();
		}
	}

	private static String mostrarMenu() {

		System.out.println("-----------------------------");
		System.out.println("Elige una de estas opciones: ");
		System.out.println("\t (1) Buscar persona por DNI");
		System.out.println("\t (2) Buscar personas por nombre/apellidos");
		System.out.println("\t (3) Insertar persona");
		System.out.println("\t (4) Actualizar persona");
		System.out.println("\t (5) Borrar persona");
		System.out.println("\t (0) Salir");
		System.out.println("-----------------------------");
		String opcion = scanner.nextLine();

		return opcion;
	}

	private static void consultarPersonaPorDni() throws SQLException {

		System.out.println("Indica el DNI  de la persona:");
		String dni = scanner.nextLine();

		Persona persona = service.consultarPersona(dni);
		if (persona == null) {
			System.out.println("No existe persona con los datos solicitados");
		} else {
			System.out.println(persona);
		}
	}

	private static void consultarPersonasPorFiltro() throws SQLException {

		System.out.println("Indica el filtro por el que buscar:");
		String filtro = "";
		filtro = scanner.nextLine();

		List<Persona> personas = service.consultarPersonas(filtro);

		System.out.println("Resultados:");
		for (Persona persona : personas) {
			System.out.println(persona);
		}

	}

	private static void insertaPersona() throws SQLException {

		Persona p = solicitarDatosPersona();
		service.insertarPersona(p);
	}

	private static void borrarPersona() throws SQLException {
		System.out.println("Indica el DNI de la persona:");
		String dni = scanner.nextLine();

		Integer cantBorrada = service.borrarPersona(dni);
		if (cantBorrada == 0) {
			System.out.println("El DNI indicado no est registrado. No se ha borrado nada");
		}

	}

	private static void actualizarPersona() throws SQLException {
		Persona persona = solicitarDatosPersona();

		Integer cantActualizada = service.actualizarPersona(persona);
		if (cantActualizada == 0) {
			System.out.println("El DNI indicado no est registrado. No se ha actualizado nada");
		}

	}

	private static Persona solicitarDatosPersona() {
		Persona p = new Persona();
		Boolean error = false;
		do {
			error = false;
			System.out.println("Indica el DNI de la persona:");
			p.setDni(scanner.nextLine());

			System.out.println("Indica el NOMBRE de la persona:");
			p.setNombre(scanner.nextLine());

			System.out.println("Indica el APELLIDO de la persona:");
			p.setApellidos(scanner.nextLine());

			System.out.println("Indica la FECHA NACIMIENTO (dd/MM/yyyy) de la persona:");

			String fecha = scanner.nextLine();

			DateTimeFormatter format = DateTimeFormatter.ofPattern("dd/MM/yyyy");
			try {
				LocalDate fechaNacimiento = LocalDate.parse(fecha, format);
				p.setFechaNacimiento(fechaNacimiento);
			} catch (DateTimeParseException e) {
				System.out.println("La fecha indicada no es correta. Empieza de nuevo");
				error = true;
			}

			if (!error) {
				try {
					p.validar();
				} catch (DatosIncompletosException e) {
					System.out.println("Los datos no estn completos.");
					error = true;
				}
			}
		} while (error);
		return p;
	}
}
