package repaso;

public class repaso5 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Integer[] listaNotas = new Integer[] {7, 9, 8, 4, 0, 6, 3, 4, 1, 7, 3, 1, 9, 10};

		for(int i =0;i<listaNotas.length;i++) {
			
			if(listaNotas[i]>5) {
				
			}
			
			if (listaNotas[i]<5){
				listaNotas[i]=5;	
			
			}
		
			System.out.print(" " +listaNotas[i]+ " ");
		}

		
		
		
		
		
	}
}
