package pe.edu.vallegrande.aplicativo.prueba;

import java.sql.Connection;
import java.sql.SQLException;

import pe.edu.vallegrande.aplicativo.db.AccesoDB;

public class Prueba01 {
	
	public static void main(String[] args) {
		try {
			Connection cn = AccesoDB.getConnection();
			System.out.println("Conexion ok.");
			cn.close();
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
	}

}
