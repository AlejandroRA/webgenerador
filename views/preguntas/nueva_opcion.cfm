<cfprocessingdirective pageEncoding="utf-8">
<h3>Agregar opción</h3> 
<form role="form" onsubmit="return agregarOpcion('<cfoutput>#prc.pregunta#</cfoutput>');" method="post">
    <div class="form-group"><label>Descripción</label> <input <!--- value="<cfoutput>#prc.opcion.descripcion#</cfoutput>" --->   id="descripcion_op_n" type="text" placeholder="Descripción" class="form-control" required=""></div>
    <div class="form-group"><label>Orden</label> <input <!--- value="<cfoutput>#prc.opcion.orden#</cfoutput>" --->  id="orden_op_n" type="text" placeholder="Orden" class="form-control" required=""></div>
    <div>
        <button type="button" style="margin-left: 10px;" class="btn  btn-default float-right m-t-n-xs" onclick="closeAgregar();"><span aria-hidden="true"> Cancelar</span><span class="sr-only">Close</span></button> 
        <button class="btn  btn-success float-right m-t-n-xs" type="submit"><strong><i class="fa fa-plus" aria-hidden="true"></i> Agregar</strong></button>
    </div>
</form>
<script type="text/javascript">
	function closeAgregar(){
		$('#agregarOpcion').hide('slice');
	}
	function agregarOpcion(pregunta){
		var descripcion  = $('#descripcion_op_n').val();
		var orden  = $('#orden_op_n').val();

		$.post('/index.cfm/cuestionarios/cuestionarios/agregarOpcion',{
			pregunta: pregunta,
			descripcion : descripcion,
			orden :  orden
		},function(data){
			swal({
                    title: "Exito",
                    text: "La opción ha sido agregada a la pregunta.",
                    type: "success"   
                    });
			refrescaConfiguracion(pregunta);
		});
		
		
		return false;
	}
</script>