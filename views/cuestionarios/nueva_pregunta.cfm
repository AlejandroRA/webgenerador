<!----
* =========================================================================
* IPN - ESCOM
* Trabajo Terminal
* Modulo: Principal
* Sub modulo: Layout principal
* Fecha: Agosto 18, 2018
* Descripcion: Modulo de cuestionarios
* Autor: Lucia Ramirez
* =========================================================================
---->

<cfprocessingdirective pageEncoding="utf-8">
<div class="row">
    <div class="col-sm-12 b-r">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
        <h3 class="m-t-none m-b">
        	<cfif prc.clase eq 1>
        		Nuevo pregunta de formulario
        	<cfelse>
        		Nuevo pregunta de cuestionario
        	</cfif>
        	
    	</h3>

        <div class="alert alert-info">
            Acomplete los campos para registrar una nueva pregunta.
        </div>    
        <p></p>
        <form role="form" onsubmit="return agregarPregunta();" method="post">
            <div class="form-group"><label>Descripción</label> <input id="descripcion_pr" type="text" placeholder="Descripción" class="form-control" required=""></div>
            <div class="form-group"><label>Tipo de pregunta</label> 

				<select data-placeholder="Tipo de pregunta" class="chosen-select" id="tipo-sel" required="" tabindex="2">
                	<!--- <option value="">Selecciona un tipo de pregunta</option> --->
                	<cfloop from="1" to="#prc.tipos.recordcount#" index="i">
                		<cfoutput>
                			<option value="#prc.tipos.id_tipo[i]#">#prc.tipos.descripcion[i]#</option>
                		</cfoutput>
                	</cfloop>
                </select>

            </div>


            <div class="form-group"><label>Pregunta obligatoria</label> 

				<select data-placeholder="Pregunta obligatoria" class="chosen-select" id="obligado-sel" required="" tabindex="2">
                	<!--- <option value="">Selecciona un tipo de pregunta</option> --->
                	<option value="0">No</option>
                	
                	<option value="1">Sí</option>

                	
                </select>

            </div>

            <div class="form-group"><label>Orden de la pregunta</label> <input name="quantity" min="1" max="100" id="orden_pr" type="number" placeholder="Orden de la pregunta" class="form-control" required=""></div>

            <!--- <div class="form-group" id="data_1">
                <label class="font-normal">Fecha de termino</label>
                <div class="input-group date">
                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input required="" id="fecha_c" type="text" class="form-control">
                </div>
            </div> --->

            <div>
                <button class="btn  btn-primary float-right m-t-n-xs" type="submit"><strong>Enviar</strong></button>
                <!--- <label> <input type="checkbox" class="i-checks"> Remember me </label> --->
            </div>
        </form>
    </div>
</div>
<script src="/includes/js/plugins/chosen/chosen.jquery.js"></script>
 <link href="/includes/css/plugins/chosen/bootstrap-chosen.css" rel="stylesheet">
<link href="/includes/css/plugins/datapicker/datepicker3.css" rel="stylesheet">
<script src="/includes/js/plugins/datapicker/bootstrap-datepicker.js"></script>
<script type="text/javascript">
    function agregarPregunta(){
        var tipo  = $('#tipo-sel').val();

        var descripcion = $('#descripcion_pr').val();
        var clase = <cfoutput>#prc.clase#</cfoutput>;
        var cuestionario = <cfoutput>#prc.id#</cfoutput>;
        var obligado = $('#obligado-sel').val();
        var orden = $('#orden_pr').val();
        
        //return false;
        $.post('/index.cfm/cuestionarios/cuestionarios/agregarPregunta',{
        	cuestionario : cuestionario,
            descripcion: descripcion,
            tipo : tipo,
            clase : clase,
            obligado : obligado,
            orden : orden
        },function(data){
            //console.log(data);
            swal({
                            title: "Exito",
                            text: "La pregunta ha sido agregada con exito.",
                            type: "success"
                        });

            //cargaCuestionarios();
            <cfif prc.clase eq 1>
            	cargaPreguntasFormulario(1,'.preguntasFormulario');
            <cfelse>
				cargaPreguntasFormulario(2,'.preguntasCuestionario');
            </cfif>
            $('#modal-cuestionario').modal('toggle');
        });
       // DateFormat(fecha, "dd/mm/yyyy")
        
      //  $('#modal-cuestionario').modal('toggle');
        return false;
    }



    $(document).ready(function(){
        var mem = $('#data_1 .input-group.date').datepicker({
                language: "es",
                format: "dd/mm/yyyy",
                todayHighlight: true,
                todayBtn: "linked",
                startDate: "today",
                keyboardNavigation: false,
                forceParse: false,
                
                autoclose: true
        });

        $('.chosen-select').chosen({width: "100%"});
        


    });
     
</script>