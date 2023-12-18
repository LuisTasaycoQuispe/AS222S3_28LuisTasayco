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


	<div class="contenidoCrud"  style="width: 1340px; margin-left: 60px;">

		<div style="display: flex; gap: 25px; align-items: center;">
			<h1 style="position: relative; top: 25px; margin-bottom: 50px;">JAS
				DIGITAL</h1>
			<div class="rectLado"></div>
		</div>




		<div class="card">
			<div
				style="background-color: #F2F2F2; color: #182361; border-bottom: 1px solid rgb(180, 180, 180); border-radius: 5px 5px 0 0;">
				<h5 class="card-title">Consultas</h5>
			</div>
			<div class="card-body">

				<div style="display: flex;">
					<h3 style="margin-right: 20px;">Buscar:</h3>

					<div class="seccContendr">
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
									<input type="search" style="height: 45px; text-indent: 10px;"
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

					</div>
					<div style="display: flex;z-index:30;margin-left:90px; gap: 30px; width: 800px;">

						<a  href="index.jsp"><button type="button"
								class="btn btn-primary">ALTAS</button>
						</a>

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
						<form action="generarInforme" method="get">
							<button type="submit" class="btn btn-outline-danger">
								<i class="bi bi-file-pdf"></i>PDF
							</button>
						</form>
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
	<div style="width: 1200px; margin-left: 100px;">
		<h3 style="margin-top: 27px; margin-bottom: 25px;">Lista de Baja</h3>

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
					+ "    A.Nombres AS AREA,"
					+ "    AD.Estado " + "FROM " + "    Area_Detail AD " + "INNER JOIN "
					+ "    Bienes B ON AD.Bienes_ID = B.ID " 
					+ "	   INNER JOIN Area A ON AD.Area_ID = A.ID"	
					+ "	   Where Estado = 'BAJA' " + "ORDER BY DETALLE_BIENES ASC;";
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
							+ "    A.Nombres AS AREA,"
							+ "    AD.Estado " + "FROM " + " Area_Detail AD " + "INNER JOIN "
							+ "    Bienes B ON AD.Bienes_ID = B.ID " 
							+ "	   INNER JOIN Area A ON AD.Area_ID = A.ID"	
							+ "	   Where Estado = 'BAJA' and 'EQ-' + RIGHT('000' + CAST(AD.ID AS VARCHAR(3)), 3) = ? ";
					preparedStatement = connection.prepareStatement(sql);
					preparedStatement.setString(1, variableBusqueda);
					break;
				case "cantidad" :
					sql = "SELECT "
					        + "AD.ID AS ID_Area, "
					        + "'EQ-' + RIGHT('000' + CAST(AD.ID AS VARCHAR(3)), 3) AS CODIGO, "
					        + "AD.cantidad AS CANTIDAD, "
					        + "AD.Detalle_Bienes AS DETALLE_BIENES, "
					        + "AD.Valor_Libro AS VALOR_LIBRO, "
					        + "FORMAT(AD.Fecha_Ingreso, 'dd-MM-yyyy') AS FECHA_INGRESO, "
					        + "FORMAT(AD.Fecha_Depreciacion, 'dd-MM-yyyy') AS FECHA_DEPRECIACION, "
					        + "AD.Fecha_Ingreso AS INGRESO, "
					        + "AD.Fecha_Depreciacion AS DEPRECIACION, "
					        + "B.Anual AS BIENES, "
					        + "FORMAT(COALESCE((AD.Valor_Libro * B.Anual)/100, 0), 'N2') AS DEPRECIACION_ANUAL, "
					        + "FORMAT(COALESCE(((AD.Valor_Libro * B.Anual)/100)/12, 0), 'N2') AS DEPRECIACION_MENSUAL, "
					        + "FORMAT(COALESCE((AD.Valor_Libro * B.Anual)/100, 0), 'N2') AS DEPRECIACION_ACUMULADA, "
					        + "A.Nombres AS AREA, "
					        + "AD.Estado "
					        + "FROM Area_Detail AD "
					        + "INNER JOIN Bienes B ON AD.Bienes_ID = B.ID "
					        + "INNER JOIN Area A ON AD.Area_ID = A.ID "
					        + "WHERE Estado = 'BAJA' AND Cantidad = ?";
					preparedStatement = connection.prepareStatement(sql);
					preparedStatement.setString(1, variableBusqueda);
					break;
				case "valor" :
					sql = "SELECT "
					        + "AD.ID AS ID_Area, "
					        + "'EQ-' + RIGHT('000' + CAST(AD.ID AS VARCHAR(3)), 3) AS CODIGO, "
					        + "AD.cantidad AS CANTIDAD, "
					        + "AD.Detalle_Bienes AS DETALLE_BIENES, "
					        + "AD.Valor_Libro AS VALOR_LIBRO, "
					        + "FORMAT(AD.Fecha_Ingreso, 'dd-MM-yyyy') AS FECHA_INGRESO, "
					        + "FORMAT(AD.Fecha_Depreciacion, 'dd-MM-yyyy') AS FECHA_DEPRECIACION, "
					        + "AD.Fecha_Ingreso AS INGRESO, "
					        + "AD.Fecha_Depreciacion AS DEPRECIACION, "
					        + "B.Anual AS BIENES, "
					        + "FORMAT(COALESCE((AD.Valor_Libro * B.Anual)/100, 0), 'N2') AS DEPRECIACION_ANUAL, "
					        + "FORMAT(COALESCE(((AD.Valor_Libro * B.Anual)/100)/12, 0), 'N2') AS DEPRECIACION_MENSUAL, "
					        + "FORMAT(COALESCE((AD.Valor_Libro * B.Anual)/100, 0), 'N2') AS DEPRECIACION_ACUMULADA, "
					        + "A.Nombres AS AREA, "
					        + "AD.Estado "
					        + "FROM Area_Detail AD "
					        + "INNER JOIN Bienes B ON AD.Bienes_ID = B.ID "
					        + "INNER JOIN Area A ON AD.Area_ID = A.ID "
					        + "WHERE Estado = 'BAJA' AND VALOR_LIBRO = ?";
					preparedStatement = connection.prepareStatement(sql);
					preparedStatement.setString(1, variableBusqueda);
					break;
				case "area" :
					sql = "SELECT "
					        + "AD.ID AS ID_Area, "
					        + "'EQ-' + RIGHT('000' + CAST(AD.ID AS VARCHAR(3)), 3) AS CODIGO, "
					        + "AD.cantidad AS CANTIDAD, "
					        + "AD.Detalle_Bienes AS DETALLE_BIENES, "
					        + "AD.Valor_Libro AS VALOR_LIBRO, "
					        + "FORMAT(AD.Fecha_Ingreso, 'dd-MM-yyyy') AS FECHA_INGRESO, "
					        + "FORMAT(AD.Fecha_Depreciacion, 'dd-MM-yyyy') AS FECHA_DEPRECIACION, "
					        + "AD.Fecha_Ingreso AS INGRESO, "
					        + "AD.Fecha_Depreciacion AS DEPRECIACION, "
					        + "B.Anual AS BIENES, "
					        + "FORMAT(COALESCE((AD.Valor_Libro * B.Anual)/100, 0), 'N2') AS DEPRECIACION_ANUAL, "
					        + "FORMAT(COALESCE(((AD.Valor_Libro * B.Anual)/100)/12, 0), 'N2') AS DEPRECIACION_MENSUAL, "
					        + "FORMAT(COALESCE((AD.Valor_Libro * B.Anual)/100, 0), 'N2') AS DEPRECIACION_ACUMULADA, "
					        + "A.Nombres AS AREA, "
					        + "AD.Estado "
					        + "FROM Area_Detail AD "
					        + "INNER JOIN Bienes B ON AD.Bienes_ID = B.ID "
					        + "INNER JOIN Area A ON AD.Area_ID = A.ID "
					        + "WHERE Estado = 'BAJA' AND A.Nombres = ?";
					preparedStatement = connection.prepareStatement(sql);
					preparedStatement.setString(1, variableBusqueda);
					break;
				}
				resultSet = preparedStatement.executeQuery();
			}

			resultSet = preparedStatement.executeQuery();
		%>

		<table class="table table-bordered table-striped table-hover table-sm"
			id="testTable" style="border: 2px solid gray;margin-left:-40px;width:1340px; text-align: center;">
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
					String detalle_bienes = resultSet.getString("DETALLE_BIENES");
					String valor_libro = resultSet.getString("VALOR_LIBRO");
					String fecha = resultSet.getString("FECHA_INGRESO");
					String fecha_depreciacion = resultSet.getString("FECHA_DEPRECIACION");
					String depreciacion_Anual = resultSet.getString("DEPRECIACION_ANUAL");
					String depreciacion_Mensual = resultSet.getString("DEPRECIACION_MENSUAL");
					String depreciacion_Acumulada = resultSet.getString("DEPRECIACION_ACUMULADA");
					String Estado = resultSet.getString("Estado");
					String area = resultSet.getString("AREA");

					String Bienes = resultSet.getString("BIENES");
				%>
				<tr>
					<td><%=codigo%></td>
					<td><%=cantidad%></td>
					<td><%=detalle_bienes%></td>
					<td><%=valor_libro%></td>
					<td><%=fecha%></td>
					<td><%=fecha_depreciacion%></td>
					<td><%=depreciacion_Anual%></td>
					<td><%=depreciacion_Mensual%></td>
					<td><%=depreciacion_Acumulada%></td>
					<td><%=area%></td>
					
					<td>
						<div style="display: flex; justify-content: center; gap: 30px;">

							<form action="Eliminar" method="post" id="restaurar<%=ID%>">

								<input type="hidden" id="codigo" name="codigo" value="<%=ID%>">
								<input type="hidden" id="codigo" name="estado"
									value="<%=Estado%>"> <input type="button" id="btnAE"
									onclick="restaurarGalpon(document.getElementById('restaurar<%=ID%>'))"
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