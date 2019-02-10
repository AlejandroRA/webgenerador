<!----
* =========================================================================
* IPN - ESCOM
* Trabajo Terminal
* Modulo: Principal
* Sub modulo: Layout principal
* Fecha: Agosto 18, 2018
* Descripcion: Modulo de captura de cuestionario
* Autor: Lucia Ramirez
* =========================================================================
---->
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

    <div id="wrapper">
        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-lg-12">
                    <div class="ibox">
                        <div class="ibox-content contenido">
                            <h2>
                                <cfoutput>#prc.cuestionario.cuestionario.nombre#</cfoutput>
                            </h2>
                            <p>
                                <cfoutput>#prc.cuestionario.cuestionario.descripcion#</cfoutput>
                            </p> 

                            <form id="form" action="#" class="wizard-big">
                                <h1>Registro</h1>
                                <fieldset>
                                    <h2>Registro</h2>
                                    <div class="row">
                                        <div class="col-lg-8">
                                            <cfoutput>
                                                <cfloop from="1" to="#prc.cuestionario.pregunta.formulario.RECORDCOUNT#" index="i">
                                                    <div class="form-group row">
                                                        <label class="col-sm-12 col-form-label"><b>#prc.cuestionario.pregunta.formulario.DESCRIPCION[i]# <cfif prc.cuestionario.pregunta.formulario.OBLIGADO[i] eq 1> *</cfif></b></label>
                                                        <div class="col-sm-12">
                                                            <cfif prc.cuestionario.pregunta.formulario.TIPO[i] eq 1>
                                                                <input type="text" idres="#prc.cuestionario.pregunta.formulario.ID_PREGUNTA[i]#"   type="text" class="registro-form form-control <cfif prc.cuestionario.pregunta.formulario.OBLIGADO[i] eq 1>required</cfif>"><span class="form-text m-b-none">0 de #prc.cuestionario.pregunta.formulario.TAMANO[i]# caracteres</span>
                                                            </cfif>
                                                            <cfif prc.cuestionario.pregunta.formulario.TIPO[i] eq 2>
                                                                <cfset a = prc.cuestionario.pregunta.formulario.OPCIONES[i].Split(';')>
                                                
                                                                <cfif a[1] eq 'S/O'>
                                                                    <b> SIN OPCIONES ASIGNADAS </b>
                                                                <cfelse>
                                                                    <cfloop from="1" to="#arrayLen(a)#" index="j">
                                                                        <cfset s = a[j].Split(':')>
                                                                        <div class="i-checks">
                                                                            <label> 
                                                                                <input h="form-opc"  idres="#prc.cuestionario.pregunta.formulario.ID_PREGUNTA[i]#" idopcion="opcion#prc.cuestionario.pregunta.formulario.ID_PREGUNTA[i]#"  <cfif j eq 1>checked=""</cfif> type="radio" value="#s[1]#" name="opcion#prc.cuestionario.pregunta.formulario.ID_PREGUNTA[i]#"> <i></i> #s[2]# 
                                                                            </label>
                                                                        </div>
                                                                    </cfloop>
                                                                </cfif>
                                                            </cfif>
                                                            <cfif prc.cuestionario.pregunta.formulario.TIPO[i] eq 3>
                                                                <cfset a = prc.cuestionario.pregunta.formulario.RANGO[i].Split(',')>
                                                                <input idres="#prc.cuestionario.pregunta.formulario.ID_PREGUNTA[i]#"  type="text" data-min="#a[1]#" data-max="#a[2]#" class="js-range-slider form-control registro-form" name="my_range" value="" />
                                                            </cfif> 
                                                        </div>
                                                    </div>
                                                </cfloop>
                                            </cfoutput>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="text-center">
                                                <div style="margin-top: 20px">
                                                    <i class="fa fa-sign-in" style="font-size: 180px;color: #e5e5e5 "></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </fieldset>
                                <h1>Cuestionario</h1>
                                <fieldset>
                                    <h2>Cuestionario</h2>
                                    <div class="row">
                                        <div class="col-lg-12">
                                        <div class="form-group row">
                                            <cfoutput>
                                                <cfloop from="1" to="#prc.cuestionario.pregunta.cuestionario.RECORDCOUNT#" index="i">
                                                    <label class="col-4 col-form-label">
                                                    <b>#i#) #prc.cuestionario.pregunta.cuestionario.DESCRIPCION[i]#</b>
                                                    </label>
                                                    <div class="col-8">
                                                        <cfif prc.cuestionario.pregunta.cuestionario.TIPO[i] eq 1>
                                                                <input idres="#prc.cuestionario.pregunta.cuestionario.ID_PREGUNTA[i]#" type="text" class="cuestionario-form form-control"><span class="form-text m-b-none">0 de #prc.cuestionario.pregunta.formulario.TAMANO[i]# caracteres</span>
                                                            </cfif>
                                                            <cfif prc.cuestionario.pregunta.cuestionario.TIPO[i] eq 2>
                                                                <cfset a = prc.cuestionario.pregunta.cuestionario.OPCIONES[i].Split(';')>
                                                
                                                                <cfif a[1] eq 'S/O'>
                                                                    <b> SIN OPCIONES ASIGNADAS </b>
                                                                <cfelse>
                                                                    <cfloop from="1" to="#arrayLen(a)#" index="j">
                                                                        <cfset s = a[j].Split(':')>
                                                                        <div class="i-checks">
                                                                            <label> 
                                                                                <input h="cuest-opc" idres="#prc.cuestionario.pregunta.cuestionario.ID_PREGUNTA[i]#" <cfif j eq 1>checked=""</cfif> type="radio" value="#s[1]#" name="opcion#prc.cuestionario.pregunta.cuestionario.ID_PREGUNTA[i]#"> <i></i> #s[2]# 
                                                                            </label>
                                                                        </div>
                                                                    </cfloop>
                                                                </cfif>
                                                            </cfif>
                                                            <cfif prc.cuestionario.pregunta.cuestionario.TIPO[i] eq 3>
                                                                <cfset a = prc.cuestionario.pregunta.cuestionario.RANGO[i].Split(',')>
                                                                <input idres="#prc.cuestionario.pregunta.cuestionario.ID_PREGUNTA[i]#" type="text" data-min="#a[1]#" data-max="#a[2]#" class="js-range-slider form-control cuestionario-form" name="my_range" value="" />
                                                            </cfif> 
                                                    </div>
                                                </cfloop>
                                            </cfoutput>
                                        </div>
                                        </div>
                                    </div>
                                </fieldset>
                                <h1>Finalizar</h1>
                                <fieldset>
                                    <h2>
                                        <center><b>Final de cuestionario</b></center>

                                    </h2>
                                    <h2>
                                        Ha acompletado el cuestionario, de click en el boton de terminar para enviar las respuesta.
                                    
                                    </h2>
                                    <h2>
                                        Puede regresar si desea corregir alguna respuesta.
                                    </h2>
                                    <center>
                                        <img align="center" src="/includes/img/cuestionarios/goal.png">
                                    </center>
                                    <!--- <h4>Ha acompletado el cuestionario, de click en el boton de terminar para enviar las respuesta.
                                    Puede regresar si desea corregir alguna respuesta.</h4> --->
                                    <!--- <input id="acceptTerms" name="acceptTerms" type="checkbox" class="required"> <label for="acceptTerms">I agree with the Terms and Conditions.</label> --->
                                </fieldset>
                            </form>
                        </div>
                    </div>
                    </div>

                </div>
            </div>
        

        </div>
        </div>


