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
@WebServlet("/Agregar")
public class Agregar extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {		// TODO Auto-generated method stub
		Connection cn = null;
		PreparedStatement pstm = null;

		String cantidad = request.getParameter("cantidad");
		String detalleBienes = request.getParameter("detalleBienes");
		String valorLibro = request.getParameter("valorLibro");
		String fechaIngreso = request.getParameter("fechaIngreso");
		String fechaDepreciacion = request.getParameter("fechaDepreciacion");
		String area = request.getParameter("area");

		String anualSelect = request.getParameter("anualPorcentaje");
		Integer anualSe = Integer.parseInt(anualSelect);
		Integer areaSe = Integer.parseInt(area);


		try {
			cn = AccesoDB.getConnection();
			Integer cantidadInte = Integer.parseInt(cantidad);
			String sqlInsert = "INSERT INTO Area_Detail(cantidad, Detalle_Bienes, Valor_Libro, Fecha_Ingreso, Fecha_Depreciacion, Bienes_ID, Area_ID) VALUES (?, ?, ?,?, ?,?,?)";
			pstm = cn.prepareStatement(sqlInsert);
			pstm.setInt(1, cantidadInte);
			pstm.setString(2, detalleBienes);
			pstm.setString(3, valorLibro);
			pstm.setString(4, fechaIngreso);
			pstm.setString(5, fechaDepreciacion);
			pstm.setInt(6, anualSe);
			pstm.setInt(7, areaSe);


			pstm.executeUpdate();
			response.sendRedirect("index.jsp");
			return;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("ERROR: "+ e.getMessage());
			
		}
		


	}

}
