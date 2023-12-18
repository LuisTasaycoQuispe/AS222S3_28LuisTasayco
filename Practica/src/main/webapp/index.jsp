<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="pe.edu.vallegrande.aplicativo.db.AccesoDB" %>

<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>


<html lang="en">

<head>
<meta charset="UTF-8">
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


	<div class="contenidoCrud" style="width: 1340px; margin-left: 60px;">

		<div style="display: flex; gap: 25px; align-items: center;">
			<h1 style="position: relative; top: 25px; margin-bottom: 50px;">JAS
				DIGITAL</h1>
			<div class="rectLado"></div>
		</div>
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">

			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header"
						style="background-color: #073A75; color: white;">
						<h1 class="modal-title fs-5" id="exampleModalLabel">Registrar
							Bienes</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
						<script type="text/javascript">
								
								// Mostrar ventana de registrar registrar Alumno

								const exampleModal = document.getElementById('exampleModal')
								if (exampleModal) {
								    exampleModal.addEventListener('show.bs.modal', event => {
								        const button = event.relatedTarget
								        const recipient = button.getAttribute('data-bs-whatever')

								        const modalTitle = exampleModal.querySelector('.modal-title')
								        const modalBodyInput = exampleModal.querySelector('.modal-body input')

								        modalTitle.textContent = `Registrar Bienes`
								        modalBodyInput.value = recipient
								    })
								}
								</script>
					</div>
					<div class="modal-body">
						<form class="row g-3 needs-validation" action="Agregar"
							method="post" id="miFormulario" onsubmit="return Confirmacion()">

							<div style="display: flex; gap: 40px; justify-content: center;">
								<div>
									<h6>Cantidad</h6>
									<input type="text" name="cantidad"
										style="width: 210px; text-indent: 10px;"
										oninput="validarNumero()" id="cantidad"> <br> <span
										id="validarCantidad" style="color: red;"></span>

								</div>
								<script>
    									function validarNumero() {
        									var cantidad = document.getElementById('cantidad');
        									var valor = cantidad.value;
        									var validarCantidad = document.getElementById('validarCantidad');

        									if (/^[0-9]+$/.test(valor)) {
            									validarCantidad.innerHTML = 'OK';
            									validarCantidad.style.color = 'green';
            									cantidad.style.border = '2px solid green';

        									} else {
           									 	validarCantidad.innerHTML = 'Solo se aceptan números';
            									validarCantidad.style.color = 'red';
            									cantidad.style.border = '2px solid red';

        									}
    									}
									</script>
								<div>

									<h6>Valor Libro</h6>
									<input type="text" name="valorLibro" oninput="validarLibro()"
										style="width: 210px; text-indent: 10px;" id="valor"> <span
										id="validarValor" style="color: red;"></span>

								</div>
								<script>
    									function validarLibro() {
        									var valor = document.getElementById('valor');
        									var compar = valor.value;
        									var validarvalor = document.getElementById('validarValor');

        									if (/^[0-9]+$/.test(compar)) {
        										validarvalor.innerHTML = 'OK';
        										validarvalor.style.color = 'green';
            									valor.style.border = '2px solid green';

        									} else {
        										validarvalor.innerHTML = 'Solo se aceptan números';
        										validarvalor.style.color = 'red';
            									valor.style.border = '2px solid red';

        									}
    									}
									</script>
							</div>


							<div style="display: flex; gap: 40px; justify-content: center;">
								<div>
									<h6>Fecha Ingreso</h6>
									<input style="width: 210px;" type="date" name="fechaIngreso"
										id="fechaIngreso" max="2023-12-31" min="2023-01-01">
								</div>
								<div>
									<h6>Fecha Depreciacion</h6>
									<input style="width: 210px;" type="date"
										name="fechaDepreciacion" id="fecha" readonly>
								</div>
							</div>


							<script>
    var inputFecha = document.getElementById('fecha');

    var fechaActual = new Date();
    var ultimoDiaDelAnio = new Date(fechaActual.getFullYear(), 11, 31);

    var formattedFecha = ultimoDiaDelAnio.toISOString().slice(0, 10);

    inputFecha.value = formattedFecha;
  </script>




							<div style="display: grid; justify-content: center;">
								<h6>Depreciacion %</h6>
								<select style="width: 445px;" name="anualPorcentaje"
									id="anualPorcentaje">
									<option selected="selected" disabled="disabled">Elija
										una Opcion</option>
									<option value="1">20%</option>
									<option value="2">25%</option>
									<option value="3">10%</option>
								</select>
							</div>
							<div style="display: grid; justify-content: center;">
								<h6>Area</h6>
								<select style="width: 445px;" name="area" id="anualPorcentaje">
									<option selected="selected" disabled="disabled">Elija
										una Opcion</option>
									<option value="1">Produccion</option>
									<option value="2">Contabilidad</option>
									<option value="3">Marketing</option>
									<option value="4">Recursos Humanos</option>
									<option value="5">Ventas</option>
								</select>
							</div>
							<div style="display: grid; justify-content: center;">
								<h6>Detalle de Bienes</h6>
								<textarea style="width: 445px; text-indent: 3"
									name="detalleBienes" rows="4" id="mensajeTextarea"
									oninput="validarTextarea(this)">
							</textarea>
								<span id="mensajeError" style="color: red;"></span>
							</div>
							<div class="modal-footer"
								style="display: flex; justify-content: center; align-items: center; gap: 50px;">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Cancelar</button>
								<button type="button" type="button" id="miBoton"
									onclick="Confirmacion()" class="btn btn-primary"
									disabled="disabled">Registrar</button>
							</div>

							<script type="text/javascript">
    function validarTextarea(textarea) {
      var regex = /^[a-zA-Z0-9.,?!'"()\s]+$/;
      var mensajeError = document.getElementById("mensajeError");
      var boton = document.getElementById('miBoton');

      if (!regex.test(textarea.value)) {
        mensajeError.innerHTML = 'No válido';
        boton.disabled = true;

      } else {
        mensajeError.innerHTML = '';
        boton.disabled = false;


      }
    }
  </script>
							<script type="text/javascript">
							document.getElementById('anualPorcentaje').addEventListener('change', validarCampos);
						    document.getElementById('detalleBienes').addEventListener('input', validarCampos);
						    document.getElementById('miBoton').addEventListener('click', miFuncion);

						    function validarCampos() {
						        var selectElement = document.getElementById('anualPorcentaje');
						        var textareaElement = document.getElementById('detalleBienes');
						        var boton = document.getElementById('miBoton');

						        if ((selectElement.value === null || selectElement.value === "") || (textareaElement.value === null || textareaElement.value.trim() === "")) {
						            boton.disabled = true;
						        } else {
						            boton.disabled = false;
						        }
						    }

							</script>

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


					<div class="seccContendr" style="display: flex;">
						<div class="input-group mb-3">
							<form action="" method="post"
								style="display: flex; width: 250px;">
								<select id="metodoBusqueda" name="metodosBusqueda"
									style="height: 45px; margin-right: 30px;">
									<option value="codigo">Codigo</option>
									<option value="cantidad">Cantidad</option>
									<option value="valor">Valor Libro</option>
									<option value="area">Area</option>

								</select>


								<div class="input-group">
									<input type="search" style=" width: 410px; height: 45px; text-indent: 10px;"
										id="inputBuscar" placeholder="Ingresar Codigo"
										name="BusquedaSeleccionada">
								</div>
							</form>
						</div>

						<script type="text/javascript">
					document.getElementById('metodoBusqueda').addEventListener('change', function () {
					    var opcion = this.value;

					    var inputBusqueda = document.getElementById('inputBuscar');

					    if (opcion === 'cantidad') {
					        inputBusqueda.placeholder = 'Ingresar cantidad';
					    }else if (opcion === 'valor'){
					        inputBusqueda.placeholder = 'Ingresar valor';
					    } else {
					        inputBusqueda.placeholder = 'ingresar codigo';
					    }
					});

					</script>
						<div style="display: flex; gap: 30px; width: 800px;">
							<button type="button" style="height: 45px;"
								class="btn btn-success" data-bs-toggle="modal"
								data-bs-target="#exampleModal">
								Agregar B.
							</button>
							<a href="CrudBajas.jsp"><button type="button"
									style="height: 45px;" class="btn btn-primary">BAJAS</button> </a>
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
							<form action="generarLista" method="get">
								<button type="submit" class="btn btn-outline-danger">
									<i class="bi bi-file-pdf"></i>PDF
								</button>
							</form>
							<button type="button" class="btn btn-outline-success"
								onclick="tableToExcel('testTable','Data')">
								<i class="bi bi-file-earmark-spreadsheet"></i>Excel
							</button>
							<button class="btn btn-outline-primary	"
								onclick="exportTableToCSV('descarga.csv')">
								<i class="bi bi-filetype-csv"></i>CSV
							</button>
						</div>
					</div>
				</div>
			</div>
			<!-- FIN DE LA EXPORTACION DE DATOS -->
		</div>
		<div>
			<h3 style="margin-top: 27px; margin-bottom: 25px;">Lista de Alta</h3>

			<%
			String variableBusqueda = request.getParameter("BusquedaSeleccionada");
			String Busqueda = request.getParameter("metodosBusqueda");

			Connection connection = null;
			PreparedStatement preparedStatement = null;
			ResultSet resultSet = null;
			String sql;

			try {
				connection = AccesoDB.getConnection();
				
				sql = "SELECT " + "    AD.ID AS ID_Area, " + "    'EQ-' + RIGHT('000' + CAST(AD.ID AS VARCHAR(3)), 3) AS CODIGO, "
				+ "    AD.cantidad AS CANTIDAD, " + "    AD.Detalle_Bienes AS DETALLE_BIENES, "
				+ "    AD.Valor_Libro AS VALOR_LIBRO, " + "    FORMAT(AD.Fecha_Ingreso, 'dd-MM-yyyy') AS FECHA_INGRESO, "
				+ "    FORMAT(AD.Fecha_Depreciacion, 'dd-MM-yyyy') AS FECHA_DEPRECIACION, "
				+ "    AD.Fecha_Ingreso AS INGRESO, " + "    AD.Fecha_Depreciacion AS DEPRECIACION, "
				+ "    B.Anual AS BIENES, "
				+ "    FORMAT(COALESCE((AD.Valor_Libro * B.Anual)/100, 0), 'N2') AS DEPRECIACION_ANUAL,"
				+ "    FORMAT(COALESCE(((AD.Valor_Libro * B.Anual)/100)/12, 0), 'N2') AS DEPRECIACION_MENSUAL,"
				+ "    FORMAT(COALESCE((AD.Valor_Libro * B.Anual)/100, 0), 'N2') AS DEPRECIACION_ACUMULADA,"
				+ "    A.Nombres AS AREA," + "    AD.Estado " + "FROM " + "    Area_Detail AD " + "INNER JOIN "
				+ "    Bienes B ON AD.Bienes_ID = B.ID " + "	   INNER JOIN Area A ON AD.Area_ID = A.ID"
				+ "	   Where Estado = 'ALTA' " + "ORDER BY DETALLE_BIENES ASC;";

				preparedStatement = connection.prepareStatement(sql);

				if (variableBusqueda != null) {
					switch (Busqueda) {
				case "codigo" :
					sql = "SELECT " + "    AD.ID AS ID_Area, "
							+ "    'EQ-' + RIGHT('000' + CAST(AD.ID AS VARCHAR(3)), 3) AS CODIGO, "
							+ "    AD.cantidad AS CANTIDAD, " + "    AD.Detalle_Bienes AS DETALLE_BIENES, "
							+ "    AD.Valor_Libro AS VALOR_LIBRO, "
							+ "    FORMAT(AD.Fecha_Ingreso, 'dd-MM-yyyy') AS FECHA_INGRESO, "
							+ "    FORMAT(AD.Fecha_Depreciacion, 'dd-MM-yyyy') AS FECHA_DEPRECIACION, "
							+ "    AD.Fecha_Ingreso AS INGRESO, " + "    AD.Fecha_Depreciacion AS DEPRECIACION, "
							+ "    B.Anual AS BIENES, "
							+ "    FORMAT(COALESCE((AD.Valor_Libro * B.Anual)/100, 0), 'N2') AS DEPRECIACION_ANUAL,"
							+ "    FORMAT(COALESCE(((AD.Valor_Libro * B.Anual)/100)/12, 0), 'N2') AS DEPRECIACION_MENSUAL,"
							+ "    FORMAT(COALESCE((AD.Valor_Libro * B.Anual)/100, 0), 'N2') AS DEPRECIACION_ACUMULADA,"
							+ "    A.Nombres AS AREA," + "    AD.Estado " + "FROM " + " Area_Detail AD " + "INNER JOIN "
							+ "    Bienes B ON AD.Bienes_ID = B.ID " + "	   INNER JOIN Area A ON AD.Area_ID = A.ID"
							+ "	   Where Estado = 'ALTA' and 'EQ-' + RIGHT('000' + CAST(AD.ID AS VARCHAR(3)), 3) = ? ";
					preparedStatement = connection.prepareStatement(sql);
					preparedStatement.setString(1, variableBusqueda);
					break;
				case "cantidad" :
					sql = "SELECT " + "AD.ID AS ID_Area, "
							+ "'EQ-' + RIGHT('000' + CAST(AD.ID AS VARCHAR(3)), 3) AS CODIGO, "
							+ "AD.cantidad AS CANTIDAD, " + "AD.Detalle_Bienes AS DETALLE_BIENES, "
							+ "AD.Valor_Libro AS VALOR_LIBRO, "
							+ "FORMAT(AD.Fecha_Ingreso, 'dd-MM-yyyy') AS FECHA_INGRESO, "
							+ "FORMAT(AD.Fecha_Depreciacion, 'dd-MM-yyyy') AS FECHA_DEPRECIACION, "
							+ "AD.Fecha_Ingreso AS INGRESO, " + "AD.Fecha_Depreciacion AS DEPRECIACION, "
							+ "B.Anual AS BIENES, "
							+ "FORMAT(COALESCE((AD.Valor_Libro * B.Anual)/100, 0), 'N2') AS DEPRECIACION_ANUAL, "
							+ "FORMAT(COALESCE(((AD.Valor_Libro * B.Anual)/100)/12, 0), 'N2') AS DEPRECIACION_MENSUAL, "
							+ "FORMAT(COALESCE((AD.Valor_Libro * B.Anual)/100, 0), 'N2') AS DEPRECIACION_ACUMULADA, "
							+ "A.Nombres AS AREA, " + "AD.Estado " + "FROM Area_Detail AD "
							+ "INNER JOIN Bienes B ON AD.Bienes_ID = B.ID " + "INNER JOIN Area A ON AD.Area_ID = A.ID "
							+ "WHERE Estado = 'ALTA' AND Cantidad = ?";
					preparedStatement = connection.prepareStatement(sql);
					preparedStatement.setString(1, variableBusqueda);
					break;
				case "valor" :
					sql = "SELECT " + "AD.ID AS ID_Area, "
							+ "'EQ-' + RIGHT('000' + CAST(AD.ID AS VARCHAR(3)), 3) AS CODIGO, "
							+ "AD.cantidad AS CANTIDAD, " + "AD.Detalle_Bienes AS DETALLE_BIENES, "
							+ "AD.Valor_Libro AS VALOR_LIBRO, "
							+ "FORMAT(AD.Fecha_Ingreso, 'dd-MM-yyyy') AS FECHA_INGRESO, "
							+ "FORMAT(AD.Fecha_Depreciacion, 'dd-MM-yyyy') AS FECHA_DEPRECIACION, "
							+ "AD.Fecha_Ingreso AS INGRESO, " + "AD.Fecha_Depreciacion AS DEPRECIACION, "
							+ "B.Anual AS BIENES, "
							+ "FORMAT(COALESCE((AD.Valor_Libro * B.Anual)/100, 0), 'N2') AS DEPRECIACION_ANUAL, "
							+ "FORMAT(COALESCE(((AD.Valor_Libro * B.Anual)/100)/12, 0), 'N2') AS DEPRECIACION_MENSUAL, "
							+ "FORMAT(COALESCE((AD.Valor_Libro * B.Anual)/100, 0), 'N2') AS DEPRECIACION_ACUMULADA, "
							+ "A.Nombres AS AREA, " + "AD.Estado " + "FROM Area_Detail AD "
							+ "INNER JOIN Bienes B ON AD.Bienes_ID = B.ID " + "INNER JOIN Area A ON AD.Area_ID = A.ID "
							+ "WHERE Estado = 'ALTA' AND VALOR_LIBRO = ?";
					preparedStatement = connection.prepareStatement(sql);
					preparedStatement.setString(1, variableBusqueda);
					break;
				case "area" :
					sql = "SELECT " + "AD.ID AS ID_Area, "
							+ "'EQ-' + RIGHT('000' + CAST(AD.ID AS VARCHAR(3)), 3) AS CODIGO, "
							+ "AD.cantidad AS CANTIDAD, " + "AD.Detalle_Bienes AS DETALLE_BIENES, "
							+ "AD.Valor_Libro AS VALOR_LIBRO, "
							+ "FORMAT(AD.Fecha_Ingreso, 'dd-MM-yyyy') AS FECHA_INGRESO, "
							+ "FORMAT(AD.Fecha_Depreciacion, 'dd-MM-yyyy') AS FECHA_DEPRECIACION, "
							+ "AD.Fecha_Ingreso AS INGRESO, " + "AD.Fecha_Depreciacion AS DEPRECIACION, "
							+ "B.Anual AS BIENES, "
							+ "FORMAT(COALESCE((AD.Valor_Libro * B.Anual)/100, 0), 'N2') AS DEPRECIACION_ANUAL, "
							+ "FORMAT(COALESCE(((AD.Valor_Libro * B.Anual)/100)/12, 0), 'N2') AS DEPRECIACION_MENSUAL, "
							+ "FORMAT(COALESCE((AD.Valor_Libro * B.Anual)/100, 0), 'N2') AS DEPRECIACION_ACUMULADA, "
							+ "A.Nombres AS AREA, " + "AD.Estado " + "FROM Area_Detail AD "
							+ "INNER JOIN Bienes B ON AD.Bienes_ID = B.ID " + "INNER JOIN Area A ON AD.Area_ID = A.ID "
							+ "WHERE Estado = 'ALTA' AND A.Nombres = ?";
					preparedStatement = connection.prepareStatement(sql);
					preparedStatement.setString(1, variableBusqueda);
					break;
					}

					resultSet = preparedStatement.executeQuery();
				}

				resultSet = preparedStatement.executeQuery();
			%>

			<table
				class="table table-bordered table-striped table-hover table-sm"
				id="testTable" style="border: 2px solid gray; text-align: center;">
				<thead>
					<tr>
						<th scope="col">CODIGO</th>
						<th scope="col">CANTIDAD</th>
						<th scope="col">DETALLE</th>
						<th scope="col">VALOR LIBRO</th>
						<th scope="col">FECHA INGRESO</th>
						<th scope="col">FECHA DEPRECIACION</th>
						<th scope="col">DEPRECIACION ANUAL</th>
						<th scope="col">DEPRECIACION MENSUAL</th>
						<th scope="col">DEPRECIACION ACUMULADA</th>
						<th scope="col">AREA</th>
						<th scope="col">ACCIONES</th>

					</tr>
				</thead>
				<tbody>
					<%
					while (resultSet.next()) {
						String ID = resultSet.getString("ID_Area");
						String codigo = resultSet.getString("CODIGO");
						String cantidad = resultSet.getString("CANTIDAD");
						String detalleBienes = resultSet.getString("DETALLE_BIENES");
						String valor_libro = resultSet.getString("VALOR_LIBRO");
						String fecha = resultSet.getString("FECHA_INGRESO");
						String fecha_depreciacion = resultSet.getString("FECHA_DEPRECIACION");
						String depreciacion_Anual = resultSet.getString("DEPRECIACION_ANUAL");
						String depreciacion_Mensual = resultSet.getString("DEPRECIACION_MENSUAL");
						String depreciacion_Acumulada = resultSet.getString("DEPRECIACION_ACUMULADA");
						String Estado = resultSet.getString("Estado");
						String Ingreso = resultSet.getString("INGRESO");
						String Depreciacion = resultSet.getString("DEPRECIACION");
						String Bienes = resultSet.getString("BIENES");
						String area = resultSet.getString("AREA");
					%>
					<tr>
						<td><%=codigo%></td>
						<td><%=cantidad%></td>
						<td><%=detalleBienes%></td>
						<td><%=valor_libro%></td>
						<td><%=fecha%></td>
						<td><%=fecha_depreciacion%></td>
						<td><%=depreciacion_Anual%></td>
						<td><%=depreciacion_Mensual%></td>
						<td><%=depreciacion_Acumulada%></td>
						<td><%=area%></td>
						<td>
							<div style="display: flex; justify-content: center; gap: 30px;">

								<a
									href="Editar.jsp?ID=<%=ID%>&codigo=<%=codigo%>&cantidad=<%=cantidad%>&detalleBienes=<%=detalleBienes%>&valor_libro=<%=valor_libro%>&fecha=<%=Ingreso%>&fecha_depreciacion=<%=Depreciacion%>&Bienes=<%=Bienes%>&area=<%=area%>">
									<button type="button" class="btn btn-secondary">
										<i class="bi bi-pencil-square"></i>
									</button>
								</a>

								<form action="Eliminar" method="post"
									id="formEliminacion<%=ID%>">
									<input type="hidden" id="codigo" name="codigo" value="<%=ID%>">
									<input type="hidden" id="estado" name="estado"
										value="<%=Estado%>">
									<button type="button"
										onclick="eliminar(document.getElementById('formEliminacion<%=ID%>'))"
										id="btnAE" class="btn btn-danger">
										<i class="bi bi-trash-fill"></i>
									</button>
									<script type="text/javascript">
        function eliminar(formulario) {
            Swal.fire({
                title: "Confirmación",
                text: "¿Desea Eliminar?",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "Eliminar"
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire({
                        title: "Eliminado!!",
                        text: " ha sido eliminado lógicamente",
                        icon: "success"
                    });
                    setTimeout(() => {
                        formulario.submit();
                    }, 3000);
                }
            });
        }
    </script>
								</form>

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
        text: "¿Desea agregar?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Agregar"
      }).then((result) => {
        if (result.isConfirmed) {
          Swal.fire({
            title: "Agregado!!",
            text: "Agregado Correctamente",
            icon: "success"
          });

          setTimeout(() => {
            document.getElementById("miFormulario").submit();
          }, 3000);
        }
      });
   
  }</script>

		<script type="text/javascript">
	var tableToExcel = (function() {
		 var uri = 'data:application/vnd.ms-excel;base64,'
		 , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>'
		 , base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) }
		 , format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }) }
		 return function(table, name) {
		 if (!table.nodeType) table = document.getElementById(table)
		 var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}
		 window.location.href = uri + base64(format(template, ctx))
		 }
		})()
	</script>

		<script type="text/javascript">	
	function downloadCSV(csv, filename) {
	 var csvFile;
	 var downloadLink;
	 // CSV file
	 csvFile = new Blob([csv], {type: "text/csv"});
	 // Download link
	 downloadLink = document.createElement("a");
	 // File name
	 downloadLink.download = filename;
	 // Create a link to the file
	 downloadLink.href = window.URL.createObjectURL(csvFile);
	 // Hide download link
	 downloadLink.style.display = "none";
	 // Add the link to DOM
	 document.body.appendChild(downloadLink);
	 // Click download link
	 downloadLink.click();
	}
	
	function exportTableToCSV(filename) {
	 var csv = [];
	 var rows = document.querySelectorAll("table tr");
	
	 for (var i = 0; i < rows.length; i++) {
	 var row = [], cols = rows[i].querySelectorAll("td, th");
	
	 for (var j = 0; j < cols.length; j++)
	 row.push(cols[j].innerText);
	
	 csv.push(row.join(","));
	 }
	 // Download CSV file
	 downloadCSV(csv.join("n"), filename);
	}
	
	</script>
	</div>
</body>
</html>