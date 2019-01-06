<style type="text/css">
.responsive {
    	max-width: 80%;
    	height: auto;
	}
</style>
<cfprocessingdirective pageEncoding="utf-8">
<div class="row">
	<div class="col-4">
		<center><img class="responsive"  src="/includes/img/cuestionarios/cuestionarios.png" ></center>
	</div>
	<div class="col-8">
		<h2> Datos Generales </h2>
        <font size="3">
            <p><b>Nombre:&nbsp;</b> <cfoutput>#prc.cuestionarios.nombre#</cfoutput></p>
            <p><b>Descripcion:&nbsp; </b>  <cfoutput>#prc.cuestionarios.descripcion#</cfoutput></p> 
            <p><b>Fecha creación:&nbsp; </b>  <cfoutput>#prc.cuestionarios.fecha_creacion#</cfoutput></p> 
            <p><b>Fecha de la ultima modificación:&nbsp; </b>  <cfoutput>#prc.cuestionarios.fecha_modificacion#</cfoutput></p> 
            <p><b>Fecha de fin:&nbsp; </b>  <cfoutput>#prc.cuestionarios.fecha_fin#</cfoutput></p> 
            <p><b>Clave de acceso:&nbsp; </b>  <cfoutput>#prc.cuestionarios.contrasena#</cfoutput></p>
            <!--- <p><b>Correo electrónico:&nbsp; </b>  <cfoutput>#Lcase(session.cbstorage.usuario.correo)#</cfoutput></p> --->                         
        </font>
        <button style="float: right;" class="btn btn-warning" onclick="editarDatosGeneralesCuestionario();"><i class="fa fa-edit" aria-hidden="true"></i> Editar datos</button>
	</div>
</div>

<script type="text/javascript">
	function editarDatosGeneralesCuestionario(){
		$.post('/index.cfm/cuestionarios/cuestionarios/edicionDatosGenerales',{
			id: <cfoutput>#prc.cuestionarios.id#</cfoutput>,
			estado : 2
		},
			function(data){
				$('#formulario').html(data);
				$('#modal-cuestionario').modal('toggle');
			});

	}
</script>