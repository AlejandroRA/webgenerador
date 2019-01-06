<!----
* =========================================================================
* IPN - ESCOM
* Trabajo Terminal
* Modulo: Principal
* Sub modulo: Layout principal
* Fecha: Agosto 18, 2018
* Descripcion: Vista Layout principal
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
            <div class="navbar-collapse collapse" id="navbar">
                <ul class="nav navbar-nav mr-auto">
                    <!--- <li class="active">
                        <a aria-expanded="false" role="button" href="layouts.html"> Perfil de usuario</a>
                    </li> --->
                    <li >
                        <a aria-expanded="false" role="button" href="/index.cfm/perfilUsuario/perfil"> Perfil de usuario</a>
                    </li>
                    <li >
                        <a aria-expanded="false" role="button" href="/index.cfm/cuestionarios/cuestionarios"> Cuestionarios</a>
                    </li>
                    
                    <!--- <li class="dropdown">
                        <a aria-expanded="false" role="button" href="#" class="dropdown-toggle" data-toggle="dropdown"> Menu item</a>
                        <ul role="menu" class="dropdown-menu">
                            <li><a href="">Menu item</a></li>
                            <li><a href="">Menu item</a></li>
                            <li><a href="">Menu item</a></li>
                            <li><a href="">Menu item</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a aria-expanded="false" role="button" href="#" class="dropdown-toggle" data-toggle="dropdown"> Menu item</a>
                        <ul role="menu" class="dropdown-menu">
                            <li><a href="">Menu item</a></li>
                            <li><a href="">Menu item</a></li>
                            <li><a href="">Menu item</a></li>
                            <li><a href="">Menu item</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a aria-expanded="false" role="button" href="#" class="dropdown-toggle" data-toggle="dropdown"> Menu item</a>
                        <ul role="menu" class="dropdown-menu">
                            <li><a href="">Menu item</a></li>
                            <li><a href="">Menu item</a></li>
                            <li><a href="">Menu item</a></li>
                            <li><a href="">Menu item</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a aria-expanded="false" role="button" href="#" class="dropdown-toggle" data-toggle="dropdown"> Menu item</a>
                        <ul role="menu" class="dropdown-menu">
                            <li><a href="">Menu item</a></li>
                            <li><a href="">Menu item</a></li>
                            <li><a href="">Menu item</a></li>
                            <li><a href="">Menu item</a></li>
                        </ul>
                    </li> --->

                </ul>
                <ul class="nav navbar-top-links navbar-right">
                    <li>
                        <a href="/index.cfm/Main/cerrarSesion">
                            <i class="fa fa-sign-out"></i> Cerrar sesión
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
        </div>
        <!--- <div class="wrapper wrapper-content">
            <div class="container">
                <cfoutput>
                    #renderView()#
                </cfoutput>
            </div>

        </div> --->
        <cfoutput>
            #renderView()#
        </cfoutput>
        

        <div class="footer">
            <div class="float-right">
                <!--- 10GB of <strong>250GB</strong> Free. ---><strong>Trabajo Terminal</strong>
            </div>
            <div>
                <!--- <strong>Copyright</strong> Example Company &copy; 2014-2018 --->
                Sistema Generador de Cuestionarios para Análisis Estadístico
            </div>
        </div>

        </div>
        </div>



    <!-- Mainly scripts -->
    <script src="/includes/js/jquery-3.1.1.min.js"></script>
    <script src="/includes/js/popper.min.js"></script>
    <script src="/includes/js/bootstrap.js"></script>
    <script src="/includes/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="/includes/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="https://smtpjs.com/v2/smtp.js"></script>
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
    <script>
        $(document).ready(function() {


        });
        
    </script>

</body>

</html>
