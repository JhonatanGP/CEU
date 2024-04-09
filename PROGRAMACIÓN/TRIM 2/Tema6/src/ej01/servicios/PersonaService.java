package ej01.servicios;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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
			stmt = conn.createStatement();
			
			String sql = "SELECT * FROM PERSONAS WHERE DNI = '" + dni + "'";
			System.out.println(sql);
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				Persona p = new Persona();
				p.setNombre(rs.getString("NOMBRE"));
				p.setDni(rs.getString("DNI"));
				
				String apellido = rs.getString("APELLIDOS");
				p.setApellidos(apellidos);
				p.setFechaNac(rs.getDate("FECHA_NAC").toLocalDate());
				//return getPersonaFromResultSet(rs);				
			}else {
				
			}
			
		}catch(SQLException e){
			
		}
		
	}

}
