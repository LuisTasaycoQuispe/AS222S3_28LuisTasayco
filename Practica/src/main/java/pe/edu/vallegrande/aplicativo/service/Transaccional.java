package pe.edu.vallegrande.aplicativo.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pe.edu.vallegrande.avivel.db.AccesoDB;
import pe.edu.vallegrande.avivel.model.DetailModel;

public class Transaccional {

	public List<DetailModel> getAll() {
		List<DetailModel> lista = new ArrayList<>();
		Connection cn = null;
		DetailModel rec = null;
		try {
			cn = AccesoDB.getConnection();
			String sql = "SELECT "
			        + "    d.ID, "
			        + "    d.Java_rosado, "
			        + "    d.unidad_rosado, "
			        + "    d.Java_quiñados, "
			        + "    d.unidad_quiñados, "
			        + "    d.Java_rotos, "
			        + "    d.unidad_rotos, "
			        + "    COALESCE(d.Java_rosado*30, 0) + COALESCE(d.unidad_rosado, 0) + COALESCE(d.Java_quiñados*30, 0) + COALESCE(d.unidad_quiñados, 0) + COALESCE(d.Java_rotos*30, 0) + COALESCE(d.unidad_rotos, 0) AS PRODUCCION, "
			        + "    s.Lote, "
			        + "    UPPER(p.Last_names) + ', ' + p.Names AS Encargado, "
			        + "	Format (d.Date_Production, 'dd-MM-yyyy') AS Date_Production, "
			        + "	s.Locations "
			        + "FROM "
			        + "    Detail_production d "  // Added alias 'd' here
			        + "JOIN "
			        + "    Sheds s ON d.Sheds_Id = s.Id "  // Corrected the ON clause here
			        + "JOIN "
			        + "    Person p ON d.Person_ID = p.ID ";
			
			PreparedStatement pstm = cn.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				rec = new DetailModel();
				rec.setId(rs.getInt("ID"));
				rec.setJaba_Rosado(rs.getInt("Java_rosado"));
				rec.setUnidad_Rosado(rs.getInt("unidad_rosado"));
				rec.setJaba_quiñado(rs.getInt("Java_quiñados"));
				rec.setUnidad_quiñado(rs.getInt("unidad_quiñados"));
				rec.setJaba_roto(rs.getInt("Java_rotos"));
				rec.setUnidad_roto(rs.getInt("unidad_rotos"));
				rec.setLote(rs.getString("Lote"));
				rec.setProduction(rs.getInt("PRODUCCION"));
				rec.setEncargado(rs.getString("Encargado"));
				rec.setLocations(rs.getString("Locations"));
				rec.setFecha(rs.getString("Date_Production"));
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


	public DetailModel insert(DetailModel bean) {
		// Variables
		Integer Id;
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
			sql = "Insert Into Detail_production(Java_rosado, unidad_rosado, Java_quiñados, unidad_quiñados, Java_rotos, unidad_rotos, Sheds_Id, Person_ID)Values(?, ?,? ,?, ?, ?,?, ?);";
			pstm = cn.prepareStatement(sql);
			pstm.setInt(1, bean.getJaba_Rosado());
			pstm.setInt(2, bean.getUnidad_Rosado());
			pstm.setInt(3, bean.getJaba_quiñado());
			pstm.setInt(4, bean.getUnidad_quiñado());
			pstm.setInt(5, bean.getJaba_roto());
			pstm.setInt(6, bean.getJaba_roto());
			pstm.setInt(7, bean.getSheds_ID());
			pstm.setInt(8, bean.getPerson_ID());

			pstm.executeUpdate();
			// Onteniendo el id
			sql = "SELECT @@IDENTITY id";
			pstm = cn.prepareStatement(sql);
			rs = pstm.executeQuery();
			rs.next();
			Id = rs.getInt("ID");
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

	

}
