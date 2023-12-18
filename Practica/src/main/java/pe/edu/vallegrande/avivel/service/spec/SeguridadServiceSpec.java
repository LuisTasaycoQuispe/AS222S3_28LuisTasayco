package pe.edu.vallegrande.avivel.service.spec;

import pe.edu.vallegrande.avivel.model.EmpleadoModel;

public interface SeguridadServiceSpec {

	/**
	 * Valida el usuario y clave de un empleado. Puede generar una excepción en caso
	 * de algun error en la ejecución del proceso.
	 * 
	 * @param usuario El usuario del empleado.
	 * @param clave   La clave del usuario.
	 * @return Retorna un objeto con los datos del empleado o un null si los datos
	 *         no son correctos.
	 */

	EmpleadoModel validar(String Email, String Password);
}
