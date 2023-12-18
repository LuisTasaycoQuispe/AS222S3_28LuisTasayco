package pe.edu.vallegrande.aplicativo.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pe.edu.vallegrande.aplicativo.service.spec.CrudServiceSpec;
import pe.edu.vallegrande.avivel.db.AccesoDB;
import pe.edu.vallegrande.avivel.model.GalponModel;

public class CrudGalpones implements CrudServiceSpec<GalponModel> {

	@Override
	public List<GalponModel> getAll() {
		List<GalponModel> lista = new ArrayList<>();
		Connection cn = null;
		GalponModel rec = null;
		try {
			cn = AccesoDB.getConnection();
			String sql = "Select Id,capacity, Locations,Lote, State, Type, Person_Id from Sheds;";
			PreparedStatement pstm = cn.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				rec = new GalponModel();
				rec.setId(rs.getString("Id"));
				rec.setCapacidad(rs.getString("capacity"));
				rec.setUbicacion(rs.getString("Locations"));
				rec.setLote(rs.getString("Lote"));
				rec.setState(rs.getString("State"));
				rec.setTipo(rs.getString("Type"));
				rec.setPersona_ID(rs.getInt("Person_Id"));
				lista.add(rec);
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
		return lista;
	}

	@Override
	public GalponModel getById(String Codigo) {
		// Preparando los datos
		Connection cn = null;
		GalponModel bean = null;
		// Proceso
		try {
			cn = AccesoDB.getConnection();
			String sql = "Select Shed_Codes,capacity, Locations, State, Type from Sheds where Shed_Codes =?; ";

			PreparedStatement pstm = cn.prepareStatement(sql);
			pstm.setString(1, Codigo);
			ResultSet rs = pstm.executeQuery();
			if (rs.next()) {
				bean = new GalponModel();
				bean.setId(rs.getString("Shed_Codes"));
				bean.setCapacidad(rs.getString("capacity"));
				bean.setUbicacion(rs.getString("Locations"));
				bean.setLote(rs.getString("State"));
				bean.setTipo(rs.getString("Type"));

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


	@Override
	public GalponModel insert(GalponModel bean) {
		// Variables
		String Id;
		Connection cn = null;
		PreparedStatement pstm;
		ResultSet rs;
		String sql;
		// Proceso
		try {
			// Inicio de la TX
			cn = AccesoDB.getConnection();
			cn.setAutoCommit(false);
			// Insertar registro
			sql = "INSERT INTO Sheds( capacity, Locations, Type, Person_ID, Lote) VALUES (?, ?, ?,?, ?)";
			pstm = cn.prepareStatement(sql);
			pstm.setString(1, bean.getCapacidad());
			pstm.setString(2, bean.getUbicacion());
			pstm.setString(3, bean.getTipo());
			pstm.setInt(4, bean.getPersona_ID());
			pstm.setString(5, bean.getLote());
			pstm.executeUpdate();
			// Onteniendo el id
			sql = "SELECT @@IDENTITY id";
			pstm = cn.prepareStatement(sql);
			rs = pstm.executeQuery();
			rs.next();
			Id = rs.getString("id");
			bean.setId(Id);
			// Fun de la TX
			cn.commit();
		} catch (SQLException e) {
			try {
				cn.rollback();
			} catch (Exception e2) {
			}
			throw new RuntimeException(e.getMessage());
		} catch (Exception e) {
			try {
				cn.rollback();
			} catch (Exception e2) {
			}
			throw new RuntimeException("Error en el proceso");
		} finally {
			try {
				cn.close();
			} catch (Exception e) {
			}
		}
		// Reporte
		return bean;
	}

	@Override
	public void update(Integer capacidad,String Tipo ,String Ubicacion, Integer Persona_ID, String Lote, Integer Id) {
		// Variables
		Connection cn = null;
		PreparedStatement pstm;
		ResultSet rs;
		String sql;
		int filas;
		// Proceso
		try {
			// Inicio de la TX
			cn = AccesoDB.getConnection();
			cn.setAutoCommit(false);
			// Insertar registro
			sql = "Update Sheds Set capacity = ? , Type = ?, Locations =?, Fecha = GETDATE(), Person_ID = ?, Lote = ? Where Id=? ";
			pstm = cn.prepareStatement(sql);
			pstm.setInt(1, capacidad);
			pstm.setString(2, Tipo);
			pstm.setString(3, Ubicacion);
			pstm.setInt(4, Persona_ID);
			pstm.setString(5, Lote);
			pstm.setInt(6, Id);

			
			filas = pstm.executeUpdate();
			pstm.close();
			if (filas == 0) {
				throw new SQLException("Codigo no existe");
			}
			// Fun de la TX
			cn.commit();
		} catch (SQLException e) {
			try {
				cn.rollback();
			} catch (Exception e2) {
			}
			throw new RuntimeException(e.getMessage());
		} catch (Exception e) {
			try {
				cn.rollback();
			} catch (Exception e2) {
			}
			throw new RuntimeException("Error en el proceso");
		} finally {
			try {
				cn.close();
			} catch (Exception e) {
			}
		}
	}
	
	

	@Override
	public void delete(Integer Id) {
		Connection cn = null;
		PreparedStatement pstm;
		ResultSet rs;
		String sql;
		int filas;
		// Proceso
		try {
			// Inicio de la TX
			cn = AccesoDB.getConnection();
			cn.setAutoCommit(false);
			// Insertar registro
			sql = "UPDATE Sheds SET State = 'INACTIVO' WHERE Id = ?";
			pstm = cn.prepareStatement(sql);
			pstm.setInt(1, Id);
			filas = pstm.executeUpdate();
			pstm.close();
			if (filas == 0) {
				throw new SQLException("Id no existe");
			}
			// Fun de la TX
			cn.commit();
		} catch (SQLException e) {
			try {
				cn.rollback();
			} catch (Exception e2) {
			}
			throw new RuntimeException(e.getMessage());
		} catch (Exception e) {
			try {
				cn.rollback();
			} catch (Exception e2) {
			}
			throw new RuntimeException("Error en el proceso");
		} finally {
			try {
				cn.close();
			} catch (Exception e) {
			}
		}
	}

	@Override
	public List<GalponModel> get(GalponModel bean) {
		// TODO Auto-generated method stub
		return null;
	}

}
