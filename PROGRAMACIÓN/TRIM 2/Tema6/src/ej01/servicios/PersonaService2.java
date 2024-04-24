package ej01.servicios;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import ej01.modelo.Persona;

public class PersonaService2 {

	private OpenConnection openConn;
	
	public PersonaService2() {
		openConn = new OpenConnection();
	}
	
public Persona consultarPersona(String dni) throws SQLException{
		
		ResultSet rs = null;
		try (Connection conn = openConn.getNewConnection();
				Statement stmt = conn.createStatement()){
					
			String sql = "SELECT * FROM PERSONAS WHERE DNI = '" + dni + "'";
			System.out.println(sql);
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				Persona p = new Persona();
				p.setNombre(rs.getString("NOMBRE"));
				p.setDni(rs.getString("DNI"));
				
				String apellidos = rs.getString("APELLIDOS");
				p.setApellidos(apellidos);
				p.setFechaNac(rs.getDate("FECHA_NACIMIENTO").toLocalDate());
				//return getPersonaFromResultSet(rs);		
				return p;
			}else {
				return null;
			}
		}
	}
}

