package practica.EJ3;

public class App {

	public static void main(String[] args) {
		 // Crear un objeto Producto
        Producto producto = new Producto("Camiseta", 20.99, 50);

        // Mostrar informaci�n del producto
        System.out.println("Nombre del producto: " + producto.Nombre);
        System.out.println("Precio del producto: $" + producto.precio);
        System.out.println("Cantidad disponible: " + producto.cantidadDisponible);

        // Realizar algunas operaciones con el producto
        producto.aumentarCantidad(10);
        producto.reducirCantidad(5);

        // Calcular el total para una cantidad espec�fica
        int cantidad = 3;
        double total = producto.calcularTotal(cantidad);
        System.out.println("Total para " + cantidad + " productos: $" + total);
    }
}
