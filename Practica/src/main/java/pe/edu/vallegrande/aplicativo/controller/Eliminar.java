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
 * Servlet implementation class Eliminar
 */
@WebServlet("/Eliminar")
public class Eliminar extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String codigo = request.getParameter("codigo");
		String estado = request.getParameter("estado");
		String inactivo = "BAJA";

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {

			connection = AccesoDB.getConnection();

			if (!estado.equals(inactivo)) {
				String sql = "UPDATE Area_Detail SET Estado = 'BAJA' WHERE ID = ?";

				preparedStatement = connection.prepareStatement(sql);

				preparedStatement.setString(1, codigo);

				preparedStatement.executeUpdate();

				response.sendRedirect("index.jsp");
			} else {
				String sql = "UPDATE Area_Detail SET Estado = 'ALTA' WHERE ID = ?";
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setString(1, codigo);

				preparedStatement.executeUpdate();

				response.sendRedirect("CrudBajas.jsp");

			}

		} catch (SQLException e) {
			response.getWriter().write("Error: " + e.getMessage());
		} finally {
			if (preparedStatement != null) {
				try {
					preparedStatement.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
