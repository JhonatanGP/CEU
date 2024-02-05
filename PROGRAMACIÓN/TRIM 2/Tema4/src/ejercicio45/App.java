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
			

		}
		
	}

}
