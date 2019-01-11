<!----
* =========================================================================
* IPN - ESCOM
* Trabajo Terminal
* Modulo: Principal
* Sub modulo: Layout principal
* Fecha: Enero 10, 2019
* Descripcion: Vista Layout de captura
* Autor: Lucia Ramirez
* =========================================================================
---->
<cfprocessingdirective pageEncoding="utf-8">
<cfset foot="Sistema Web Generador de Encuestas para Análisis Estadístico">
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>SGCA</title>
    <link href="/includes/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="/includes/css/bootstrap.min.css" rel="stylesheet">
    <link href="/includes/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="/includes/css/animate.css" rel="stylesheet">
    <link href="/includes/css/style.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/includes/css/plugins/bootstrap-table/bootstrap-table.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ion-rangeslider/2.3.0/css/ion.rangeSlider.min.css"/>
    <link href="/includes/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="/includes/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="/includes/css/plugins/steps/jquery.steps.css" rel="stylesheet">
    <link href="/includes/css/plugins/iCheck/custom.css" rel="stylesheet">


</head>

<body class="top-navigation">

    <div id="wrapper">
        <div id="page-wrapper" class="gray-bg">
        <div class="row border-bottom white-bg">
        <nav class="navbar navbar-expand-lg navbar-static-top" role="navigation">
            <!--<div class="navbar-header">-->
                <!--<button aria-controls="navbar" aria-expanded="false" data-target="#navbar" data-toggle="collapse" class="navbar-toggle collapsed" type="button">-->
                    <!--<i class="fa fa-reorder"></i>-->
                <!--</button>-->

                <a href="/index.cfm/Main/index" class="navbar-brand">SGCA</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-reorder"></i>
                </button>

            <!--</div>-->
        <!---     <div class="navbar-collapse collapse" id="navbar">
                <ul class="nav navbar-nav mr-auto">
                    
                </ul>
                
            </div> --->
        </nav>
        </div>
        <cfoutput>
            #renderView()#
        </cfoutput>
        

        <!--- <div class="footer">
            <div class="float-right">
                <!--- 10GB of <strong>250GB</strong> Free. ---><strong>Trabajo Terminal</strong>
            </div>
            <div>
                <!--- <strong>Copyright</strong> Example Company &copy; 2014-2018 --->
                Sistema Generador de Cuestionarios para Análisis Estadístico
            </div>
        </div> --->

        </div>
        </div>



    <!-- Mainly scripts -->
    <script src="/includes/js/jquery-3.1.1.min.js"></script>
    <script src="/includes/js/plugins/chosen/chosen.jquery.js"></script>
    
    <script src="/includes/js/popper.min.js"></script>
    <script src="/includes/js/bootstrap.js"></script>
    <script src="/includes/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="/includes/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="https://smtpjs.com/v2/smtp.js"></script>
    <script src="/includes/js/plugins/iCheck/icheck.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ion-rangeslider/2.3.0/js/ion.rangeSlider.min.js"></script>
    <!-- Custom and plugin javascript -->
    <script src="/includes/js/inspinia.js"></script>
    <script src="/includes/js/plugins/pace/pace.min.js"></script>
    

    <!-- Flot -->
    <script src="/includes/js/plugins/flot/jquery.flot.js"></script>
    <script src="/includes/js/plugins/flot/jquery.flot.tooltip.min.js"></script>
    <script src="/includes/js/plugins/flot/jquery.flot.resize.js"></script>

    <!-- ChartJS-->
    <script src="/includes/js/plugins/chartJs/Chart.min.js"></script>

    <!-- Peity -->
    <script src="/includes/js/plugins/peity/jquery.peity.min.js"></script>
    <!-- Peity demo -->
    <script src="/includes/js/demo/peity-demo.js"></script>
    <script src="/includes/js/plugins/sweetalert/sweetalert.min.js"></script>
    <script src="/includes/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
    <!-- Steps -->
    <script src="/includes/js/plugins/steps/jquery.steps.js"></script>
    <script src="/includes/js/plugins/validate/jquery.validate.min.js"></script>
    <script>
        $(document).ready(function() {


        });
        
    </script>

</body>

</html>
