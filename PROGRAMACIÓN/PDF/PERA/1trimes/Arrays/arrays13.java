package Arrays;

public class arrays13 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub


		Integer[][] tabla= new Integer[10][10];
	
				for(int i=0;i<tabla.length;i++){
			
			for(int j=0;j<tabla[i].length;j++){
				tabla[i][j]= (i+1) * (j+1);
					
			}
		}
		
		for(int i=0;i<tabla.length;i++){
			for(int j=0;j<tabla[i].length;j++){
			System.out.print(tabla[i][j]+ "\t");					
			}
			System.out.println();
		}

		
	}

}
