package ej04.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import ej04.modelo.Alumno;

public class AlumnosService {

	private OpenConnection openConn;

	public AlumnosService() {
		openConn = new OpenConnection();
	}
	
	public Alumno insertarAlumno(String dni) throws SQLException{
	
		String sql = "INSERT INTO ALUMNOS VALUES (?,?,?,?)";
		 
		try ( Connection conn = openConn.getNewConnection(); PreparedStament stmt = conn.prepareStatement(sql)){
			
		}
		
		
	}

}
