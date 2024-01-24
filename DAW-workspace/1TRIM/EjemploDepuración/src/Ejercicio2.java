

public class Ejercicio2 {
    public static void main(String[] args) {
        // Declaración de variables
        int numero1 = 5;
        int numero2 = 10;
        
        // Llamada a la función sumarNumeros
        int resultado = sumarNumeros(numero1, numero2);
        
        // Imprimir el resultado
        System.out.println("La suma de "+ numero1 + " y " + numero2 +" es: " + resultado);
        
        // Llamada a la función imprimirMensaje con un mensaje
        imprimirMensaje("Hay errores??");
        
        // Llamada a la función imprimirMensaje sin mensaje
        imprimirMensaje();
        
        // Crear un arreglo de números
        int[] numeros = {1, 2, 3, 4, 5};
        
        // Imprimir los elementos del arreglo
        for (int i = 0; i < numeros.length; i++) {
            System.out.print(numeros[i] + " ");
        }
    }

    // Función para sumar dos números
    public static int sumarNumeros(int a, int b) {
    	int aux= a;
    	int aux2=b;
    	aux=aux+aux2;
    	return aux; 
    }

    // Función para imprimir un mensaje
    public static void imprimirMensaje(String mensaje) {
        System.out.println(mensaje);
    }

    // Función para imprimir un mensaje predeterminado
    public static void imprimirMensaje() {
        System.out.println("¡Hola desde imprimirMensaje!");
    }
}