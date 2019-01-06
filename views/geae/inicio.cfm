<style type="text/css">
	.responsive {
    	max-width: 100%;
    	height: auto;
	}
	.scroll{
		height: scroll;
		width: scroll;
	}
</style>
<cfprocessingdirective pageEncoding="utf-8"> 
<div class="wrapper wrapper-content">
	<div class="row">
		<div class="col-lg-12">
   			<div class="ibox float-e-margins">                                
                <div class="ibox-content">
                    <center><h1>¡Bienvenido <cfoutput>#session.cbstorage.usuario.nombre#!</cfoutput></h1></center>
                    <cfoutput>#getInstance( "MessageBox@cbmessagebox" ).renderIt()#</cfoutput>
                    <div class="row">
                    	<div class="col-lg-6">
                    		<h2>Sistema prototipo web generador de cuestionarios dinámicos para análisis estadístico</h2>
                    		<p>Aplicación web para la generación de cuestionarios dinámicos online a partir de las necesidades del usuario. </p>
                    		<p>Las caracterisricas principales del sistema son:</p>
                    		<!--- Lista de caracteristicas --->
                    		<ul>
                    			<li>Cuestionarios ilimitados.</li>
                    			<li>Preguntas ilimitadas.</li>
                    			<li>Respuestas ilimitadas</li>
                    			<li>Manejo de apaertura y cierre de cuestionarios</li>
                    			<li>Analisis estadistico de la informacion obtenida por el cuetionario.</li>
                    			<li>Exportación de graficas.</li>
                    		</ul>	
                    		<br>
                    		<a class="btn btn-default dim" href="/index.cfm/cuestionarios/cuestionarios" scroll><i class="fa fa-plus-square " aria-hidden="true"></i> Generar un nuevo cuestionario</a>
                    	</div>
                    	<div class="col-lg-6">
                    		<center><img class="responsive"  src="/includes/img/inicio/fondo_inicio.png" ></center>
                    	</div>
                    </div>

                </div>
            </div>
        </div>
	</div>
</div>

