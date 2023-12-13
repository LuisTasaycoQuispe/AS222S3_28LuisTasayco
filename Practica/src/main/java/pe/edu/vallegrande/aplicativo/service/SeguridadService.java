package pe.edu.vallegrande.aplicativo.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import pe.edu.vallegrande.aplicativo.service.spec.SeguridadServiceSpec;
import pe.edu.vallegrande.avivel.db.AccesoDB;
import pe.edu.vallegrande.avivel.model.EmpleadoModel;

public class SeguridadService implements SeguridadServiceSpec {

	@Override
	public EmpleadoModel validar(String Email, String Password) {
		// Preparando los datos
		Connection cn = null;
		EmpleadoModel bean = null;
		// Proceso
		try {
			cn = AccesoDB.getConnection();
			String sql = "Select ID, Document_Type,Document_Number,Names,Last_Names,Cellphone_Number,Email,Address, Password from Person where Email=? and Password=?;";
			PreparedStatement pstm = cn.prepareStatement(sql);
			pstm.setString(1, Email);
			pstm.setString(2, Password);
			ResultSet rs = pstm.executeQuery();
			if (rs.next()) {
				bean = new EmpleadoModel();
				bean.setId(rs.getInt("ID"));
				bean.setTipoDocumento(rs.getString("Document_Type"));
				bean.setNumeroDocumento(rs.getInt("Document_Number"));
				bean.setNombres(rs.getString("Names"));
				bean.setApellidos(rs.getString("Last_Names"));
				bean.setCelular(rs.getInt("Cellphone_Number"));
				bean.setEmail(rs.getString("Email"));
				bean.setAddress(rs.getString("Address"));
				bean.setPassword(rs.getString("Password"));
			}
			rs.close();
			pstm.close();
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage());
		} catch (Exception e) {
			throw new RuntimeException("Error en el proceso");
		} finally {
			try {
				cn.close();
			} catch (Exception e) {
			}
		}
		return bean;
	}

}
