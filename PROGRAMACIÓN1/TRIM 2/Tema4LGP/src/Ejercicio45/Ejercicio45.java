package Ejercicio45;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.Scanner;

public class Ejercicio45 {

	// Crea un programa que solicite al usuario su fecha de nacimiento
	public static void main(String[] args) {
		// importar scanner y localdate
		Scanner scanner = new Scanner(System.in);
		
		// Creamos la fecha
		LocalDate fechaU;
		LocalDate hoy = LocalDate.now();

		// 1. Si la fecha no es correcta, vuelve a solicitarla hasta que lo sea.
		Boolean diaBueno = false;
		Boolean mesBueno = false;
		Boolean yearBueno = false;
		do {
			System.out.println("Dime tu fecha de nacimiento en formato /");
			String fechaUString = scanner.nextLine();

			// aplicar formato
			DateTimeFormatter formato = DateTimeFormatter.ofPattern("dd/MM/yyyy");
			fechaU = LocalDate.parse(fechaUString, formato);

			// sacamos dia, mes, a�o de la fecha
			Integer dia = fechaU.getDayOfMonth();
			Integer mes = fechaU.getMonthValue();
			Integer year = fechaU.getYear();

			// comprobar dia
			if (dia >= 1 || dia <= 31) {
				diaBueno = true;
			}
			// comprobar mes
			else if (mes >= 1 || mes <= 12) {
				mesBueno = true;
			}
			// comprobar year
			else if (year >= 1000 || year <= 2024) {
				yearBueno = true;
			} else {
				System.out.println("Fecha incorrecta");
			}

		} while (diaBueno == true && mesBueno == true && yearBueno == true);
		System.out.println("La fecha es correcta");

		// 2. Dile si naci� o no en un a�o bisiesto.
		// Boolean bisiesto = fechaU.isLeapYear();
		if (fechaU.isLeapYear() == true) {
			System.out.println("Has nacido en un year bisiesto");
		} else {
			System.out.println("No has nacido en un year bisiesto");
		}

		// 3. Dile el d�a de la semana en el que naci�.
		DayOfWeek dia = fechaU.getDayOfWeek();
		System.out.println("Naciste un " + dia);

		// 4. Dile cu�ntos a�os tiene.
		Period edad = fechaU.until(hoy);
		System.out.println("Tienes " + edad.getYears() + " a�os");

		// Dile, suponiendo que va a vivir exactamente 100 a�os, cu�nto tiempo de vida
		// le queda
		LocalDate muerte = fechaU.plusYears(100);
		edad = hoy.until(muerte);
		System.out.println("Vas a vivir: " + edad.getDays() + " dias " + edad.getMonths() + " meses " + edad.getYears()
				+ " years m�s");

		// Dile, ya de regalo, que hora es ahora en formato hora/minuto/segundo con 24
		// horas.
		DateTimeFormatter formatoH = DateTimeFormatter.ofPattern("HH:MM:SS");
		String hora = LocalDateTime.now().format(formatoH);
		System.out.println("Son las: " + hora + " horas");

		scanner.close();
	}

}
