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

<!--- <cfdump var="#prc.cuestionarios#"> --->
<script src="/includes/js/plugins/bootstrap-table/locale/bootstrap-table-es-MX.js"></script>
<table id="table" data-pagination='true' data-page-size='10' data-search='true'>
	<thead>
		<tr>
			<th data-field='id'>id</th>
			<th data-field='nombre'>Nombre</th>
			<th data-field='descripcion'>Descripción</th>
			<th data-field='fechacreacion'>Fecha de creación</th>
			<th data-field='fechatermino'>Fecha de termino</th>
			<th data-field='acciones' data-formatter="acciones_cuestionarios">Acciones</th>
		</tr>
	</thead>
</table>

<script type="text/javascript">
	var data = [];
	<cfloop from="1" to="#prc.cuestionarios.recordcount#" index="i">
			<cfoutput>
					console.log("#prc.cuestionarios.id[i]#");
					data.push({
							id: #prc.cuestionarios.id[i]#,
							nombre: '#prc.cuestionarios.nombre[i]#',
							descripcion: '#prc.cuestionarios.descripcion[i]#',
							fechacreacion: '#prc.cuestionarios.fecha_creacion[i]#',
							<cfif len(prc.cuestionarios.fecha_fin[i]) eq 0 >
								fechatermino: 'S/A'
							<cfelse>
								fechatermino: '#prc.cuestionarios.fecha_fin[i]#'
							</cfif>
					});
					
			</cfoutput>
	</cfloop>
	
	$(document).ready(function(){
		$('#table').bootstrapTable();
		$('#table').bootstrapTable('hideColumn','id');
		$('#table').bootstrapTable('load', data);
	});

	function lanzarNuevoCuestionario(){

	}

	function acciones_cuestionarios(index, row){
		var close = '<button onclick="eliminarCuestionario('+row.id+');" class="btn btn-danger btn-circle" type="button"><i class="fa fa-times"></i></button> ';
		var details = '<button class="btn btn-success  btn-circle" id="details'+row.id+'" id_c="'+row.id+ '" nombre_c="'+row.nombre+ '" descripcion_c="'+row.descripcion+ '" onclick="mostrarDetalles('+row.id+');" type="button"><i class="fa fa-list-ol"></i></button> ';
		var view  = '<button class="btn btn-default btn-circle" type="button"><i class="fa fa-eye"></i></button> ';
		var link = '<button class="btn btn-primary btn-circle" type="button"><i class="fa fa-link"></i></button> ';
		var edit = '<button onclick="editarDatosGeneralesCuestionario('+row.id+');" class="btn btn-warning btn-circle" type="button"><i class="fa fa-edit"></i></button> ';
		
		var total = view +  link + details + edit + close;
		return total;
		//return row.nombre;

	}

	function eliminarCuestionario(id){
            swal({
                    title: "Aviso",
                    text: "¿Desea eliminar el cuestionario?",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    cancelButtonText: "Cancelar",
                    confirmButtonText: "Eliminar Cuestionario"
                    //closeOnConfirm: false
                }, function () {
                    $.post('/index.cfm/cuestionarios/cuestionarios/eliminarCuestionario',{
                    	id: id
                    },function(data){
                      //location.reload(); 
                      cargaCuestionarios(); 
                    });
                    
                });
        }

	function editarDatosGeneralesCuestionario(id){
		$.post('/index.cfm/cuestionarios/cuestionarios/edicionDatosGenerales',{
			id: id,
			estado : 1
		},
			function(data){
				$('#formulario').html(data);
				$('#modal-cuestionario').modal('toggle');
			});

	}

	function mostrarDetalles(id){
		$('.contenido-ini').hide('slice');
		// var nom = $('#details'+elemento).attr('nombre_c');
		// var desc = $('#details'+elemento).attr('descripcion_c');
		// var det = '<i onclick="cerrarConfiguracion();" style="float: right; cursor: pointer;" class="fa fa-times fa-3" aria-hidden="true"></i>';
		// $('.titulo-panel').html(nom +' - '+ desc+ det);
        $.post('/index.cfm/cuestionarios/cuestionarios/configuracionCuestionario',{
        	id : id
        },function(data){
        	$('.contenido-conf').html(data);
        });
		$('.contenido-conf').show('slice');
		//console.log(id);
	}
	
</script>
<!--- <script src="/includes/js/jquery-3.1.1.min.js"></script> --->