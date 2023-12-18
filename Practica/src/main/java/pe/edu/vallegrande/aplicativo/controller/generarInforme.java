package pe.edu.vallegrande.aplicativo.controller;

import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import pe.edu.vallegrande.aplicativo.db.AccesoDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;

@WebServlet({"/generarInforme", "/generarEliminados", "/generarLista"})
public class generarInforme extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
        String path = request.getServletPath();
		switch(path) {
		case "/generarInforme":
			generarBaja(request,response);
			break;
		case "/generarEliminados":
			generarEliminados(request,response);
			break;
		case "/generarLista":
			generarAlta(request,response);
			break;
			
		}
    }

	private void generarAlta(HttpServletRequest request, HttpServletResponse response) {
		try {
            String reportPath = getServletContext().getRealPath("WEB-INF/reports/Alta.jrxml");
            JasperReport jasperReport = JasperCompileManager.compileReport(reportPath);

            Connection connection = AccesoDB.getConnection();

            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, null, connection);
            response.setContentType("application/pdf");
            JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
        } catch (Exception e) {
            e.printStackTrace();
        }
        		
	}

	private void generarEliminados(HttpServletRequest request, HttpServletResponse response) {
		 try {
	            String reportPath = getServletContext().getRealPath("WEB-INF/reports/Inactivos.jrxml");
	            JasperReport jasperReport = JasperCompileManager.compileReport(reportPath);

	            Connection connection = AccesoDB.getConnection();

	            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, null, connection);
	            response.setContentType("application/pdf");
	            JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	}

	private void generarBaja(HttpServletRequest request, HttpServletResponse response) {
		  try {
	            String reportPath = getServletContext().getRealPath("WEB-INF/reports/Baja.jrxml");
	            JasperReport jasperReport = JasperCompileManager.compileReport(reportPath);

	            Connection connection = AccesoDB.getConnection();

	            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, null, connection);
	            response.setContentType("application/pdf");
	            JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		
	}
}

