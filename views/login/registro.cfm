<!----
* =========================================================================
* IPN - ESCOM
* Trabajo Terminal
* Modulo: Principal
* Sub modulo: Registro principal
* Fecha: Agosto 18, 2018
* Descripcion: Vista Registro principal
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

    <title>GEE | Registro</title>

    <link href="/includes/css/bootstrap.min.css" rel="stylesheet">
    <link href="/includes/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="/includes/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="/includes/css/animate.css" rel="stylesheet">
    <link href="/includes/css/style.css" rel="stylesheet">
    <link href="/includes/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">

</head>

<body class="gray-bg">

    <div class="middle-box text-center loginscreen   animated fadeInDown">
        <div>
            <div>

                <img src="/includes/img/login/registro.png" style="max-width: 200px; max-height: 200px;">

            </div>
            <br>
            <h3>Registrar nuevo usuario</h3>
            <p>Complete los campos para crear su usuario</p>
            <form class="m-t" role="form" action="/index.cfm/login_registro/login/agregarUsuario" method="post">
                <div class="form-group">
                    <input name="nombre" type="text" class="form-control" placeholder="Nombre" required="">
                </div>
                <div class="form-group">
                    <input name="apaterno" type="text" class="form-control" placeholder="Apellido paterno" required="">
                </div>
                <div class="form-group">
                    <input name="amaterno" type="text" class="form-control" placeholder="Apellido materno" required="">
                </div>
                <div class="form-group" align="left">
                    <p text-right>Género</p>
                    <div class="radio radio-default">
                        <input type="radio" id="inlineRadio1" value="1" name="genero" required="">
                        <label for="inlineRadio1"><i class="fa fa-male" aria-hidden="true"></i> Masculino  </label>
                    </div>
                    <div class="radio radio-default">
                        <input type="radio" id="inlineRadio2" value="2" name="genero" required="">
                        <label for="inlineRadio2"><i class="fa fa-female" aria-hidden="true"></i> Femenino </label>
                    </div>
                </div>
                <div class="form-group">
                    <input name="email" type="email" class="form-control" placeholder="Correo electrónico" required="">
                </div>
                <div class="form-group">
                    <input name="password" type="password" class="form-control" placeholder="Contraseña" required="">
                </div>

                <!-- <div class="form-group">
                        <div class="checkbox i-checks"><label> <input type="checkbox"><i></i> Acepto los terminos y condiciones </label></div>
                </div> -->
                <button type="submit" class="btn btn-primary block full-width m-b">Registrar</button>

                <p class="text-muted text-center"><small>¿Ya cuenta con una cuenta?</small></p>
                <a class="btn btn-sm btn-white btn-block" href="/index.cfm/main">Login</a>
            </form>
            <p class="m-t"> <small><cfoutput>#foot#</cfoutput></small> </p>
        </div>
    </div>

    <!-- Mainly scripts -->
    <script src="/includes/js/jquery-3.1.1.min.js"></script>
    <script src="/includes/js/popper.min.js"></script>
    <script src="/includes/js/bootstrap.js"></script>
    <!-- iCheck -->
    <script src="/includes/js/plugins/iCheck/icheck.min.js"></script>
    <script>
        $(document).ready(function(){
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });
        });
    </script>
</body>

</html>
