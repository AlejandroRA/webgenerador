<cfprocessingdirective pageEncoding="utf-8">
<div class="row">
    <div class="col-sm-12 b-r">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
        <h3 class="m-t-none m-b">Edición de datos generales</h3>
        <div class="alert alert-info">
            Edite los campos que desee
        </div>    
        <p></p>
        <cfoutput>
        <form role="form" onsubmit="return edicionCuestionario();" method="post">
            <div class="form-group"><label>Nombre</label> <input value="#prc.cuestionarios.nombre#"  id="nombre_c" type="text" placeholder="Nombre" class="form-control" required=""></div>
            <div class="form-group"><label>Descripción</label> <input value="#prc.cuestionarios.descripcion#" id="descripcion_c" type="text" placeholder="Descripción" class="form-control" required=""></div>
            <div class="form-group"><label>Clave de acceso</label> <input value="#prc.cuestionarios.contrasena#" id="clave_c" type="text" placeholder="Clave de acceso" class="form-control" required=""></div>
            <div class="form-group" id="data_1">
                <label class="font-normal">Fecha de termino</label>
                <div class="input-group date">
                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input disabled="true" value="#DateFormat(prc.cuestionarios.fecha_fin, "dd/mm/yyyy")#" required="" id="fecha_c" type="text" class="form-control">
                </div>
            </div>

            <div>
                <button class="btn  btn-primary float-right m-t-n-xs" type="submit"><strong>Enviar</strong></button>
                <!--- <label> <input type="checkbox" class="i-checks"> Remember me </label> --->
            </div>
        </form>
        </cfoutput>
    </div>
</div>

<div id="test"></div>
<link href="/includes/css/plugins/datapicker/datepicker3.css" rel="stylesheet">
<script src="/includes/js/plugins/datapicker/bootstrap-datepicker.js"></script>
<script type="text/javascript">
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
        


    });

    function edicionCuestionario(){
        var id = <cfoutput>#prc.cuestionarios.id#</cfoutput>;
        var nombre = $('#nombre_c').val();
        var descripcion = $('#descripcion_c').val();
        var fecha_fin = $('#fecha_c').val();
        var clave = $('#clave_c').val();

       

        $.post('/index.cfm/cuestionarios/cuestionarios/editarDatosGenerales',{
            id: id,
            nombre: nombre,
            descripcion : descripcion,
            fecha : fecha_fin,
            clave : clave
        },function(data){
            $('#test').html(data);
            //console.log(data);
            swal({
                            title: "Exito",
                            text: "El cuestionario ha sido modificado.",
                            type: "success"
                        });
            <cfif prc.estado eq 1 >
            //cargaCuestionarios();
            cargaCatalogoCuestionarios();

            <cfelse>
            cargaDatosGenerales();
            cargaCatalogoCuestionarios();
            </cfif>
            //cargaDatosGenerales();
            //cargaCuestionarios();

            $('#modal-cuestionario').modal('toggle');
        });
        return false;
    } 
</script>