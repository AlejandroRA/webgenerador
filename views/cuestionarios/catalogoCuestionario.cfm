<!----
* =========================================================================
* IPN - ESCOM
* Trabajo Terminal
* Modulo: Principal
* Sub modulo: Layout principal
* Fecha: Agosto 18, 2018
* Descripcion: Catalogo de cuestionarios
* Autor: Lucia Ramirez
* =========================================================================
---->
<cfprocessingdirective pageEncoding="utf-8">
<style type="text/css">
    .responsive {
        max-width: 50%;
        height: auto;
    }
    .esq{
        position: fixed;
        width: 35px;
        height: 35px;
       
    }
    .floatContainer{
        float: right;
        margin-right: 35px;
    }
</style>
<cfset baseCuestionario='http#iif(CGI.SERVER_PORT_SECURE,"s","")#://#CGI.SERVER_NAME#:#cgi.SERVER_PORT#/index.cfm/cuestionarios/cuestionarios/responderCuestionario?id='>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <cfoutput>
        <cfloop to="#prc.cuestionarios.recordcount#" from="1" index="i">
        <div class="col-md-3">
            <div class="ibox">
                <div class="ibox-content product-box" >
                    <div class="floatContainer">
                        <button onclick="eliminarCuestionario('#prc.cuestionarios.id[i]#');" class="esq  btn btn-xs btn-danger"><i class="fa fa-times fa-3" aria-hidden="true"></i></button>
                    </div>
                    <!--- <div class="product-imitation">
                       <img class="responsive" src="/includes/img/cuestionarios/cuestionarioU.png">
                    </div> --->
                    <center>
                        <img align="center" class="responsive" src="/includes/img/cuestionarios/cuestionarioU.png">        
                    </center>
                    <div class="product-desc">
                        <!--- <span class="product-price">
                            $10
                        </span> --->
                        <!--- <small class="text-muted">Category</small> --->

                        <div onclick="verCuestionario('#prc.cuestionarios.id[i]#');">
                            
                                <a href="##" style="word-wrap: break-word;" class="product-name">#prc.cuestionarios.nombre[i]#</a>
                                <div style="cursor: pointer;word-wrap: break-word;" class="small m-t-xs">
                                    #prc.cuestionarios.descripcion[i]#
                                </div>
                            
                        </div>

                        <div class="m-t text-righ">

                            <p>
                                <!--- <a href="##" class="btn btn-xs btn-default">Ver <i class="fa fa-long-arrow-right"></i> </a> --->
                                <button onclick="enlaceCuestionario('#prc.cuestionarios.id[i]#');" class="btn btn-xs btn-primary">Enlace <i class="fa fa-link"></i> </button>
                                <button onclick="mostrarDetalles('#prc.cuestionarios.id[i]#')" class="btn btn-xs btn-success">Detalles <i class="fa fa-list-ol"></i> </button>
                                <button onclick="editarDatosGeneralesCuestionario('#prc.cuestionarios.id[i]#')" class="btn btn-xs btn-warning">Editar <i class="fa fa-edit"></i> </button>
                                <button onclick="analisisCuestionario('#prc.cuestionarios.id[i]#')" class="btn btn-xs btn-default">Análisis <i class="    fa fa-line-chart"></i> </button>
                            </p>
                            <p>
                                
                                <!--- <a href="##" class="btn btn-xs btn-warning">Editar <i class="fa fa-long-arrow-right"></i> </a> --->
                                <!--- <a href="##" class="btn btn-xs btn-danger">Eliminar <i class="fa fa-long-arrow-right"></i> </a>  --->
                            </p>
                            
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>  
        </cfloop> 
        </cfoutput>         
    </div>
</div>
<script type="text/javascript">
    function analisisCuestionario(id){
        $('.contenido-ini').hide('slice');
        $.post('/index.cfm/cuestionarios/cuestionarios/analisisCuestionario',{
            id : id
        },function(data){
            $('.contenido-conf').html(data);
        });
        $('.contenido-conf').show('slice');
        $('.contenido-ini').hide('slice');
        $('.contenido-ver').hide('slice');
        
        
    }

    function enlaceCuestionario(id){
            swal({
                    title: "Enlace a cuestionario",
                    text: '<cfoutput>#baseCuestionario#</cfoutput>'+id,
                    type: "info",
                   // showCancelButton: true,
                  //  confirmButtonColor: "#DD6B55",
                   // cancelButtonText: "Cancelar",
                    confirmButtonText: "Aceptar"
                    //closeOnConfirm: false
                });
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
                      cargaCatalogoCuestionarios(); 
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
        $.post('/index.cfm/cuestionarios/cuestionarios/configuracionCuestionario',{
            id : id
        },function(data){
            $('.contenido-conf').html(data);
        });
        $('.contenido-conf').show('slice');
        $('.contenido-ini').hide('slice');
        $('.contenido-ver').hide('slice');
        
        
    }

 
   function verCuestionario(id){
        $('.contenido-ini').hide('slice');
        $.post('/index.cfm/cuestionarios/cuestionarios/verCuestionario',{
            id : id
        },function(data){
            $('.contenido-ver').html(data);
        });
        $('.contenido-ver').show('slice');
      //  $('.contenido-ini').hide('slice');
       // $('.contenido-conf').hide('slice');
        
    }

</script>