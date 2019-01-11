<!--- <cfdump var="#prc#"> --->
<cfprocessingdirective pageEncoding="utf-8">
<h3>Configuración</h3>
<form role="form" onsubmit="return edicionOpcion('<cfoutput>#prc.id#</cfoutput>');" method="post">
    <div class="form-group"><label>Descripción</label> <input value="<cfoutput>#prc.opcion.descripcion#</cfoutput>"   id="descripcion_op_ed" type="text" placeholder="Descripción" class="form-control" required=""></div>
        <div class="form-group"><label>Orden</label> <input value="<cfoutput>#prc.opcion.orden#</cfoutput>"  id="orden_op_ed" type="number" placeholder="Orden" class="form-control" required=""></div>
        <div>
            <!--- <button type="button" style="margin-left: 10px;" class="btn  btn-default float-right m-t-n-xs" data-dismiss="modal"><span aria-hidden="true"> Cancelar</span><span class="sr-only">Close</span></button>  --->
            
            <button class="btn  btn-warning float-right m-t-n-xs" type="submit"><strong><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Editar</strong></button>

        </div>
</form>

<button style="margin-right: 10px;" class="btn  btn-danger float-right m-t-n-xs" onclick="eliminarOpcion('<cfoutput>#prc.id#</cfoutput>')"><strong><i class="fa fa-trash" aria-hidden="true"></i> Eliminar</strong></button>
<script type="text/javascript">


	function eliminarOpcion(id){
		$.post('/index.cfm/cuestionarios/cuestionarios/eliminarOpcion',{
			opcion : id
		},function(data){
			swal({
                    title: "Exito",
                    text: "La opción ha sido eliminada.",
                    type: "success"   
                    });
			refrescaConfiguracion(<cfoutput>#prc.pregunta#</cfoutput>);
		});
	}
	function edicionOpcion(id){
		var descripcion = $('#descripcion_op_ed').val();
		var orden = $('#orden_op_ed').val();

		$.post('/index.cfm/cuestionarios/cuestionarios/editarOpcion',{
			opcion : id,
			descripcion :  descripcion,
			orden :  orden
		},function(data){
			swal({
                    title: "Exito",
                    text: "La opción ha sido editada.",
                    type: "success"   
                    });
			refrescaConfiguracion(<cfoutput>#prc.pregunta#</cfoutput>);
		});
		return false;
	}
</script>