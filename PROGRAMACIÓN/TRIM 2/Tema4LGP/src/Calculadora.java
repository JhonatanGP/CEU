public class Calculadora {
	public static final String ADD = "add";
	public static final String SUB = "sub";
	public static final String MUL = "mul";
	public static final String DIV = "div";

	// ejercicio7
	public static Integer restar(Integer num1, Integer num2) {
		Integer resultado = num1 - num2;
		return resultado;
	}

	// ejercicio7
	public static Integer multiplicar(Integer num1, Integer num2) {
		Integer resultado = num1 * num2;
		return resultado;
	}
	
	// ejercicio7
	public static Integer dividir(Integer num1, Integer num2) {
		Integer resultado = num1 / num2;
		return resultado;
	}
	
	// ejercicio8
	public static Integer calcular(String cadena, Integer num1, Integer num2) {
		Integer resultado = 0;
		switch (cadena) {
		case ADD:
			resultado = Ejercicio05.sumar(num1, num2);
			break;
		case SUB:
			resultado = restar(num1, num2);
			break;
		case MUL:
			resultado = multiplicar(num1, num2);
			break;
		case DIV:
			resultado = dividir(num1, num2);
			break;
		}

		return resultado;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// Ejercicio6
		//Integer suma = Ejercicio5.sumar(0, 0);
	}
	
}