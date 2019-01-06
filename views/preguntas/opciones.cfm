<cfprocessingdirective pageEncoding="utf-8">
<!--- <cfdump var="#prc#"> --->
<div class="row">
    <div class="col-sm-12 b-r">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
        <h3 class="m-t-none m-b">Configuración: Pregunta de opción multiple</h3>
         <div class="alert alert-info">
            Seleccione una opción de pregunta
        </div>    
        <button onclick="nuevaPregunta();" class=" btn btn-success" type="button"><strong><i class="fa fa-plus"></i> 
            Agregar opción
         </strong>
        </button>
       
        <p></p>
        <cfoutput>
        <div class="row">
            <div class="col-6">
                <table class="table table-stripped  m-t-md">
                    <tbody>
                        <cfoutput>
                            <cfloop from="1" to="#prc.resultado.config.recordcount#" index="i">
                                <tr onclick="obtenerDatosOpcion('#prc.resultado.config.id_opcion[i]#');" style="cursor: pointer;" >
                                    <td class="no-borders">
                                        <!--- <i class="fa fa-circle text-navy"></i> --->
                                        <span class="fa-stack"><span class="fa fa-circle-o fa-stack-2x text-navy"></span><strong class="fa-stack-1x text-navy">#i#</strong></span>
                                    </td>
                                    <td class="no-borders">
                                        <h4>#prc.resultado.config.descripcion[i]#</h4>
                                    </td>
                                </tr>
                            </cfloop>
                        </cfoutput>
                    </tbody>
                </table>
            </div>
            <div class="col-6" id="opcionDatos"> 
            </div>
        </div>
        <div class="row">
            <div class="col-12" id="agregarOpcion" style="display: none;">
                
            </div>
        </div>
      
        </cfoutput>
    </div>
</div>
<script type="text/javascript">
    function obtenerDatosOpcion(opcion){
        //console.log(opcion);
        $.post('/index.cfm/cuestionarios/cuestionarios/opcionDatos',{
            id: opcion,
            pregunta : <cfoutput>#prc.pregunta#</cfoutput>
        },function(data){
            $('#opcionDatos').html(data);
        });
    }
    function nuevaPregunta(){
        $.post('/index.cfm/cuestionarios/cuestionarios/nuevaOpcion',{
            pregunta : <cfoutput>#prc.pregunta#</cfoutput>
        },function(data){
            $('#agregarOpcion').html(data);
            $('#agregarOpcion').show('slice');
        });
    }
</script>