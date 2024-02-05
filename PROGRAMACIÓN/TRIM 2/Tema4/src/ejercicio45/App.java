package ejercicio45;

import java.time.LocalDate;
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
		
		
		
	}

}
