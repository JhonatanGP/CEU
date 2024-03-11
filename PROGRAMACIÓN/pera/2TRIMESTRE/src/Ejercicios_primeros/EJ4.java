package src.Ejercicios_primeros;

public class EJ4 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		System.out.println(getMayMin(1,"    Buenos dias   "));
		System.out.println(getMayMin(2,"   Introduccion   "));
		System.out.println(("   Conclusion  "));
	
		
	}

	public static String getMayMin(Integer numero,String cadena){
		
		if(numero==1)
		// cadena=EJ1.getMayusculas(cadena);
		
		
		//else if(numero==2)
			cadena=EJ2.getMinusculas(cadena);
		
		
		return cadena;
	}
}