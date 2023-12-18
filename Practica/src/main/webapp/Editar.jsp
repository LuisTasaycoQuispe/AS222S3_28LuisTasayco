<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Bostrap</title>
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
<link rel="stylesheet" href="static/css/style.css">


<!-- Boostrap 3  -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>


</head>

<body>


	<%
	String ID = request.getParameter("ID");

	String codigo = request.getParameter("codigo");
	String cantidad = request.getParameter("cantidad");
	String area = request.getParameter("area");

	String detalle_bienes = request.getParameter("detalleBienes");
	String valor_libro = request.getParameter("valor_libro");

	String fecha = request.getParameter("fecha");
	String Bienes = request.getParameter("Bienes");

	String fecha_depreciacion = request.getParameter("fecha_depreciacion");
	%>

	<div style="width: 1000px; margin-left: 150px;">
		<div style="display: flex; gap: 25px; align-items: center;">
			<h1 style="position: relative; top: 25px; margin-bottom: 50px;">Editar
				Registro</h1>
			<div class="rectLado"></div>

		</div>

		<div>
			<div class="panel panel-default"
				style="border: 1px solid rgb(133, 133, 133);">
				<div style="display: flex;" class="panel-heading">
					Información personal
					<div style="position: relative; left: 620px;">Última
						actualización: 12/13/2023</div>
				</div>
				<form action="Editar" method="post" id="EditarForm">
					<input type="text" value="<%=ID%>" name="id"
						style="visibility: hidden;">
					<div style="display: flex; justify-content: center; gap: 130px;">
						<div>
							<h3>Codigo</h3>
							<input style="width: 350px; height: 30px;" type="text"
								name="codigo" value="<%=codigo%>" disabled="disabled">
						</div>
						<div>

							<h3>Cantidad</h3>
							<input style="width: 350px; height: 30px;" type="text"
								name="cantidad" value="<%=cantidad%>">
						</div>
					</div>

					<div style="display: flex; justify-content: center; gap: 130px;">
						<div>
							<h3>Valor Libro</h3>
							<input style="width: 350px; height: 30px;" type="text"
								name="valorLibro" value="<%=valor_libro%>" readonly="readonly">
						</div>

						<div>
							<h3>Depreciacion Porcentaje</h3>
							<select style="width: 350px; height: 30px;" name="bienes"
								id="bienes">
								<option value="1" <%=Bienes.equals("0.20") ? "selected" : ""%>>20%</option>
								<option value="2" <%=Bienes.equals("0.25") ? "selected" : ""%>>25%</option>
								<option value="3" <%=Bienes.equals("0.10") ? "selected" : ""%>>10%</option>

							</select>
						</div>
					</div>
					<div style="display: flex; justify-content: center; gap: 130px;">
						<div>
							<h3>Fecha</h3>
							<input style="width: 350px; height: 30px;" type="date"
								name="fechaIngreso" value="<%=fecha%>"  max="2023-12-31" min="2023-01-01">
						</div>
						<div>
							<h3>Fecha Depreciacion</h3>
							<input style="width: 350px; height: 30px;" type="date"
								name="fechaDepreciacion" value="<%=fecha_depreciacion%>"
								readonly="readonly">
						</div>
					</div>
					
					<div style="display: grid; justify-content: center; ">
					<div>
						<h3>Area</h3>
						<select style="width: 830px; height: 30px;" name="area"
							id="bienes">
							<option value="1"
								<%=area.equals("PRODUCCION") ? "selected" : ""%>>Produccion</option>
							<option value="2"
								<%=area.equals("CONTABILIDAD") ? "selected" : ""%>>Contabilidad</option>
							<option value="3" <%=area.equals("MARKETING") ? "selected" : ""%>>Marketing</option>
							<option value="4"
								<%=area.equals("RECURSOS HUMANOS") ? "selected" : ""%>>Recursos
								Humanos</option>
							<option value="5" <%=area.equals("VENTAS") ? "selected" : ""%>>Ventas</option>

						</select>
					</div>
						<div>
							<h3>Detalle</h3>
							<input style="width: 830px; height: 30px;" type="text"
								name="detalle" value="<%=detalle_bienes%>">
						</div>
					</div>
					<div
						style="display: flex; justify-content: center; gap: 130px; margin-top: 30px; margin-bottom: 30px;">
						<a href="index.jsp"><button type="button" class="btn btn-info">CANCELAR</button></a>

						<button id="actualizarButton" onclick="alerta()" type="button"
							class="btn btn-success">ACTUALIZAR</button>

					</div>

				</form>
			</div>


			<script type="text/javascript">
					
					function alerta(){
						
						Swal.fire({
							  title: "Esta Seguro?",
							  text: "Desea Actualizar estos Datos!",
							  icon: "warning",
							  showCancelButton: true,
							  confirmButtonColor: "#3085d6",
							  cancelButtonColor: "#d33",
							  confirmButtonText: "Actualizar"

							}).then((result) => {
							  if (result.isConfirmed) {  
							    Swal.fire({
							      title: "Actualizado!",
							      text: "Datos Actualizado Con Exito.",
							      icon: "success"
							    });
							    setTimeout(() => {
					            	document.getElementById("EditarForm").submit();
		            			}, "3000");
							  }
							});
						
					
					}
				
				</script>
		</div>
	</div>

</body>

</html>