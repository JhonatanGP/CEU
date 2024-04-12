package practica.EJ2;

public class Fecha {

	private int DIA;
	private int mes;
	private int a�o;

	public Fecha(int dia, int mes, int a�o) {
		this.DIA = dia;
		this.mes = mes;
		this.a�o = a�o;
	}

	public boolean valida() {
		if (DIA < 1 || DIA > 31) {
			return false;
		}
		if (mes < 1 || mes > 12) {
			return false;
		}

		int diasMes = 0;
		switch (mes) {
		case 1:
		case 3:
		case 5:
		case 7:
		case 8:
		case 10:
		case 12:
			diasMes = 31;
			break;
		case 4:
		case 6:
		case 9:
		case 11:
			diasMes = 30;
			break;
		case 2: // a�o bisiesto
			if ((a�o % 400 == 0) ||
					((a�o % 4 == 0) && (a�o % 100 != 0)))
				diasMes = 29;
			else
				diasMes = 28;
			break;
		}
		if (DIA > diasMes) {
			return false;
		}
		else {
			return true;
		}

	}

}
