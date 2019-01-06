<!----
* =========================================================================
* IPN - ESCOM
* Trabajo Terminal
* Modulo: Principal
* Sub modulo: Layout principal
* Fecha: Agosto 18, 2018
* Descripcion: Vista Contraseña olvidada
* Autor: Lucia Ramirez
* =========================================================================
---->
<cfprocessingdirective pageEncoding="utf-8"> 
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>GEE | Contraseña olvidada</title>

    <link href="/includes/css/bootstrap.min.css" rel="stylesheet">
    <link href="/includes/font-awesome/css/font-awesome.css" rel="stylesheet">

    <link href="/includes/css/animate.css" rel="stylesheet">
    <link href="/includes/css/style.css" rel="stylesheet">
    <link href="/includes/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">

</head>

<body class="gray-bg">

    <div class="passwordBox animated fadeInDown">
        <div class="row">

            <div class="col-md-12">
                <div class="ibox-content">

                    <h2 class="font-bold">Contraseña olvidada</h2>

                    <p>
                        Ingresa tu dirección de correo electrónico para que los datos de tu cuenta sean enviados a el.
                    </p>

                    <div class="row">

                        <div class="col-lg-12">
                            <form id="formEmail" class="m-t" role="form" method="post" onsubmit="return recuperarContrasena()">
                                <div class="form-group">
                                    <input id="email" type="email" name="email" class="form-control" placeholder="Correo electrónico" required="">
                                </div>

                                <button type="submit" class="btn btn-primary block full-width m-b">Enviar</button>
                            </form>
                            <a href="/index.cfm/main/index">
                                <small>Iniciar sesión</small>
                            </a>
                        </div>
                    </div>
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

    <!-- Mainly scripts -->
    <script src="/includes/js/jquery-3.1.1.min.js"></script>
    <script src="/includes/js/popper.min.js"></script>
    <script src="/includes/js/bootstrap.js"></script>
    <script src="https://smtpjs.com/v2/smtp.js"></script>
    <!-- iCheck -->
    <script src="/includes/js/plugins/iCheck/icheck.min.js"></script>
    <script src="/includes/js/plugins/sweetalert/sweetalert.min.js"></script>
    <script>
        $(document).ready(function(){
            
        });

        /*funcion encargada de la recuperacion de la contrasena*/
        function recuperarContrasena(){
            var email = $('#email').val();
            

            $.post('/index.cfm/login_registro/login/datosCorreo',{
                email : email
            },function(data){
                if(data.ROWCOUNT > 0){
                    emailSend(email,data.DATA.CORREO[0],data.DATA.PASS[0]);
                    swal({
                        title: "Exito",
                        text: "Los datos de la cuenta fueron enviados.",
                        type: "success"
                    });
                }else{
                    swal({
                        title: "Error",
                        text: "El correo electrónico no coincide con ninguna cuenta.",
                        type: "error"
                    });
                }
            });
            $('#email').val('');
            return false;
        }



        /*Funcion encargada de mandar el correo electronico*/
        function emailSend(email, user,pass){
        Email.send("GEAE.ESCOM@gmail.com",
            email,
            "Recuperar contraseña",
            '<h1>Hola!</h1><h2>Los datos de su cuenta en el sistema son usuario: '+ user +' y contraseña: '+pass+' </h2>',
            "smtp.gmail.com",
            "GEAE.ESCOM@gmail.com",
            "GEAE_2018");
        }

    </script>
</body>

</html>
