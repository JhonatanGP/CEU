package Array;  
public class Ejercicio01 {
	public static void main(String[] args) {
	Integer[] listaPares = new Integer[15];
	Integer indice = 0;
	//llenamos el array con los pares del 1 al 30
	int contador = 2;			
	for (int i = 1; i <=30 ;  i++) {
		if (i%2==0) {
			listaPares[indice]=i;
			indice++;
		}
	}
	for (int m=0;m<listaPares.length; m++) {
		System.out.print(listaPares[m] + " ");
	}
  }
}