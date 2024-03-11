package test;

public class práctica1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		int total=0;
		int limite=10;
		int num=5;
		while(true) {
			
			
			if(num==0) {
				break;
			}
			if(num<0) {
				total=-1;
			}
			if(num>=1 && num<=10) {
				
				total+=num;
				if (total>limite){
					break;
				}
			}
			
			
			
		}
		
		System.out.println(total);
		
		
	}

}
