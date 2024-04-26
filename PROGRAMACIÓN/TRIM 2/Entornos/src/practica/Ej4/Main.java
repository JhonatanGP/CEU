package practica.Ej4;
public class Main {

    public static void main(String[] args) {
        CCuenta cuentaPrincipal;
        double saldoActual;

        cuentaPrincipal = new CCuenta("Antonio López","1000-2365-85-1230456789",2500,0);
        operarCuenta(cuentaPrincipal, 200);
    }

	private static void operarCuenta(CCuenta cuentaPrincipal, double newParam) {
		double saldoActual;
		saldoActual = cuentaPrincipal.estado();
        System.out.println("El saldo actual es"+ saldoActual );

        try {
            cuentaPrincipal.retirar(2300);
        } catch (Exception e) {
            System.out.print("Fallo al retirar");
        }
        try {
            System.out.println("Ingreso en cuenta");
            cuentaPrincipal.ingresar(695);
        } catch (Exception e) {
            System.out.print("Fallo al ingresar");
        }
	}
}
