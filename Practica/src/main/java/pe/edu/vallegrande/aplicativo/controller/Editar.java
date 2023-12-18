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
		String id = request.getParameter("id");
		String cantidad = request.getParameter("cantidad");
		String detalle = request.getParameter("detalle");
		String valorLibro = request.getParameter("valorLibro");
		String fechaIngreso = request.getParameter("fechaIngreso");
		String fechaDepreciacion = request.getParameter("fechaDepreciacion");
		String bienes = request.getParameter("bienes");
		String area = request.getParameter("area");

		try {
			Integer conValorLibro = Integer.parseInt(valorLibro);
			Integer conBienes = Integer.parseInt(bienes);
			Integer conArea = Integer.parseInt(area);

			Integer conID = Integer.parseInt(id);
			Integer cantidadN = Integer.parseInt(cantidad);

			cn = AccesoDB.getConnection();

			String sql = "UPDATE Area_Detail set cantidad = ?, Detalle_Bienes = ?,Valor_Libro = ?,Fecha_Ingreso = ?, Fecha_Depreciacion = ?,Bienes_ID = ?, Area_ID = ?  Where ID =?";
			pstm = cn.prepareStatement(sql);
			pstm.setInt(1, cantidadN);
			pstm.setString(2, detalle);
			pstm.setInt(3, conValorLibro);
			pstm.setString(4, fechaIngreso);
			pstm.setString(5, fechaDepreciacion);
			pstm.setInt(6, conBienes);
			pstm.setInt(7, conArea);
			pstm.setInt(8, conID);

			pstm.executeUpdate();


			response.sendRedirect("index.jsp");

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Error: " + e.getMessage());

		
		}
		
	}

}
