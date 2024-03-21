package EJ45;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.Scanner;

public class App {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Boolean correcto=false;
		LocalDate hoy= LocalDate.now();
		LocalDate nacimiento;
		Scanner scanner = new Scanner(System.in);
		
	do{	
		//1º Si la fecha no es correcta, vuelve a solicitarla hasta que lo sea.
		System.out.println("Escriba su fecha de nacimiento con /");
			String fecha = scanner.nextLine();
				Integer dia=Integer.parseInt(fecha.split("/")[0]);
				Integer mes=Integer.parseInt(fecha.split("/")[1]);
				Integer año=Integer.parseInt(fecha.split("/")[2]);
				nacimiento= LocalDate.of(año, mes,dia);
			
			if(dia>=1 && dia<=31 && mes>=1 && mes<=12 && año<=hoy.getYear()) {
				correcto=true;
	
			}else 
			System.out.println("¿Fecha correcta?");
	
				System.out.println("Que dia de la semana naciste");
				String diaSemana = scanner.nextLine();
				System.out.println("¿Cuántos años tienes?");
				Integer edad =scanner.nextInt();
	
		}while(!correcto);
	
			//2º Dile si nació o no en un año bisiesto. 
				System.out.println("¿Naciste en un año bisiesto? "+ nacimiento.isLeapYear());
			
			//3º Dile el día de la semana en el que nació. 
				System.out.println("Naciste un "+ nacimiento.getDayOfWeek());
			
			//4º Dile cuántos años tiene.
				Period periodo =nacimiento.until(hoy);
				System.out.println("Tienes "+ periodo.getYears()+ " años.");
			
			//5º Dile, suponiendo que va a vivir exactamente 100 años, cuánto tiempo de vida le queda (días, meses y años).
				LocalDate muerte = nacimiento.plusYears(100);
				periodo =hoy.until(muerte);
				System.out.println("Te quedan: "
						+ periodo.getYears()+ " años, "
						+ periodo.getMonths()+ " meses y "
						+ periodo.getDays()+" días.");
			
			//6º Dile, ya de regalo, que hora es ahora en formato hora/minuto/segundo con 24 horas.Por ejemplo: 17:23:55.
				DateTimeFormatter formato= DateTimeFormatter.ofPattern("HH:mm:ss");
				LocalTime hora =LocalTime.now();
				System.out.println("Hora actual: "+ formato.format(hora));	
				scanner.close();
	}
}
