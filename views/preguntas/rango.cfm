<cfprocessingdirective pageEncoding="utf-8">
<cfset a = prc.resultado.resultado.rango>
<cfset v = a.Split(',')>
<div class="row">
    <div class="col-sm-12 b-r">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
        <h3 class="m-t-none m-b">Configuración: Pregunta de rango</h3>
        <!--- <div class="alert alert-info">
            Edite los campos que desee
        </div>     --->
        <p></p>
        <cfoutput>
        <form role="form" onsubmit="return actualizarRango();" method="post">
            <div  class="form-group"><label>Limite inferior</label> <input onkeyup="validarLimite();" name="quantity" min="1" max="1000" id="limiteF" type="number" placeholder="Limite inferior" value="<cfoutput>#v[1]#</cfoutput>" class="form-control" required=""></div>
            <div class="form-group"><label>Limite superior</label> <input name="quantity" min="<cfoutput>#LSParseNumber(v[1]) + 1#</cfoutput>" max="1000" id="limiteS" type="number" placeholder="Limite superior" value="<cfoutput>#v[2]#</cfoutput>" class="form-control" required=""></div>
            <div>
                <button type="button" style="margin-left: 10px;" class="btn  btn-default float-right m-t-n-xs" data-dismiss="modal"><span aria-hidden="true"> Cancelar</span><span class="sr-only">Close</span></button> 
                <button class="btn  btn-primary float-right m-t-n-xs" type="submit"><strong>Enviar</strong></button>
                <!--- <label> <input type="checkbox" class="i-checks"> Remember me </label> --->
            </div>
        </form>
        <!--- Esto muestra el rango --->
        </cfoutput>
    </div>
</div>

<script type="text/javascript">
    function validarLimite(){ 
        $('#limiteS').attr('min',Number($('#limiteF').val()) +1);
    }
    function actualizarRango(){
        rango = $('#limiteF').val().trim()+','+$('#limiteS').val();
       // console.log(rango);

        $.post('/index.cfm/cuestionarios/cuestionarios/actualizarRango',{
            id: <cfoutput>#prc.resultado.resultado.id_pregunta#</cfoutput>,
            rango : rango
        },function(data){
            $('#modal-cuestionario').modal('toggle');
            swal({
                    title: "Exito",
                    text: "El rango de las respuestas ha sido modificado.",
                    type: "success"
                        });
        });
        return false;
    }
</script>