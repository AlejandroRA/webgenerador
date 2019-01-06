<!----
* =========================================================================
* IPN - ESCOM
* Trabajo Terminal
* Modulo: Principal
* Sub modulo: Layout principal
* Fecha: Agosto 18, 2018
* Descripcion: Vista Login principal
* Autor: Lucia Ramirez
* =========================================================================
---->
<cfprocessingdirective pageEncoding="utf-8"> 
<cfset foot="Sistema Web Generador de Cuestionarios para Análisis Estadístico">
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>GEE | Login</title>

    <link href="/includes/css/bootstrap.min.css" rel="stylesheet">
    <link href="/includes/font-awesome/css/font-awesome.css" rel="stylesheet">

    <link href="/includes/css/animate.css" rel="stylesheet">
    <link href="/includes/css/style.css" rel="stylesheet">

</head>

<body class="gray-bg">

    <div class="loginColumns animated fadeInDown">
        <div class="row">

            <div class="col-md-6">
                <h1 class="font-bold">Bienvenid@s </h1>

                <p>
                    <img src="/includes/img/login/login.png" style="max-width: 375px; max-height: 450px;">
                </p>
            </div>
            <div class="col-md-6">
                <div class="ibox-content">
                    <cfoutput>
                        <cfif StructKeyExists(prc, "resultado")>
                            <div class="alert alert-info">
                                <cfif prc.resultado eq 1>
                                    El usuario ha sido registrado con exitosamente.<br> Los datos de su cuenta han sido enviados a su correo eletrónico.
                                </cfif>
                                <cfif prc.resultado eq 2>
                                    El usuario ha sido registrado con anterioridad. De click <a class="alert-link" href="/index.cfm/login_registro/login/contrasenaOlvidada">aqui</a> para mandar los datos de la cuenta a su correo.
                                </cfif>
                            </div>
                        </cfif>
                        #getInstance( "MessageBox@cbmessagebox" ).renderIt()#
                    </cfoutput>
                    <form class="m-t" role="form" action="/index.cfm/login_registro/login/iniciarSesion" method="POST">
                        <div class="form-group">
                            <input type="email" name="email" class="form-control" placeholder="Correo electrónico" required="">
                        </div>
                        <div class="form-group">
                            <input type="password" name="password" class="form-control" placeholder="Contraseña" required="">
                        </div>
                        <button type="submit" class="btn btn-primary block full-width m-b">Login</button>

                        <a href="/index.cfm/login_registro/login/contrasenaOlvidada">
                            <small>¿Olvidaste tu contraseña?</small>
                        </a>

                        <p class="text-muted text-center">
                            <small>¿No tienes cuenta?</small>
                        </p>
                        <a class="btn btn-sm btn-white btn-block" href="/index.cfm/login_registro/login/registrarUsuario">Crear una cuenta</a>
                    </form>
                    <p class="m-t">
                        <small><cfoutput>#foot#</cfoutput></small>
                    </p>
                </div>
            </div>
        </div>
        <hr/>
        <div class="row">
            <div class="col-md-6">
                Trabajo Terminal
            </div>
            <div class="col-md-6 text-right">
               <small>© 2019</small>
            </div>
        </div>
    </div>



</body>

</html>

