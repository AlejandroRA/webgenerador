<!-- <cfdump var="#prc#"> -->


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
                        <div class="ibox-content">
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
                                                        <label class="col-sm-12 col-form-label">#prc.cuestionario.pregunta.formulario.DESCRIPCION[i]# <cfif prc.cuestionario.pregunta.formulario.OBLIGADO[i] eq 1> *</cfif></label>
                                                        <div class="col-sm-12">
                                                            <cfif prc.cuestionario.pregunta.formulario.TIPO[i] eq 1>
                                                                <input type="text"  type="text" class="form-control"><span class="form-text m-b-none">0 de #prc.cuestionario.pregunta.formulario.TAMANO[i]# caracteres</span>
                                                            </cfif>
                                                            <cfif prc.cuestionario.pregunta.formulario.TIPO[i] eq 2>
                                                                <cfset a = prc.cuestionario.pregunta.formulario.OPCIONES[i].Split(';')>
                                                
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
                                                            <cfif prc.cuestionario.pregunta.formulario.TIPO[i] eq 3>
                                                                <cfset a = prc.cuestionario.pregunta.formulario.RANGO[i].Split(',')>
                                                                <input type="text" data-min="#a[1]#" data-max="#a[2]#" class="js-range-slider form-control" name="my_range" value="" />
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
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label>First name *</label>
                                                <input id="name" name="name" type="text" class="form-control required">
                                            </div>
                                            <div class="form-group">
                                                <label>Last name *</label>
                                                <input id="surname" name="surname" type="text" class="form-control required">
                                            </div>
                                        </div>
                                    </div>
                                </fieldset>
                                <h1>Finish</h1>
                                <fieldset>
                                    <h2>Terms and Conditions</h2>
                                    <input id="acceptTerms" name="acceptTerms" type="checkbox" class="required"> <label for="acceptTerms">I agree with the Terms and Conditions.</label>
                                </fieldset>
                            </form>
                        </div>
                    </div>
                    </div>

                </div>
            </div>
        

        </div>
        </div>



    <!-- Mainly scripts -->
    <!-- <script src="/includes/js/jquery-3.1.1.min.js"></script>
    <script src="/includes/js/popper.min.js"></script>
    <script src="/includes/js/bootstrap.js"></script>
    <script src="/includes/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="/includes/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
 -->
    <!-- Custom and plugin javascript
    <script src="/includes/js/inspinia.js"></script>
    <script src="/includes/js/plugins/pace/pace.min.js"></script>
 -->
    <!-- Steps -->
    <!-- <script src="/includes/js/plugins/steps/jquery.steps.min.js"></script>

    Jquery Validate
    <script src="/includes/js/plugins/validate/jquery.validate.min.js"></script> -->

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
                    form.submit();
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

            $('.i-checks').iCheck({
                    checkboxClass: 'icheckbox_square-green',
                    radioClass: 'iradio_square-green',
                });
       });
    </script>

</body>


