package EJ44;

public class Asesino extends Personaje{

	
	private static final Integer PUNTOS_VIDA=100;
	private static final Integer DAÑO=10;
	private static final Integer DAÑO_TIEMPO =5;
	

	@Override
	public Integer getPuntosVida() {
		// TODO Auto-generated method stub
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
