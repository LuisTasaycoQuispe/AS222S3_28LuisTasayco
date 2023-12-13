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
 * Servlet implementation class Editar
 */
@WebServlet("/Editar")
public class Editar extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection cn = null;
		PreparedStatement pstm;

		String cantidad = request.getParameter("cantidad");
		String detalle = request.getParameter("detalle");
		String codigo = request.getParameter("codigo");
		String fechaDepreciacion = request.getParameter("fecha_depreciacion");
		String persona = request.getParameter("persona");
		try {
			Integer personaN = Integer.parseInt(persona);
			
			Integer cantidadN = Integer.parseInt(cantidad);

			cn = AccesoDB.getConnection();

			String sql = "UPDATE Area_Detail set cantidad = ?, Detalle_Bienes = ?, Fecha_Depreciacion = ?, Persona_ID = ? Where codigo =?";
			pstm = cn.prepareStatement(sql);
			pstm.setInt(1, cantidadN);
			pstm.setString(2, detalle);
			pstm.setString(3, fechaDepreciacion);
			pstm.setInt(4, personaN);
			pstm.setString(5, codigo);

			pstm.executeUpdate();


			response.sendRedirect("index.jsp");

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Error: " + e.getMessage());

		
		}
		
	}

}
