package ej0tema4;

public class Calculadora {

	public static Integer sumar (Integer num1, Integer num2) {
		
		System.out.println(num1 + num2);
		Integer resultado1 = num1 + num2;
		return  resultado1;
	}
	public static Integer restar(Integer num1, Integer num2) {
		
		System.out.println(num1 - num2);
		Integer resultado2 = num1 - num2;
		return resultado2;
	}
	public static Integer multiplicar(Integer num1, Integer num2) {
		
		System.out.println(num1 * num2);
		Integer resultado3 = num1 * num2;
		return resultado3;
	}
	public static Integer dividir(Integer num1, Integer num2) {
		
		System.out.println(num1 / num2);
		Integer resultado4 = num1 / num2;
		return resultado4;
	}
	public static final String SUMAR = "ADD";
	public static final String RESTAR = "SUB";
	public static final String MULTIPLICAR = "MUL";
	public static final String DIVIDIR = "DIV";
	
	public static Integer calcular(String operacion, Integer num1, Integer num2) {
		
		Integer res;
		switch (operacion) {
		case SUMAR:
			res = sumar(num1, num2);
			break;
		case RESTAR:
			res = restar(num1, num2);
			break;
		case MULTIPLICAR:
			res = multiplicar(num1, num2);
			break;
		case DIVIDIR:
			res = dividir(num1, num2);
			break;
		default:
			return null;
		}
		return res;
	}
}
