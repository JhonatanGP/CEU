package ej05.servicios;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import ej05.modelo.Persona;

public class PersonasService {

	private OpenConnection openConn;

	public PersonasService() {
		openConn = new OpenConnection();
	}

	public Persona consultarPersona(String dni) throws SQLException {

		try (Connection conn = openConn.getNewConnection(); Statement stmt = conn.createStatement()) {

			String sql = "SELECT * FROM PERSONAS WHERE DNI = '" + dni + "'";
			System.out.println(sql);
			ResultSet rs = stmt.executeQuery(sql);

			if (rs.next()) {
				return getPersonaFromResultSet(rs);
			} else {
				return null;

			}
		}

	}

	private Persona getPersonaFromResultSet(ResultSet rs) throws SQLException {
		Persona p = new Persona();
		p.setNombre(rs.getString("NOMBRE"));
		p.setDni(rs.getString("DNI"));

		String apellidos = rs.getString("APELLIDOS");
		p.setApellidos(apellidos);
		p.setFechaNacimiento(rs.getDate("FECHA_NACIMIENTO").toLocalDate()); // en una línea

		return p;

	}

	public List<Persona> consultarPersonas(String filtro) throws SQLException {
		try (Connection conn = openConn.getNewConnection(); Statement stmt = conn.createStatement()) {

			String sql = "SELECT * FROM PERSONAS WHERE NOMBRE LIKE '%" + filtro + "%' or APELLIDOS LIKE '%" + filtro
					+ "%'";
			System.out.println(sql);
			ResultSet rs = stmt.executeQuery(sql);

			List<Persona> resultados = new ArrayList<>();
			while (rs.next()) {
				Persona p = getPersonaFromResultSet(rs);
				resultados.add(p);
			}
			return resultados;
		}
	}

	public void insertarPersona(Persona p) throws SQLException {
		// FORMA 1: STATEMENT:
		/*
		 * try ( Connection conn = openConn.getNewConnection(); Statement stmt =
		 * conn.createStatement()){
		 * 
		 * String sql = "INSERT INTO PERSONAS VALUES ('" + p.getDni() + "', " + "'" +
		 * p.getNombre() + "', " + "'" + p.getApellidos() + "', " + "'" +
		 * Date.valueOf(p.getFechaNacimiento())+ "')";
		 * 
		 * System.out.println(sql); stmt.execute(sql); }
		 */

		// FORMA 2: PREPAREDSTATEMENT:

		String sql = "INSERT INTO PERSONAS VALUES (?, ?, ?, ?)";
		try (Connection conn = openConn.getNewConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

			stmt.setString(1, p.getDni());
			stmt.setString(2, p.getNombre());
			stmt.setString(3, p.getApellidos());
			stmt.setDate(4, Date.valueOf(p.getFechaNacimiento()));

			System.out.println(sql);
			stmt.execute();
		}
	}

	public Integer actualizarPersona(Persona persona) throws SQLException {
		
		String sql = "UPDATE PERSONAS SET NOMBRE = ?, APELLIDOS = ?, FECHA_NACIMIENTO = ? WHERE DNI = ?" ;
		try (Connection conn = openConn.getNewConnection();
			 PreparedStatement stmt = conn.prepareStatement(sql)) {
			
			stmt.setString(1, persona.getNombre());
			stmt.setString(2, persona.getApellidos());
			stmt.setDate(3, Date.valueOf(persona.getFechaNacimiento()));
			stmt.setString(4, persona.getDni());

			Integer registrosActualizados = stmt.executeUpdate();
			return registrosActualizados;
		}
	}

	public Integer borrarPersona(String dni) throws SQLException {
		
		String sql = "DELETE FROM PERSONAS WHERE DNI = ?";
		
		try (Connection conn = openConn.getNewConnection();
			 PreparedStatement stmt = conn.prepareStatement(sql)) {
			
			stmt.setString(1, dni);

			Integer registrosBorrados = stmt.executeUpdate();
			return registrosBorrados;
		} 
	}

}
