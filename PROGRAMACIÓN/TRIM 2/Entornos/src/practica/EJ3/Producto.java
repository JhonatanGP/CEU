package practica.EJ3;

public class Producto {
    public String Nombre;
    public double precio;
    public int cantidadDisponible;

    public Producto(String nombre, double precio, int cantidadDisponible) {
        this.Nombre = nombre;
        this.precio = precio;
        this.cantidadDisponible = cantidadDisponible;
    }

   
    public void reducirCantidad(int cantidad) {
        if (cantidad <= 0) {
            System.out.println("Error: La cantidad debe ser mayor que cero");
            return;
        }
        if (cantidad > cantidadDisponible) {
            System.out.println("Error: No hay suficiente stock disponible");
            return;
        }
        cantidadDisponible -= cantidad;
    }

    public void aumentarCantidad(int cantidad) {
        if (cantidad <= 0) {
            System.out.println("Error: La cantidad debe ser mayor que cero");
            return;
        }
        cantidadDisponible += cantidad;
    }

    public double calcularTotal(int cantidad) {
        if (cantidad <= 0) {
            System.out.println("Error: La cantidad debe ser mayor que cero");
            return 0;
        }
        return precio * cantidad;
    }
}

