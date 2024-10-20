package Ejercicio27;

import java.util.Scanner;
public class App27 {

		public static void main(String[] args) {
			// TODO Auto-generated method stub
			Scanner scanner = new Scanner(System.in);

			Alumno[] alumnos = new Alumno[3];
			// Curso curso = new Curso();

			Boolean dniCorrecto = false;
			String dni="";
			for(int i = 0; i < alumnos.length; i++) {
				Alumno a = new Alumno();
				
				System.out.println("Dime tu nombre");
				String nombre = scanner.nextLine();

				System.out.println("Dime tu edad");
				Integer edad = scanner.nextInt();

				System.out.println("Dime tu nota");
				Double nota = scanner.nextDouble();
				scanner.nextLine();

				
				do {
				System.out.println("Dime tu dni");
				dni = scanner.nextLine();
				
				if(!a.validarDNI()) {
					System.err.println("DNI no valido");
				}else {
					dniCorrecto = true;
				}
				}while(!dniCorrecto);
				
				a.setNombe(nombre);
				a.setEdad(edad);
				a.setNota(nota);
				a.setDni(dni);

				alumnos[i] = a;
			}
			
			if(alumnos[0].equals(alumnos[1]) 
					||alumnos[1].equals(alumnos[2])
					||alumnos[0].equals(alumnos[2])){
				System.out.println("Hay alumnos con dni repetidos");
			}
			
			//validar dni
			

			scanner.close();
		}
}
