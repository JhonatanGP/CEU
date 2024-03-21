package src.Ejercicios_primeros;

public class EJ3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		System.out.println(getMayMin(1,"    Buenos dias   "));
		System.out.println(getMayMin(2,"   Introduccion   "));
		System.out.println(getMayMin(3,"   Conclusion  "));
		
	
	}

	public static String getMayMin(Integer numero, String cadena ){
	
	
		if(numero==1){
			cadena= cadena.trim().toUpperCase();
		
		}
		
		if(numero==2){
			cadena= cadena.trim().toLowerCase();
		}
		return cadena;
	}
}
