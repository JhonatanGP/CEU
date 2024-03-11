import java.util.Scanner;

public class practica10 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("Escribe una dirección de correo");
		String correo = scanner.nextLine();
		
		
		Integer inicio= correo.lastIndexOf("/");
		String inicio1= correo.substring(0,inicio+1);
		
		//principio;
		
		
		Integer inicio2=correo.indexOf(".", inicio+1);
		String inicio3= correo.substring(inicio+1,inicio2);
		
		
		//www;
		
		
		Integer inicio4= correo.indexOf(".",inicio2+1);
		String inicio5=correo.substring(inicio2+1,inicio4);
		
		//medio;
		
		
		
		Integer final1= correo.indexOf(".",inicio4+1);
		String final2=correo.substring(inicio4+1);
		
		//final;
		
		
		
		System.out.println(inicio1 + "\n" + inicio3+"\n" + inicio5+"\n"+ final2+"\n");
		
		
		
		
		scanner.close();
	}

}
