package pe.edu.vallegrande.aplicativo.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pe.edu.vallegrande.aplicativo.db.AccesoDB;

/**
 * Servlet implementation class AgregarPersona
 */
@WebServlet("/AgregarPersona")
public class AgregarPersona extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		Connection cn = null;
		PreparedStatement pstm = null;

		String Id = request.getParameter("Id");
		String capacidad = request.getParameter("capacidad");
		String tipo = request.getParameter("tipo");
		String lote = request.getParameter("Lote");
		String ubicacion = request.getParameter("ubicacion");
		String persona = request.getParameter("persona");

		String destino = null;

		try {
			cn = AccesoDB.getConnection();
			Integer idPerson = Integer.parseInt(persona);
			String sqlInsert = "INSERT INTO Sheds( capacity, Locations, Type, Person_ID, Lote) VALUES (?, ?, ?,?, ?)";
			pstm = cn.prepareStatement(sqlInsert);
			pstm.setString(1, capacidad);
			pstm.setString(2, ubicacion);
			pstm.setString(3, tipo);
			pstm.setInt(4, idPerson);
			pstm.setString(5, lote);

			pstm.executeUpdate();

			response.sendRedirect("galpones.jsp");
			return;

		} catch (SQLException e) {
			e.printStackTrace();
			
		}

	}

}
