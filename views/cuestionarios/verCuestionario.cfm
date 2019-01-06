<!--- <link href="/includes/css/plugins/ionRangeSlider/ion.rangeSlider.css" rel="stylesheet">
<link href="/includes/css/plugins/ionRangeSlider/ion.rangeSlider.skinFlat.css" rel="stylesheet">  --->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ion-rangeslider/2.3.0/css/ion.rangeSlider.min.css"/>
<link href="/includes/css/plugins/iCheck/custom.css" rel="stylesheet">
<cfoutput>
	<!--- <cfdump var="#prc#"> --->

<div class="panel panel-success">
    <div class="panel-heading titulo-panel">
        <!--- <cfoutput>#prc.cuestionarios.nombre# - #prc.cuestionarios.descripcion#</cfoutput> --->
        <h3>Vista previa
        <i onclick="cerrarConfiguracion();" style="float: right; cursor: pointer;" class="fa fa-times fa-3" aria-hidden="true"></i> </h3>    
    </div>
    <div class="panel-body">      
        <div class="tabs-container">
            <ul class="nav nav-tabs" role="tablist">
                <li><a class="nav-link active" data-toggle="tab" href="##tab-1"> Formulario</a></li>
                <li><a class="nav-link" data-toggle="tab" href="##tab-2">Cuestionario</a></li>                
            </ul>
            <div class="tab-content">
                <div role="tabpanel" id="tab-1" class="tab-pane active">
                    <div class="panel-body vistaFormulario">
                    	<cfloop from="1" to="#prc.cuestionarios.formulario.RECORDCOUNT#" index="i">
                    		<p>
                    			<form method="get">
                    				<div class="form-group row">
                    					<label class="col-sm-2 col-form-label">#i#)  #prc.cuestionarios.formulario.DESCRIPCION[i]#</label>
                                    	<div class="col-sm-10">

                                    		<cfif prc.cuestionarios.formulario.TIPO[i] eq 1>
                                    			<input disabled="true" type="text" class="form-control"> <span class="form-text m-b-none">0 de #prc.cuestionarios.formulario.TAMANO[i]# caracteres</span>
                    						</cfif>

                                    		<cfif prc.cuestionarios.formulario.TIPO[i] eq 2>
                                    			<!--- <input disabled="true" type="text" class="form-control"> <span class="form-text m-b-none">0 de #prc.cuestionarios.formulario.TAMANO[i]# caracteres</span> --->
                                    			
                                        		<div class="i-checks">
                                        			<label> 
                                        				<input type="radio" value="option1" name="a"> <i></i> Option one 
                                        			</label>
                                        		</div>
                                        		<div class="i-checks">
                                        			<label> 
                                        				<input type="radio" checked="" value="option2" name="a"> <i></i> Option two checked 
                                        			</label>
                                        		</div>
                                        		<div class="i-checks">
                                        			<label> 
                                        				<input type="radio" disabled="" checked="" value="option2"> <i></i> Option three checked and disabled 
                                        			</label>
                                        		</div>
                                        		<div class="i-checks">
                                        			<label> 
                                        				<input type="radio" disabled="" name="a"> <i></i> Option four disabled </label>
                                        			</div>
                    						</cfif> 

                    						<cfif prc.cuestionarios.formulario.TIPO[i] eq 3>
                                    			<input type="text" disabled="true" class="js-range-slider form-control" name="my_range" value="" />
                    						</cfif>



                                    	</div>
                                	</div>
                    			</form>
                    		</p>
                    	</cfloop>
                    </div>
                </div>
                <div role="tabpanel" id="tab-2" class="tab-pane">
                    <div class="panel-body vistaCuestionario">
                    	<cfloop from="1" to="#prc.cuestionarios.cuestionario.RECORDCOUNT#" index="i">
                    		<p>
                    			<b>#i#) #prc.cuestionarios.cuestionario.DESCRIPCION[i]#</b>
                    		</p>
                    	</cfloop>
                    </div>
                </div>
                <!--- <div role="tabpanel" id="tab-3" class="tab-pane">
                    <div class="panel-body preguntasCuestionario">
                    </div>
                </div> --->
            </div>
        </div>
    </div>
</div>

</cfoutput>

<script src="/includes/js/jquery-3.1.1.min.js"></script>
<script src="/includes/js/plugins/chosen/chosen.jquery.js"></script>
<script src="/includes/js/plugins/iCheck/icheck.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/ion-rangeslider/2.3.0/js/ion.rangeSlider.min.js"></script>
<!--- <script src="/includes/js/plugins/ionRangeSlider/ion.rangeSlider.min.js"></script>
 --->
<script type="text/javascript">
	$(document).ready(function(){
		$(".js-range-slider").ionRangeSlider({
			skin: "big"
		});


		$('.i-checks').iCheck({
                    checkboxClass: 'icheckbox_square-green',
                    radioClass: 'iradio_square-green',
                });

	});

	
	
</script>