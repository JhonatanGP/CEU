package REPASO;

public class Repaso01 {
	
	public static void main(String[] args) {
		Integer[] listaNotas = new Integer[] {7, 9, 8, 4, 0, 6, 3, 4, 1, 7, 3, 1, 9, 10};
		int cont=0;
		
		for(Integer in: listaNotas) {
			if (in<5)
				cont++;
		}
			System.out.println("\nTotal alumnos suspensos:" + cont);
	}
}