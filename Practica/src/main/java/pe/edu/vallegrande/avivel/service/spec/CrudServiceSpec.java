package pe.edu.vallegrande.avivel.service.spec;

import java.util.List;

import pe.edu.vallegrande.avivel.model.GalponModel;

public interface CrudServiceSpec<T> {

	/**
	 * Consulta todos los registros de la tabla.
	 * @return Retorna una lista de objetos.
	 */
	List<T> getAll();

	/**
	 * Permite consultar un registro especifico de la tabla en base de su ID.
	 * @param id El ID del registro a consultas.
	 * @return Retorna el registro se gun el ID.
	 */
	T getById(String Codigo);

	/**
	 * Consulta registros en base a un filtro.
	 * @param bean
	 * @return
	 */
	List<T> get(T bean);

	/**
	 * 
	 * @param bean
	 * @return
	 */
	T insert(T bean);

	/**
	 * 
	 * @param bean
	 * @return
	 */


	/**
	 * 
	 * @param id
	 */


	void update(Integer capacidad, String Tipo, String Ubicacion, Integer Persona_ID, String Lote, Integer Id);

	void delete(Integer Id);



}
