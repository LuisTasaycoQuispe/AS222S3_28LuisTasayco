package pe.edu.vallegrande.aplicativo.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor

public class EmpleadoModel {
	private Integer Id;
	private String TipoDocumento;
	private Integer NumeroDocumento;
	private String Nombres;
	private String Apellidos;
	private Integer Celular;
	private String Email;
	private String Address;
	private String Password;

}
