package ejercicio45;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.Scanner;

public class App {

	public static void main(String[] args) {
		Boolean correcto = false;
		LocalDate hoy = LocalDate.now();
		LocalDate nacimiento;
		Scanner scanner = new Scanner(System.in);
		
		do {
			System.out.println("Introduce tu fecha de nacimiento");
			String fecha = scanner.nextLine();
			
			Integer dia = Integer.parseInt(fecha.split("/")[0]);
			Integer mes = Integer.parseInt(fecha.split("/")[1]);
			Integer ano = Integer.parseInt(fecha.split("/")[2]);
			
			nacimiento = LocalDate.of(ano, mes, dia);
			
			if(dia >= 1 && dia <= 31 && mes >= 1 && mes <= 12 && ano<= hoy.getYear()) {
				correcto = true;
			}
			
			else System.out.println("¿Fecha correcta?");
			
		}while(!correcto);
		
		System.out.println("¿Naciste en un año bisiesto? " + nacimiento.isLeapYear());
		System.out.println("Naciste un " + nacimiento.getDayOfWeek());
		
		Period periodo = nacimiento.until(hoy);
		System.out.println("Tienes " + periodo.getYears() + " años");
		
		LocalDate muerte = nacimiento.plusYears(100);
		periodo = hoy.until(muerte);
		System.out.println("Te quedan: " + periodo.getYears() + " años" + periodo.getMonths()+ " meses"+ periodo.getDays()+ " dias");
		
		LocalTime hora = LocalTime.now();
		DateTimeFormatter formato = DateTimeFormatter.ofPattern("HH:mm:ss");
		System.out.println("Hora actual: " + formato.format(hora));
		
		scanner.close();
		
			
	}

}
