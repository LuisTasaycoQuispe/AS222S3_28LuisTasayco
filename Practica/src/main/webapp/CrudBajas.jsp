<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="pe.edu.vallegrande.aplicativo.db.AccesoDB"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>


<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Crud Hackathoon</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet" href="static/css/style2.css">
</head>

<body>
	

	<div class="contenidoCrud">
		<div>
			<div style="display: flex; gap: 25px; align-items: center;">
				<h1 style="position: relative; top: 25px; margin-bottom: 50px;">Titulo
					del Crud</h1>
				<div class="rectLado"></div>
			</div>
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">

				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header"
							style="background-color: #073A75; color: white;">
							<h1 class="modal-title fs-5" id="exampleModalLabel">Registrar
								Alumno</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form class="row g-3 needs-validation" method="post"
								id="miFormulario" onsubmit="return Confirmacion()">
								<div style="width: 240px;">
									<label for="validationCustom01" class="form-label">Nombres</label>
									<input type="text" class="form-control"
										oninput="validarNombre()" id="nombre" required> <span
										id="mensajeNombre"></span>
									<script>
										function validarNombre() {
											var nombre = document
													.getElementById('nombre').value;
											var nombreRegExp = /^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s']+$/;

											if (nombreRegExp.test(nombre)) {
												document
														.getElementById('mensajeNombre').innerHTML = 'Nombre válido';
												document
														.getElementById('mensajeNombre').style.color = 'green';
												document
														.getElementById('nombre').style.border = '1px solid green';
											} else {
												document
														.getElementById('mensajeNombre').innerHTML = 'Ingrese un nombre válido';
												document
														.getElementById('mensajeNombre').style.color = 'red';
												document
														.getElementById('nombre').style.border = '1px solid red';
											}
										}
									</script>
								</div>
								<div style="width: 240px;">
									<label for="validationCustom01" class="form-label">Apellidos</label>
									<input type="text" class="form-control" id="apellido"
										oninput="validarApellidos()" required>
								</div>
								<span id="mensajeApellido"></span>
								<script>
									function validarApellidos() {
										var apellidos = document.getElementById('apellido').value;
										var apellidosRegExp = /^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s']+$/;

										if (apellidosRegExp.test(apellidos)) {
											document
													.getElementById('mensajeApellido').innerHTML = 'Correcto!!';
											document
													.getElementById('mensajeApellido').style.color = 'green';
											document.getElementById('apellido').style.border = '1px solid green';
										} else {
											document
													.getElementById('mensajeApellido').innerHTML = 'Ingrese un apellido válido';
											document
													.getElementById('mensajeApellido').style.color = 'red';
											document.getElementById('apellido').style.border = '1px solid red';
										}
									}
								</script>
								<div style="width: 240px;">
									<label for="validationCustom01" class="form-label">Fecha
										de Nacimiento</label> <input type="date" class="form-control"
										id="fechaNacimiento" name="fechaNacimiento"
										oninput="validarEdad()" required> <span
										id="mensajeFechaNacimiento"></span>
								</div>

								<div style="width: 240px;">
									<label for="validationCustom04" class="form-label">Tipo
										Documento</label> <select class="form-select" id="tipoDocumento"
										required>
										<option selected disabled value="">Seleccione</option>
										<option value="DNI">DNI</option>
										<option value="CNE">CNE</option>
									</select>
								</div>

								<div style="width: 240px;">
									<label for="validationCustom03" class="form-label">N°
										Documento</label> <input type="number" class="form-control"
										id="numeroDocumento" oninput="validarDocumento()" required>

									<span id="mensajeDocumento"></span>

								</div>

								<div style="width: 240px;">
									<label for="validationCustom03" class="form-label">Celular</label>
									<input type="text" class="form-control"
										oninput="validarCelular()" id="celular" required> <span
										id="mensajeCelular"></span>
									<script>
    function validarCelular() {
      var celular = document.getElementById('celular').value;
      var celularRegExp = /^9\d{8}$/;

      if (celularRegExp.test(celular)) {
        document.getElementById('mensajeCelular').innerHTML = 'Número de celular válido';
        document.getElementById('mensajeCelular').style.color = 'green';
        document.getElementById('celular').style.border = '1px solid green';
      } else {
        document.getElementById('mensajeCelular').innerHTML = 'Numero de celular no valido';
        document.getElementById('mensajeCelular').style.color = 'red';
        document.getElementById('celular').style.border = '1px solid red';
      }
    }
  </script>
								</div>

								<div style="width: 480px;">
									<label for="validationCustom03" class="form-label">Direccion</label>
									<input type="text" class="form-control" id="validationCustom03"
										required>
									<div class="invalid-feedback">Ingres su numero de
										Celular!</div>
								</div>
						</div>
						<div class="modal-footer"
							style="display: flex; justify-content: center; align-items: center; gap: 50px;">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Cancelar</button>
							<button type="button" type="button" onclick="Confirmacion()"
								class="btn btn-primary">Registrar</button>
						</div>
						</form>
					</div>

				</div>
			</div>
		</div>

		<div class="card">
			<div
				style="background-color: #F2F2F2; color: #182361; border-bottom: 1px solid rgb(180, 180, 180); border-radius: 5px 5px 0 0;">
				<h5 class="card-title">Consultas</h5>
			</div>
			<div class="card-body">

				<div style="display: flex;">
					<h3 style="margin-right: 20px;">Buscar:</h3>
					<div style="margin-right: 15px;">
						<select id="metodoBusqueda"name="metodosBusqueda"
							style="height: 45px;" class="form-select"
							aria-label="Ejemplo de selección por defecto">
							<option value="codigo">Codigo</option>
							<option value="cantidad">Cantidad</option>
							<option value="area">Area</option>
						</select>
					</div>
					<div class="seccContendr">
						<div class="input-group mb-3">
							<form action=""  method="post" style="display: flex; width: 250px;">
								<div class="input-group">
									<input type="search" style="height: 45px;" id="inputBuscar"
										class="form-control" placeholder="Ingresar Nombres"
									   name="BusquedaSeleccionada"	aria-label="Username" aria-describedby="input-group-right">
									<span
										style="height: 45px; background-color: rgb(23, 109, 49); color: white;"
										class="input-group-text" id="input-group-right-example"><i
										class="bi bi-search"></i></span>
								</div>
							</form>
						</div>
						<div style="display: flex; gap: 30px; width: 800px;">
							
							<a href="index.jsp"><button type="button"
						class="btn btn-primary">ALTAS</button></a>

							<p class="d-inline-flex gap-1">
								<button class="btn btn-secondary" style="height: 45px;"
									type="button" data-bs-toggle="collapse"
									data-bs-target="#collapseExample" aria-expanded="false"
									aria-controls="collapseExample">Exportar</button>
							</p>
						</div>
					</div>
					<script src="static/js/SelectBuscar.js"></script>
				</div>
			</div>

			<!-- Seccion de exportar datos BUTTON -->


			<div class="collapse" id="collapseExample">
				<div class="card card-body" style="border: none;">
					<div class="card">
						<div class="card-header">
							<h5>Exportacion de datos</h5>
						</div>
						<div class="card-body"
							style="display: flex; gap: 40px; justify-content: center; align-items: center;">
							<button type="button" class="btn btn-outline-danger">
								<i class="bi bi-file-earmark-pdf"></i>PDF
							</button>
							<button type="button" class="btn btn-outline-success">
								<i class="bi bi-file-earmark-spreadsheet"></i>Excel
							</button>
							<button type="button" class="btn btn-outline-primary">
								<i class="bi bi-filetype-csv"></i>CSV
							</button>
						</div>
					</div>
				</div>
			</div>
			<!-- FIN DE LA EXPORTACION DE DATOS -->
		</div>
		<div>
			<h3 style="margin-top: 27px; margin-bottom: 25px;">Lista de
				Activos</h3>

			<%
			String variableBusqueda = request.getParameter("BusquedaSeleccionada");
			String Busqueda = request.getParameter("metodosBusqueda");

			Connection connection = null;
			PreparedStatement preparedStatement = null;
			ResultSet resultSet = null;
			String sql;

			try {
				connection = AccesoDB.getConnection();
				sql = "SELECT Area_Detail.Codigo AS CODIGO,Area_Detail.cantidad AS CANTIDAD,Area_Detail.Detalle_Bienes AS DETALLE_BIENES,Area_Detail.Valor_Libro AS VALOR_LIBRO,Area_Detail.Fecha_Depreciacion AS FECHA_DEPRECIACION, UPPER(Persona.APELLIDOS)+ ', ' + Persona.NOMBRES  AS Persona,FORMAT(Area_Detail.Fecha_Ingreso, 'dd-MM-yyyy') AS Fecha, Area_Detail.Estado AS ESTADO,Area.Nombres AS AREA FROM Area_Detail INNER JOIN Persona ON Persona.ID = Area_Detail.Persona_ID INNER JOIN Area ON Area.ID = Area_Detail.Area_ID WHERE Estado='BAJA'";

				preparedStatement = connection.prepareStatement(sql);

				if (variableBusqueda != null) {

					switch (Busqueda) {

				case "codigo" :
					sql = "SELECT Area_Detail.Codigo AS CODIGO,Area_Detail.cantidad AS CANTIDAD,Area_Detail.Detalle_Bienes AS DETALLE_BIENES,Area_Detail.Valor_Libro AS VALOR_LIBRO,Area_Detail.Fecha_Depreciacion AS FECHA_DEPRECIACION, UPPER(Persona.APELLIDOS)+ ', ' + Persona.NOMBRES  AS Persona,FORMAT(Area_Detail.Fecha_Ingreso, 'dd-MM-yyyy') AS Fecha, Area_Detail.Estado AS ESTADO,Area.Nombres AS AREA FROM Area_Detail INNER JOIN Persona ON Persona.ID = Area_Detail.Persona_ID INNER JOIN Area ON Area.ID = Area_Detail.Area_ID WHERE Estado='BAJA' and Codigo = ?";
					preparedStatement = connection.prepareStatement(sql);
					preparedStatement.setString(1, variableBusqueda);

					break;
				case "cantidad" :
					sql = "SELECT Area_Detail.Codigo AS CODIGO,Area_Detail.cantidad AS CANTIDAD,Area_Detail.Detalle_Bienes AS DETALLE_BIENES,Area_Detail.Valor_Libro AS VALOR_LIBRO,Area_Detail.Fecha_Depreciacion AS FECHA_DEPRECIACION, UPPER(Persona.APELLIDOS)+ ', ' + Persona.NOMBRES  AS Persona,FORMAT(Area_Detail.Fecha_Ingreso, 'dd-MM-yyyy') AS Fecha, Area_Detail.Estado AS ESTADO,Area.Nombres AS AREA FROM Area_Detail INNER JOIN Persona ON Persona.ID = Area_Detail.Persona_ID INNER JOIN Area ON Area.ID = Area_Detail.Area_ID WHERE Estado='BAJA' and cantidad = ?";
					preparedStatement = connection.prepareStatement(sql);
					preparedStatement.setString(1, variableBusqueda);
					break;
				case "area" :
					sql = "SELECT Area_Detail.Codigo AS CODIGO,Area_Detail.cantidad AS CANTIDAD,Area_Detail.Detalle_Bienes AS DETALLE_BIENES,Area_Detail.Valor_Libro AS VALOR_LIBRO,Area_Detail.Fecha_Depreciacion AS FECHA_DEPRECIACION, UPPER(Persona.APELLIDOS)+ ', ' + Persona.NOMBRES  AS Persona,FORMAT(Area_Detail.Fecha_Ingreso, 'dd-MM-yyyy') AS Fecha, Area_Detail.Estado AS ESTADO,Area.Nombres AS AREA FROM Area_Detail INNER JOIN Persona ON Persona.ID = Area_Detail.Persona_ID INNER JOIN Area ON Area.ID = Area_Detail.Area_ID WHERE Estado='BAJA' and Area.Nombres = ?";
					preparedStatement = connection.prepareStatement(sql);
					preparedStatement.setString(1, variableBusqueda);
					break;

					}

				}

				resultSet = preparedStatement.executeQuery();
			%>

			<table
				class="table table-bordered table-striped table-hover table-sm"
				id="testTable" style="border: 2px solid gray;">
				<thead>
					<tr>
						<th scope="col">CODIGO</th>
						<th scope="col">CANTIDAD</th>
						<th scope="col">DETALLE</th>
						<th scope="col">VALOR LIBRO</th>
						<th scope="col">FECHA INGRESO</th>
						<th scope="col">FECHA DEPRECIACION</th>
						<th scope="col">PERSONA</th>
						<th scope="col">AREA</th>
						<th scope="col">ACCIONES</th>
						
					</tr>
				</thead>
				<tbody>
					<%
					while (resultSet.next()) {
						String codigo = resultSet.getString("CODIGO");
						String cantidad = resultSet.getString("CANTIDAD");
						String detalle_bienes = resultSet.getString("DETALLE_BIENES");
						String valor_libro = resultSet.getString("VALOR_LIBRO");
						String fecha_depreciacion = resultSet.getString("FECHA_DEPRECIACION");
						String persona = resultSet.getString("Persona");
						String Fecha = resultSet.getString("Fecha");
						String Estado = resultSet.getString("ESTADO");
						String area = resultSet.getString("AREA");

					%>
					<tr>
						<td><%=codigo%></td>
						<td><%=cantidad%></td>
						<td><%=detalle_bienes%></td>
						<td><%=valor_libro%></td>
						<td><%=Fecha%></td>
						<td><%=fecha_depreciacion%></td>
						<td><%=persona%></td>
						<td><%=area%></td>	
						<td>
							<div style="display: flex; justify-content: center; gap: 30px;">
								
									<form action="Eliminar" method="post"
										id="restaurar<%=codigo%>">

										<input type="hidden" id="codigo" name="codigo" value="<%=codigo%>">
										<input type="hidden" id="codigo" name="estado"
											value="<%=Estado%>"> <input type="button" id="btnAE"
											onclick="restaurarGalpon(document.getElementById('restaurar<%=codigo%>'))"
											class="btn btn-success" value="RESTAURAR">

									</form>
<script type="text/javascript">
								 function restaurarGalpon(restauraForm) {
							            Swal.fire({
							                title: "Confirmación",
							                text: "¿Desea Restaurar este Galpon?",
							                icon: "warning",
							                showCancelButton: true,
							                confirmButtonColor: "green",
							                cancelButtonColor: "#d33",
							                confirmButtonText: "Restaurar"
							            }).then((result) => {
							                if (result.isConfirmed) {
							                    restauraForm.submit();
							                }
							            });
							        }</script>

							</div>
						</td>

					</tr>
					<%
					}
					%>
				</tbody>
			</table>
			<%
			} catch (Exception e) {
			out.println("Error: " + e.getMessage());
			}
			%>
		</div>

		<script>
			function validarEdad() {
				var fechaNacimiento = document
						.getElementById('fechaNacimiento').value;
				var fechaNacimientoObj = new Date(fechaNacimiento);
				var fechaActual = new Date();
				var edad = fechaActual.getFullYear()
						- fechaNacimientoObj.getFullYear();
				var mensajeElemento = document
						.getElementById('mensajeFechaNacimiento');

				if (edad >= 18) {
					mensajeElemento.innerHTML = 'OK';
					mensajeElemento.style.color = 'green';
					document.getElementById("fechaNacimiento").style.border = '1px solid green'; // Añadir borde verde en caso de éxito
				} else {
					mensajeElemento.innerHTML = 'Ingrese una edad válida';
					mensajeElemento.style.color = 'red';
					document.getElementById("fechaNacimiento").style.border = '1px solid red'; // Añadir borde rojo en caso de error
				}
			}
		</script>


		<script>
    function validarDocumento() {
      var tipoDocumento = document.getElementById('tipoDocumento').value;
      var numeroDocumento = document.getElementById('numeroDocumento').value;
      var mensajeDocumento = document.getElementById('mensajeDocumento');

      // Seleccionar la expresión regular según el tipo de documento
      var regex;
      if (tipoDocumento === 'DNI') {
        regex = /^\d{8}$/; // DNI debe tener 8 dígitos
      } else if (tipoDocumento === 'CNE') {
        regex = /^[a-zA-Z0-9]{15}$/; // Carné de Extranjería debe tener 12 caracteres alfanuméricos
      }

      // Validar el número de documento
      if (regex.test(numeroDocumento)) {
        mensajeDocumento.innerHTML = 'Numero de documento valido';
        mensajeDocumento.style.color = 'green';
        document.getElementById('numeroDocumento').style.border = '1px solid green';
      } else {
        mensajeDocumento.innerHTML = 'Numero de documento no valido';
        mensajeDocumento.style.color = 'red';
        document.getElementById('numeroDocumento').style.border = '1px solid red';
      }
    }
  </script>




		<script type="text/javascript">

  function Confirmacion() {

      Swal.fire({
        title: "Confirmación",
        text: "¿Desea agregar un nuevo Estudiante?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Agregar"
      }).then((result) => {
        if (result.isConfirmed) {
          Swal.fire({
            title: "Agregado!!",
            text: "Estudiante agregado",
            icon: "success"
          });

          setTimeout(() => {
            document.getElementById("miFormulario").submit();
          }, 3000);
        }
      });
   
  }</script>
</body>
</html>