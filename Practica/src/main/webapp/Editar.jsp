
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

	</div>

	<%
	String codigo = request.getParameter("codigo");
	String cantidad = request.getParameter("cantidad");
	String detalle_bienes = request.getParameter("detalle_bienes");
	String valor_libro = request.getParameter("valor_libro");

	String fecha = request.getParameter("fecha");

	String fecha_depreciacion = request.getParameter("fecha_depreciacion");
	String persona = request.getParameter("persona");

	String area = request.getParameter("area");
	%>

	<div class="contenidoCrud">
		<div style="display: flex; gap: 25px; align-items: center;">
			<h1 style="position: relative; top: 25px; margin-bottom: 50px;">Editar Registro</h1>
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
					<h3>Codigo</h3>
					<input type="text" name="codigo" value="<%=codigo%>" disabled="disabled">
					<h3>Cantidad</h3>
					<input type="text"  name="cantidad"  value="<%=cantidad%>">
					<h3>Detalle</h3>
					<input type="text" name="detalle" value="<%=detalle_bienes%>">
					<h3>Fecha</h3>
					<input type="text" value="<%=fecha%>"  disabled="disabled">
					<h3>Fecha Depreciacion</h3>
					<input type="date" name="fecha_depreciacion" value="<%=fecha_depreciacion%>">
					<h3>Persona</h3>					
					<select name="persona" id="persona">
								<option value="1"
									<%=persona.equals("AVILA RIOS, ANA") ? "selected" : ""%>>Ana
									Avila Rios</option>
								<option value="2"
									<%=persona.equals("CAMPOS PEREZ, MARIA") ? "selected" : ""%>>Campos Perez Maria</option>
								<option value="3"
									<%=persona.equals("ROSALES PORRAS, CLAUDIO") ? "selected" : ""%>>Claudio
									Rosales Torres</option>
								<option value="4"
									<%=persona.equals("MAYURÍ TARAZONA, JUAN") ? "selected" : ""%>>Juan
									Mayuri Tarazona</option>
								<option value="5"
									<%=persona.equals("	GUERRA SOLANO, LUIS") ? "selected" : ""%>>Luis
									Guerra Solano</option>
								
							</select>
					
					
					<h3>Area</h3>
					<input type="text" value="<%=area%>"  disabled="disabled">
					<div>
						<button id="actualizarButton" onclick="alerta()" type="button"
							class="btn btn-success">ACTUALIZAR</button>
					</div>

				</form>
			</div>


<script type="text/javascript">
					
					function alerta(){
						
						Swal.fire({
							  title: "Are you sure?",
							  text: "You won't be able to revert this!",
							  icon: "warning",
							  showCancelButton: true,
							  confirmButtonColor: "#3085d6",
							  cancelButtonColor: "#d33",
							  confirmButtonText: "Actualizar"

							}).then((result) => {
							  if (result.isConfirmed) {  
							    Swal.fire({
							      title: "Actualizado!",
							      text: "Galpon Actualizado Con Exito.",
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

</body>

</html>