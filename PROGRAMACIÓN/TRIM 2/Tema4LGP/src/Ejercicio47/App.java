package Ejercicio47;

public class App {

	public static void main(String[] args) {

		// 1. creamos un cliente
		Cliente clienteBlas = new Cliente("Blas de los Montes", "12345678X");

		// 2. creamos carrito y lista
		Carrito carritoBlas = new Carrito(clienteBlas);
		// List <Articulo> listaCompraBlas = new ArrayList();
		// imprimimos
		System.out.println(carritoBlas.getListaArticulos());

		// 3. articulo ropa:
		Ropa ropaPoncho = new Ropa("azul", "XL", 20, "Poncho");

		// 4. a�adimos a la lista dos veces
		carritoBlas.addArticulo(ropaPoncho);
		carritoBlas.addArticulo(ropaPoncho);

		// imprimir la lista
		System.out.println(carritoBlas.getListaArticulos());
		System.out.println();
		// 5. creamos libro
		Libro libroNietzsche = new Libro(15, "As� habl� Zaratustra", "Nietzsche");
		// System.out.println(libroNietzsche);

		// 6. a�adimos a la cesta
		carritoBlas.addArticulo(libroNietzsche);
		
		// imprimir la lista
		System.out.println(carritoBlas.getListaArticulos());
		System.out.println();
		
		// 7. Borra el articulo de la posicion 1
		carritoBlas.borrarArticulo(1);
		System.out.println(carritoBlas.getListaArticulos());
		System.out.println();

		// 8. Obt�n e imprime el precio medio del art�culo.
		carritoBlas.getPrecioMedio();
		System.out.println(carritoBlas.getTotal());

		// 9. Vac�a la cesta e impr�mela.
		carritoBlas.vaciarCesta();
		System.out.println(carritoBlas.getListaArticulos());

		// 10. Obt�n e imprime el precio medio del art�culo.
		carritoBlas.getPrecioMedio();
		System.out.println(carritoBlas.getTotal());

	}

}
