<cfprocessingdirective pageEncoding="utf-8">
<div class="panel panel-success">
    <div class="panel-heading titulo-panel">
        <!--- <cfoutput>#prc.cuestionarios.nombre# - #prc.cuestionarios.descripcion#</cfoutput> --->
        <h3>Detalles de cuestionario
        <i onclick="cerrarConfiguracion();" style="float: right; cursor: pointer;" class="fa fa-times fa-3" aria-hidden="true"></i> </h3>    
    </div>
    <div class="panel-body configuracion">      
        <div class="tabs-container">
            <ul class="nav nav-tabs" role="tablist">
                <li><a class="nav-link active" data-toggle="tab" href="#tab-1"> Datos generales</a></li>
                <li><a class="nav-link" data-toggle="tab" href="#tab-2">Formulario de ingreso</a></li>
                <li><a class="nav-link" data-toggle="tab" href="#tab-3">Preguntas de cuestionario</a></li>                
            </ul>
            <div class="tab-content">
                <div role="tabpanel" id="tab-1" class="tab-pane active">
                    <div class="panel-body datosGeneralesB">
                    </div>
                </div>
                <div role="tabpanel" id="tab-2" class="tab-pane">
                    <div class="panel-body preguntasFormulario">
                    </div>
                </div>
                <div role="tabpanel" id="tab-3" class="tab-pane">
                    <div class="panel-body preguntasCuestionario">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>





<script type="text/javascript">
	$(document).ready(function(){
		cargaDatosGenerales();
		cargaPreguntasFormulario(1,'.preguntasFormulario');
        setTimeout(function(){ cargaPreguntasFormulario(2,'.preguntasCuestionario'); }, 750);
		
		
	});

	function cargaDatosGenerales(){
		$.post('/index.cfm/cuestionarios/cuestionarios/datosGenerales',{
			id: <cfoutput>#prc.cuestionarios.id#</cfoutput>
		},function(data){
			$('.datosGeneralesB').html(data);
		});
	}

	function cargaPreguntasFormulario(clase,salida){
		$.post('/index.cfm/cuestionarios/cuestionarios/obtenerPreguntaClase',{
			id: <cfoutput>#prc.cuestionarios.id#</cfoutput>,
			clase: clase
		},function(data){
			$(salida).html(data);
		});
	}
</script>
               