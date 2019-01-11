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
<div class="wrapper wrapper-content">
	<div class="row">
		<div class="col-12 container">
            <div class="contenido-ini">
			<div class="ibox ">
    			<div class="ibox-title">
            		<i class="fa fa-list-alt" aria-hidden="true"></i> <h5>Cuestionarios</h5> <!--- <span class="label label-primary">IN+</span> --->
        		</div>
    			<div class="ibox-content">    
                    <button onclick="nuevoCuestionario();" class=" btn btn-default dim btn-dim   btn-outline" type="button"><i class="fa fa-plus-square-o"></i> Nuevo cuestionario</button>
                    <div id="tabla-cuestionarios">
    				</div>

    		  	</div>
    		</div>
            </div>
            <div class="contenido-conf">
            </div>
            <div class="contenido-ver">
            </div>
    	</div>
    </div>                 
</div>
<!-------- Modal para nuevos cuestionarios ------------------------->
<div id="modal-cuestionario" class="modal fade" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <div id="formulario">
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/includes/js/jquery-3.1.1.min.js"></script> 
<link href="/includes/css/plugins/datapicker/datepicker3.css" rel="stylesheet">
<script src="/includes/js/plugins/datapicker/bootstrap-datepicker.js"></script>
<link rel="stylesheet" type="text/css" href="/includes/css/plugins/bootstrap-table/bootstrap-table.min.css">
<script src="/includes/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="/includes/js/plugins/bootstrap-table/locale/bootstrap-table-es-MX.js"></script>
<script type="text/javascript">
	 $(document).ready(function(){
	 	cargaCuestionarios();
        $('.contenido-conf').hide();
        $('.contenido-ver').hide();
        
	 });

     function cargaCuestionarios(){

        $.post('/index.cfm/cuestionarios/cuestionarios/consultarCuestionario',{}, function(data){

            $('#tabla-cuestionarios').html(data);

        });

     }
    function nuevoCuestionario(){
        $.post('/index.cfm/cuestionarios/cuestionarios/nuevoCuestionario',{}, function(data){
            $('#formulario').html(data);
            $('#modal-cuestionario').modal('toggle');
        });
        
    }

    function cerrarConfiguracion(){
        
        
        $('.contenido-ini').show('slice');
        $('.contenido-conf').hide('slice');

    }
    function cerrarConfiguracion2(){
        $('.contenido-ini').show('slice');
        $('.contenido-ver').hide('slice');
    }

    
</script>