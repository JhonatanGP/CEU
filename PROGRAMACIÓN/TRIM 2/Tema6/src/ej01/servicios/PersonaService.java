package ej01.servicios;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import ej01.modelo.Persona;

public class PersonaService {

	private OpenConnection openConn;
	
	public PersonaService() {
		openConn = new OpenConnection();
	}
	
	public Persona consultarPersona(String dni) throws SQLException{
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			
			conn = openConn.getNewConnection();
			
		}
		
	}

}