<div id="test">
</div>

    <script src="/includes/js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            
            $("#wizard").steps({
                
                transitionEffect: "slideLeft",
                 autoFocus: true
            });




            $("#form").steps({
                bodyTag: "fieldset",
                onStepChanging: function (event, currentIndex, newIndex)
                {
                    // Always allow going backward even if the current step contains invalid fields!
                    if (currentIndex > newIndex)
                    {
                        return true;
                    }

                    // Forbid suppressing "Warning" step if the user is to young
                    if (newIndex === 3 && Number($("#age").val()) < 18)
                    {
                        return false;
                    }

                    var form = $(this);

                    // Clean up if user went backward before
                    if (currentIndex < newIndex)
                    {
                        // To remove error styles
                        $(".body:eq(" + newIndex + ") label.error", form).remove();
                        $(".body:eq(" + newIndex + ") .error", form).removeClass("error");
                    }

                    // Disable validation on fields that are disabled or hidden.
                    form.validate().settings.ignore = ":disabled,:hidden";

                    // Start validation; Prevent going forward if false
                    return form.valid();
                },
                onStepChanged: function (event, currentIndex, priorIndex)
                {
                    // Suppress (skip) "Warning" step if the user is old enough.
                    if (currentIndex === 2 && Number($("#age").val()) >= 18)
                    {
                        $(this).steps("next");
                    }

                    // Suppress (skip) "Warning" step if the user is old enough and wants to the previous step.
                    if (currentIndex === 2 && priorIndex === 3)
                    {
                        $(this).steps("previous");
                    }
                },
                onFinishing: function (event, currentIndex)
                {
                    var form = $(this);

                    // Disable validation on fields that are disabled.
                    // At this point it's recommended to do an overall check (mean ignoring only disabled fields)
                    form.validate().settings.ignore = ":disabled";

                    // Start validation; Prevent form submission if false
                    return form.valid();
                },
                onFinished: function (event, currentIndex)
                {
                    var form = $(this);
                    
                    // Submit form input
                    /*se manda a validar el error*/
                    /*formulario*/

                    var formulario = [];
                    var cuestionario = [];

                    $('.registro-form').each(function(){
                        formulario.push({
                            id: $(this).attr('idres'),
                            respuesta: $(this).val()
                        });
                    });
                    $('input[h="form-opc"]:checked').each(function(){
                        formulario.push({
                            id: $(this).attr('idres'),
                            respuesta: $(this).val()
                        });
                    });

                    /*cuestionario*/
                    $('.cuestionario-form').each(function(){
                        cuestionario.push({
                            id: $(this).attr('idres'),
                            respuesta: $(this).val()
                        });
                    });


                    $('input[h="cuest-opc"]:checked').each(function(){
                        cuestionario.push({
                            id: $(this).attr('idres'),
                            respuesta: $(this).val()
                        });
                    });
                    var respuestas = {
                        formularios: formulario,
                        cuestionarios: cuestionario
                    };
                    console.log(respuestas);
                    $.post('/index.cfm/cuestionarios/cuestionarios/registrarCapturaCuestionario',{
                        valores : JSON.stringify(respuestas)
                    },function(data){

                        $('.contenido').html('<h1>Exito</h1><h3><p>Sus respuestas han sido registradas.</p></h3><center><img align="center" src="/includes/img/cuestionarios/exito.png"  width="250" height="250"></center><br>');
                    });
                }
            }).validate({
                        errorPlacement: function (error, element)
                        {

                            element.before(error);
                        },
                        rules: {
                            confirm: {
                                equalTo: "#password"
                            }
                        }
                    });


            $(".js-range-slider").ionRangeSlider({
                skin: "big"
            });
            //$("input[name='a']:checked").val();
            $('.i-checks').iCheck({
                    checkboxClass: 'icheckbox_square-green',
                    radioClass: 'iradio_square-green',
                });
       });
    </script>

</body>


