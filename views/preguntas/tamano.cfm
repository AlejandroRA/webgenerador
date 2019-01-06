<cfprocessingdirective pageEncoding="utf-8">
<!--- <cfdump var="#prc#"> --->
<div class="row">
    <div class="col-sm-12 b-r">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
        <h3 class="m-t-none m-b">Configuración: Pregunta abierta</h3>
        <!--- <div class="alert alert-info">
            Edite los campos que desee
        </div>  --->   
        <p></p>
        <cfoutput>
        <form role="form" onsubmit="return editarTamano();" method="post">
            <div class="form-group"><label>Longitud de las respuestas</label> <input name="quantity" min="1" max="1000" id="tamanoAc" type="number" placeholder="Longitud de las respuestas" value="<cfoutput>#prc.resultado.resultado.tamano#</cfoutput>" class="form-control" required=""></div>

            <div>
                <button type="button" style="margin-left: 10px;" class="btn  btn-default float-right m-t-n-xs" data-dismiss="modal"><span aria-hidden="true"> Cancelar</span><span class="sr-only">Close</span></button> 
                <button class="btn  btn-primary float-right m-t-n-xs" type="submit"><strong>Enviar</strong></button>
                <!--- <label> <input type="checkbox" class="i-checks"> Remember me </label> --->
            </div>
        </form>
        
        </cfoutput>
    </div>
</div>
<script type="text/javascript">
    function editarTamano(){
        tamano = $('#tamanoAc').val();
        $.post('/index.cfm/cuestionarios/cuestionarios/actualizarTamano',{
            id: <cfoutput>#prc.resultado.resultado.id_pregunta#</cfoutput>,
            tamano : tamano
        },function(data){
            $('#modal-cuestionario').modal('toggle');
            swal({
                    title: "Exito",
                    text: "La longitud de las respuestas ha sido actualizado.",
                    type: "success"
                        });
        });

        return false;
    }
</script>