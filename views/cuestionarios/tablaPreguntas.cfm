 <!----
* =========================================================================
* IPN - ESCOM
* Trabajo Terminal
* Modulo: Principal
* Sub modulo: Layout principal
* Fecha: Agosto 18, 2018
* Descripcion: Modulo de preguntas en general
* Autor: Lucia Ramirez
* =========================================================================
---->
<cfprocessingdirective pageEncoding="utf-8">
<!---  <cfdump var="#prc#"> --->

 <button id="nuevoP<cfoutput>#prc.clase#</cfoutput>" onclick="nuevaPregunta(<cfoutput>#prc.clase#</cfoutput>);" class=" btn btn-success dim btn-dim   btn-outline" type="button"><i class="fa fa-plus-square-o"></i> 
<cfif prc.clase eq 1>
	Nuevo pregunta de formulario
<cfelse>
	Nuevo pregunta de cuestionario
</cfif>
</button>

 <table clase="<cfoutput>#prc.clase#</cfoutput>" id="<cfoutput>#prc.nombretabla#</cfoutput>" data-pagination='true' data-page-size='10' data-search='true'>
	<thead>
		<tr>
			<th data-field='id'>id</th>
			<th data-field='clase'>clase</th>
			<th data-field='descripcion'>Descripción</th>
			<th data-field='tipo'>Tipo</th>
			<th data-field='tipo_p'>tipo_p</th>
			<th data-field='obligada' >Obligatoria</th>
			<th data-field='datoobligada' data-formatter="obliga">Obligada</th>
			<th data-field='orden'>Orden</th>
			<th data-field='ordenformato' data-formatter="ordena">Orden</th>
			<!--- th data-field='caracteristicas' data-formatter="caracteristicas" >Características</th> --->
			<th data-field='acciones' data-formatter="acciones_preguntas">Acciones</th>
		</tr>
	</thead>
</table>
<link rel="stylesheet" type="text/css" href="/includes/css/plugins/bootstrap-table/bootstrap-table.min.css">
<script src="/includes/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="/includes/js/plugins/bootstrap-table/locale/bootstrap-table-es-MX.js"></script>
<script type="text/javascript">
	var data = [];

	<cfloop index="i" from="1" to="#prc.preguntas.recordcount#">
		<cfoutput>
			data.push({
				id : #prc.preguntas.id_pregunta[i]#,
				clase : #prc.clase#,
				descripcion : '#prc.preguntas.descripcion[i]#',
				tipo : '<center>#prc.preguntas.tipo[i]#</center>',
				tipo_p : #prc.preguntas.tipo_p[i]#,
				obligada : #prc.preguntas.obligado[i]#,
				orden : #prc.preguntas.orden[i]#,
			});
		</cfoutput>
	</cfloop>
	$(document).ready(function(){
		$('#<cfoutput>#prc.nombretabla#</cfoutput>').bootstrapTable();
		$('#<cfoutput>#prc.nombretabla#</cfoutput>').bootstrapTable('hideColumn','id');
		$('#<cfoutput>#prc.nombretabla#</cfoutput>').bootstrapTable('hideColumn','clase');
		
		$('#<cfoutput>#prc.nombretabla#</cfoutput>').bootstrapTable('hideColumn','obligada');
		$('#<cfoutput>#prc.nombretabla#</cfoutput>').bootstrapTable('hideColumn','orden');
		$('#<cfoutput>#prc.nombretabla#</cfoutput>').bootstrapTable('hideColumn','tipo_p');
		$('#<cfoutput>#prc.nombretabla#</cfoutput>').bootstrapTable('load',data);

		//$('#table').bootstrapTable('hideColumn','id');
		//$('#table').bootstrapTable('load', data);
	});

	function obliga(index, row){
		if(row.obligada == 1)
			return '<center><button type="button" disabled class="btn btn-outline btn-info"><i class="fa fa-check" aria-hidden="true"></i></button><center>';
		else
			return '<center><button type="button" disabled class="btn btn-outline btn-danger"><i class="fa fa-times" aria-hidden="true"></i></button></center>';

	}

	function ordena(index, row){
		return '<center><span class="fa-stack"><span class="fa fa-circle-o fa-stack-2x"></span><strong class="fa-stack-1x">'+row.orden+'</strong></span></center>';
	}

	function caracteristicas(index, row){
		return '<center><button class="btn btn-primary  " type="button"><i class="fa fa-list" aria-hidden="true"></i></button></center>';
	}

	function acciones_preguntas(index, row){
		var close = '<button onclick="eliminarPregunta('+row.id+','+row.clase+');" class="btn btn-danger btn-circle" type="button"><i class="fa fa-times"></i></button> ';
		var caracteristicas = '<button onclick="cargarConfiguraciones('+row.id+','+row.clase+');" class="btn btn-primary btn-circle" type="button"><i class="fa fa-list"></i></button> ';
		var edit = '<button onclick="editarDatosPregunta('+row.id+');" class="btn btn-warning btn-circle" type="button"><i class="fa fa-edit"></i></button> ';
		return caracteristicas + edit + close;
	}

	function nuevaPregunta(a){
		
		
        $.post('/index.cfm/cuestionarios/cuestionarios/nuevaPregunta',{
        	clase: a,
        	id : <cfoutput>#prc.id#</cfoutput>
        }, function(data){
            $('#formulario').html(data);
            $('#modal-cuestionario').modal('toggle');
        });
        
    }

    function eliminarPregunta(id, clase){
            swal({
                    title: "Aviso",
                    text: "¿Desea eliminar la pregunta?",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    cancelButtonText: "Cancelar",
                    confirmButtonText: "Eliminar Pregunta"
                    //closeOnConfirm: false
                }, function () {
                    $.post('/index.cfm/cuestionarios/cuestionarios/eliminarPregunta',{
                    	pregunta: id,
                    	cuestionario: <cfoutput>#prc.id#</cfoutput>

                    },function(data){
                    	if(clase == 1){
                    		cargaPreguntasFormulario(1,'.preguntasFormulario');
                    	}else{
                    		cargaPreguntasFormulario(2,'.preguntasCuestionario');
                    	}

                    });
                    
                });
        }

    function cargarConfiguraciones(id){
        $.post('/index.cfm/cuestionarios/cuestionarios/obtenerConfiguracionPregunta',{
        	pregunta:id
        }, function(data){
            $('#formulario').html(data);
            $('#modal-cuestionario').modal('toggle');
        });
    }

    function refrescaConfiguracion(id){
        $.post('/index.cfm/cuestionarios/cuestionarios/obtenerConfiguracionPregunta',{
        	pregunta:id
        }, function(data){
            $('#formulario').html(data);
            //$('#modal-cuestionario').modal('toggle');
        });
    }

    function editarDatosPregunta(id){
    	console.log('datos');
    }
</script>