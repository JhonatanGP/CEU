package Arrays;

public class arrays1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Integer[] listaPares= new Integer[15];
		
		Integer contador=2;
		
		
		for(int i= 0; i<listaPares.length;i++) {
			listaPares[i] =contador;
			contador=contador+2;
			
			System.out.println(listaPares[i]);
			
				}
	
		
	}
	}
