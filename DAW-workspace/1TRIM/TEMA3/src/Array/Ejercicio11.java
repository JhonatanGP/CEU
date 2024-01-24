package Array;

public class Ejercicio11 {

	public static void main(String[] args) {

		Integer[][] tabla=new Integer[5][10];
		Integer contador=1;
			for (int i=0; i<tabla.length; i++) {
				for (int j=0;j<tabla[i].length; j++) {
					tabla[i][j]=contador;
					contador++;
				}
			}
			for (int i=0; i<tabla.length; i++) {
				for (int j=0;j<tabla[i].length; j++) {
					System.out.print(tabla[i][j]+"\t");
				}
				System.out.println("");
			}
	}
}
