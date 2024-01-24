public class Depuracion {

	public static void main(String[] args) {
		
	    System.out.println("");
		String cadena1 = "APROBARÉ";
	    String cadena2 = "aprobaré";
	   
	    if (sonCadenasIguales(cadena1, cadena2)) {
	        System.out.println("Las cadenas son iguales.");
	    } else {
	        System.out.println("Las cadenas son diferentes.");
	    }	    
	   
	    String array []= cadena1.split("");	    
	    for(int i=0;i<array.length;i++) {
	    	if(array[i]=="R") {
	    		array[i]="r";
	    	}
	    }
	    
	    for(int i=0;i<array.length;i++) {
	    	System.out.print(array[i]);
	    }
	}
    
    private static boolean sonCadenasIguales(String cadena1, String cadena2) {        
      
    	 for (int i = 0; i < cadena1.length(); i++) {
    		 String letra= cadena1.substring(i,i+1);
             if (!letra.equals(cadena2.substring(i,i+1))) {
                 return true;
             }
         }
         return false;
    }
	
}