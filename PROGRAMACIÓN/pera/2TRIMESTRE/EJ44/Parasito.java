package EJ44;

public class Parasito extends Personaje{

	private static final Integer PUNTOS_VIDA=200;
	private static final Integer DAÑO=2;
	private static final Integer DAÑO_TIEMPO =1;
	
	@Override
	public Integer getPuntosVida(){
		return PUNTOS_VIDA;
	}

	@Override
	public Integer getDaño() {
		// TODO Auto-generated method stub
		return DAÑO;
	}

	@Override
	public Integer getDañoTiempo() {
		// TODO Auto-generated method stub
		return DAÑO_TIEMPO;
	}
	
	
	
	
	
	
	
	
	
}
