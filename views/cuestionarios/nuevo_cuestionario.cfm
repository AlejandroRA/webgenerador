
<cfprocessingdirective pageEncoding="utf-8">
<div class="row">
    <div class="col-sm-12 b-r">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
        <h3 class="m-t-none m-b">Nuevo cuestionario</h3>
        <div class="alert alert-info">
            Acomplete los campos para registrar un nuevo cuestionario.
        </div>    
        <p></p>
        <form role="form" onsubmit="return agregarCuestionario();" method="post">
            <div class="form-group"><label>Nombre</label> <input id="nombre_c" type="text" placeholder="Nombre" class="form-control" required=""></div>
            <div class="form-group"><label>Descripción</label> <input id="descripcion_c" type="text" placeholder="Descripción" class="form-control" required=""></div>
            <div class="form-group"><label>Clave de acceso</label> <input id="clave_c" type="text" placeholder="Clave de acceso" class="form-control" required=""></div>
            <div class="form-group" id="data_1">
                <label class="font-normal">Fecha de termino</label>
                <div class="input-group date">
                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input disabled="true"  required="" id="fecha_c" type="text" class="form-control">
                </div>
            </div>

            <div>
                <button class="btn  btn-primary float-right m-t-n-xs" type="submit"><strong>Enviar</strong></button>
                <!--- <label> <input type="checkbox" class="i-checks"> Remember me </label> --->
            </div>
        </form>
    </div>
</div>

<link href="/includes/css/plugins/datapicker/datepicker3.css" rel="stylesheet">
<script src="/includes/js/plugins/datapicker/bootstrap-datepicker.js"></script>
<script type="text/javascript">
    function agregarCuestionario(){
        var nombre = $('#nombre_c').val();
        var descripcion = $('#descripcion_c').val();
        var fecha_fin = $('#fecha_c').val();
        var clave = $('#clave_c').val();
        
        $.post('/index.cfm/cuestionarios/cuestionarios/registrarCuestionario',{
            nombre: nombre,
            descripcion : descripcion,
            fecha : fecha_fin,
            clave : clave
        },function(data){
            //console.log(data);
            swal({
                            title: "Exito",
                            text: "El cuestionario ha sido registrado.",
                            type: "success"
                        });

            //cargaCuestionarios();
            cargaCatalogoCuestionarios();
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
        


    });
     
</script>