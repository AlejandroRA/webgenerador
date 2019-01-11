<cfoutput>

<div class="panel panel-success">
    <div class="panel-heading titulo-panel">
        <!--- <cfoutput>#prc.cuestionarios.nombre# - #prc.cuestionarios.descripcion#</cfoutput> --->
        <h3>Vista previa
        <i onclick="cerrarConfiguracion2();" style="float: right; cursor: pointer;" class="fa fa-times fa-3" aria-hidden="true"></i> </h3>    
    </div>
    <div class="panel-body">      
        <div class="tabs-container">
            <ul class="nav nav-tabs" role="tablist">
                <li><a class="nav-link active" data-toggle="tab" href="##tab-formulario"> Formulario</a></li>
                <li><a class="nav-link" data-toggle="tab" href="##tab-cuestionario">Cuestionario</a></li>                
            </ul>
            <div class="tab-content">
                <div role="tabpanel" id="tab-formulario" class="tab-pane active">
                    <div class="panel-body vistaFormulario">
                    	<cfloop from="1" to="#prc.cuestionarios.formulario.RECORDCOUNT#" index="i">
                    		<p>
                    			<form method="get">
                    				<div class="form-group row">
                    					<label class="col-sm-2 col-form-label">#i#)  #prc.cuestionarios.formulario.DESCRIPCION[i]#</label>
                                    	<div class="col-sm-10">

                                    		<cfif prc.cuestionarios.formulario.TIPO[i] eq 1>
                                    			<textarea rows="4" disabled="true" type="text" class="form-control"></textarea> <span class="form-text m-b-none">0 de #prc.cuestionarios.formulario.TAMANO[i]# caracteres</span>
                    						</cfif>

                                    		<cfif prc.cuestionarios.formulario.TIPO[i] eq 2>
                                    			<cfset a = prc.cuestionarios.formulario.OPCIONES[i].Split(';')>
                                                
                                                <cfif a[1] eq 'S/O'>
                                                    <b> SIN OPCIONES ASIGNADAS </b>
                                                <cfelse>
                                                    <cfloop from="1" to="#arrayLen(a)#" index="i">
                                                        <cfset s = a[i].Split(':')>
                                                        <div class="i-checks">
                                                            <label> 
                                                                <input <cfif i eq 1>checked=""</cfif> type="radio" value="#s[1]#" name="a"> <i></i> #s[2]# 
                                                            </label>
                                                        </div>
                                                    </cfloop>
                                                </cfif>
                    						</cfif> 
                                            <!--- Se carga el reactivo tipo rango --->
                    						<cfif prc.cuestionarios.formulario.TIPO[i] eq 3>
                                    		    <cfset a = prc.cuestionarios.formulario.RANGO[i].Split(',')>
                                                <input type="text" data-min="#a[1]#" data-max="#a[2]#" class="js-range-slider form-control" name="my_range" value="" />
                    						</cfif>
                                    	</div>
                                	</div>
                    			</form>
                    		</p>
                    	</cfloop>
                    </div>
                </div>
                <div role="tabpanel" id="tab-cuestionario" class="tab-pane">
                    <div class="panel-body vistaCuestionario">
                    	<cfloop from="1" to="#prc.cuestionarios.cuestionario.RECORDCOUNT#" index="i">
                    		<p>
                                <form method="get">
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">#i#)  #prc.cuestionarios.cuestionario.DESCRIPCION[i]#</label>
                                        <div class="col-sm-10">

                                            <cfif prc.cuestionarios.cuestionario.TIPO[i] eq 1>
                                                <textarea rows="4" disabled="true" type="text" class="form-control"></textarea> <span class="form-text m-b-none">0 de #prc.cuestionarios.cuestionario.TAMANO[i]# caracteres</span>
                                            </cfif>

                                            <cfif prc.cuestionarios.cuestionario.TIPO[i] eq 2>
                                                <cfset a = prc.cuestionarios.cuestionario.OPCIONES[i].Split(';')>
                                                
                                                <cfif a[1] eq 'S/O'>
                                                    <b> SIN OPCIONES ASIGNADAS </b>
                                                <cfelse>
                                                    <cfloop from="1" to="#arrayLen(a)#" index="i">
                                                        <cfset s = a[i].Split(':')>
                                                        <div class="i-checks">
                                                            <label> 
                                                                <input <cfif i eq 1>checked=""</cfif> type="radio" value="#s[1]#" name="a"> <i></i> #s[2]# 
                                                            </label>
                                                        </div>
                                                    </cfloop>
                                                </cfif>
                                            </cfif> 
                                            <!--- Se carga el reactivo tipo rango --->
                                            <cfif prc.cuestionarios.cuestionario.TIPO[i] eq 3>
                                                <cfset a = prc.cuestionarios.cuestionario.RANGO[i].Split(',')>
                                                <input type="text" data-min="#a[1]#" data-max="#a[2]#" class="js-range-slider form-control" name="my_range" value="" />
                                            </cfif>
                                        </div>
                                    </div>
                                </form>
                            </p>
                    	</cfloop>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</cfoutput>

<script type="text/javascript">
	$(document).ready(function(){
		$(".js-range-slider").ionRangeSlider({
			skin: "big"
		});

   
		$('.i-checks').iCheck({
                    checkboxClass: 'icheckbox_square-green',
                    radioClass: 'iradio_square-green',
                });

       // var radioValue = $("input[name='a']:checked").val();
       // console.log(radioValue);

	});



	
	
</script>