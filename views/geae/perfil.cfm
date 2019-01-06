<!----
* =========================================================================
* IPN - ESCOM
* Trabajo Terminal
* Modulo: Principal
* Sub modulo: Layout principal
* Fecha: Agosto 18, 2018
* Descripcion: Vista datos principales del usuario
* Autor: Lucia Ramirez
* =========================================================================
---->
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
                	<center><h1> Perfil de usuario </h1></center>
                    <!--- <cfdump var="#session#"> --->
                    <div class="row">
                    	<div class="col-lg-4">
                            <cfif Compare(TRIM(session.cbstorage.usuario.genero), 'FEMENINO' ) EQ 0>
                                <center><img class="responsive"  src="/includes/img/perfil/woman.png" ></center>
                            <cfelse>
                                <center><img class="responsive"  src="/includes/img/perfil/man.png" ></center>
                            </cfif> 
                    	</div>
                    	<div class="col-lg-4">
                            
                            <h2> Datos de usuario </h2>
                            <font size="3">
                                <p><b>Estado:&nbsp;</b> <span class="label label-success">Activo</span></p>
                                <p><b>Nombre:&nbsp; </b>  <cfoutput>#session.cbstorage.usuario.nombre#</cfoutput></p> 
                                <p><b>Apellido Paterno:&nbsp; </b>  <cfoutput>#session.cbstorage.usuario.apaterno#</cfoutput></p> 
                                <p><b>Apellido Materno:&nbsp; </b>  <cfoutput>#session.cbstorage.usuario.amaterno#</cfoutput></p> 
                                <p><b>Genero:&nbsp; </b>  <cfoutput>#Lcase(session.cbstorage.usuario.genero)#</cfoutput></p>
                                <p><b>Correo electrónico:&nbsp; </b>  <cfoutput>#Lcase(session.cbstorage.usuario.correo)#</cfoutput></p>
                                 
                            </font>

                            

                    	</div>
                        <div class="col-lg-4">
                            
                            <h2> Opciones </h2>
                            <p>
                                <button class="btn btn-info" onclick="datosAcceso();"><i class="fa fa-pencil-square" aria-hidden="true"></i> Enviar al correo datos de acceso</button>
                            </p>
                            <p>
                                <a data-toggle="modal" href="#modal-datos-perfil" class="btn btn-warning"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Editar perfil</a>
                                <a data-toggle="modal" href="#modal-password" class="btn btn-warning"><i class="fa fa-pencil-square" aria-hidden="true"></i> Cambiar contraseña</a>
                            </p>
                            <p>
                                <button onclick="eliminarCuenta();" class="btn btn-danger"><i class="fa fa-times" aria-hidden="true"></i> Eliminar perfil</button>
                            </p>
                                <!--- <div class="text-center"> --->
                                <!--- <a data-toggle="modal" class="btn btn-primary" href="#modal-form">Form in simple modal box</a> --->
                                <!--- </div> --->
                            

                            
                            <!--- <font size="3">
                                <p><b>Estado:&nbsp;</b> <span class="label label-primary">Activo</span></p>
                                <p><b>Nombre:&nbsp; </b>  <cfoutput>#session.cbstorage.usuario.nombre#</cfoutput></p> 
                                <p><b>Apellido Paterno:&nbsp; </b>  <cfoutput>#session.cbstorage.usuario.apaterno#</cfoutput></p> 
                                <p><b>Apellido Materno:&nbsp; </b>  <cfoutput>#session.cbstorage.usuario.amaterno#</cfoutput></p> 
                                <p><b>Genero:&nbsp; </b>  <cfoutput>#session.cbstorage.usuario.genero#</cfoutput></p> 
                            </font> --->

                            

                        </div>
                    </div>
                </div>
            </div>
        </div>
	</div>
</div>

<!-------------- MODAL para el cambio de datos de perfil ------------------------------>
<div id="modal-datos-perfil" class="modal fade" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-12 b-r">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                        <h3 class="m-t-none m-b">Editar perfil</h3>
                        <p></p>
                        <form role="form" onsubmit="return cambiarDatosPerfil();" method="post">
                            <div class="form-group"><label>Nombre</label> <input id="nombre" type="text" placeholder="Nombre" class="form-control" required="" value="<cfoutput>#session.cbstorage.usuario.nombre#</cfoutput>"></div>
                            <div class="form-group"><label>Apellido paterno</label> <input id="apaterno" type="text" placeholder="Apellido paterno" class="form-control" required="" value="<cfoutput>#session.cbstorage.usuario.apaterno#</cfoutput>"></div>
                            <div class="form-group"><label>Apellido materno</label> <input id="amaterno" type="text" placeholder="Apellido materno" class="form-control" required="" value="<cfoutput>#session.cbstorage.usuario.amaterno#</cfoutput>"></div>
                            <div class="form-group"><label>Genéro</label> 
                                <div class="radio radio-default">
                                    <input type="radio" id="inlineRadio1" value="1" name="genero" required="" <cfif Compare(TRIM(session.cbstorage.usuario.genero), 'MASCULINO' ) EQ 0> checked </cfif>>
                                        <label for="inlineRadio1"><i class="fa fa-male" aria-hidden="true"></i> Masculino  </label>
                                </div>
                                <div class="radio radio-default">
                                    <input type="radio" id="inlineRadio2" value="2" name="genero" required="" <cfif Compare(TRIM(session.cbstorage.usuario.genero), 'FEMENINO' ) EQ 0> checked </cfif>>
                                    <label for="inlineRadio2"><i class="fa fa-female" aria-hidden="true"></i> Femenino </label>
                                </div>
                            </div>
                            <div class="form-group"><label>Correo electrónico</label> <input disabled="true" id="correo" type="text" placeholder="Correo electrónico" class="form-control" required="" value="<cfoutput>#Lcase(session.cbstorage.usuario.correo)#</cfoutput>"></div>
                            <div class="form-group"><label>Contraseña</label> <input id="pass_confirm" type="password" placeholder="Contraseña" class="form-control" required=""></div>
                            <div>
                                <button class="btn  btn-primary float-right m-t-n-xs" type="submit"><strong>Enviar</strong></button>
                                <!--- <label> <input type="checkbox" class="i-checks"> Remember me </label> --->
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-------------- MODAL para el cambio de contraseña ------------------------------>
<div id="modal-password" class="modal fade" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-12 b-r">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                        <h3 class="m-t-none m-b">Datos de perfil</h3>
                        <p></p>
                        <form role="form" onsubmit="return cambiarContrasena();" method="post">
                            <div class="form-group"><label>Contraseña actual</label> <input id="cur_pass" type="password" placeholder="Contraseña actual" class="form-control" required=""></div>
                            <div class="form-group"><label>Contraseña nueva</label> <input id="new_pass" type="password" placeholder="Contraseña nueva" class="form-control" required=""></div>
                            <div>
                                <button class="btn  btn-primary float-right m-t-n-xs" type="submit"><strong>Enviar</strong></button>
                                <!--- <label> <input type="checkbox" class="i-checks"> Remember me </label> --->
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--- <div id="modal-form" class="modal fade" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-6 b-r">
                        <h3 class="m-t-none m-b">Sign in</h3>
                        <p>Sign in today for more expirience.</p>
                        <form role="form">
                            <div class="form-group"><label>Email</label> <input type="email" placeholder="Enter email" class="form-control"></div>
                            <div class="form-group"><label>Password</label> <input type="password" placeholder="Password" class="form-control"></div>
                            <div>
                                <button class="btn btn-sm btn-primary float-right m-t-n-xs" type="submit"><strong>Log in</strong></button>
                                <label> <input type="checkbox" class="i-checks"> Remember me </label>
                            </div>
                        </form>
                    </div>
                    <div class="col-sm-6"><h4>Not a member?</h4>
                        <p>You can create an account:</p>
                        <p class="text-center">
                            <a href=""><i class="fa fa-sign-in big-icon"></i></a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div> --->

<script type="text/javascript">


    /*funcion encargada de la recuperacion de la contrasena*/
        function datosAcceso(){
            var email = "<cfoutput>#session.cbstorage.usuario.correo#</cfoutput>"
            console.log(email);

            $.post('/index.cfm/login_registro/login/datosCorreo',{
                email : email
            },function(data){
                if(data.ROWCOUNT > 0){
                    emailSendAcceso(email,data.DATA.CORREO[0],data.DATA.PASS[0]);
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
        function emailSendAcceso(email, user,pass){
        Email.send("GEAE.ESCOM@gmail.com",
            email,
            "Datos de acceso",
            '<h1>Hola!</h1><h2>Los datos de su cuenta en el sistema son usuario: '+ user +' y contraseña: '+pass+' </h2>',
            "smtp.gmail.com",
            "GEAE.ESCOM@gmail.com",
            "GEAE_2018");
        }
        function cambiarContrasena(){
            var cur = $('#cur_pass').val();
            var newp = $('#new_pass').val();
            $('#cur_pass').val('');
            $('#new_pass').val('');
            $.post('/index.cfm/perfilUsuario/perfil/cambiarContrasena',
                {
                    cur: cur,
                    newp : newp
                }, function(data){
                    if(data === 1){
                        swal({
                            title: "Exito",
                            text: "La contraseña ha sido cambiada.",
                            type: "success"
                        });
                    }else{
                        swal({
                            title: "Error",
                            text: "La contraseña ingresada es incorrecta.",
                            type: "error"
                        });
                    }
                    console.log(data);
                    $('#test').html(data);
                    $('#modal-password').modal('toggle');
                });
            
            return false;
            
        }
        function cambiarDatosPerfil(){
            var nombre = $('#nombre').val();
            var apaterno = $('#apaterno').val();
            var amaterno = $('#amaterno').val();
            var genero;
            if($('#inlineRadio1').prop('checked')){
                genero = 1;
            }
            else{
                genero = 2;
            }
            var pass = $('#pass_confirm').val();
            $.post('/index.cfm/perfilUsuario/perfil/cambiarDatosPerfil',
                {
                    nombre : nombre,
                    apaterno : apaterno,
                    amaterno : amaterno,
                    genero: genero,
                    password : pass
                },function(data){
                    if(data == 1){
                        swal({
                            title: "Exito",
                            text: "Se han cambiado los datos del perfil",
                            type: "success",
                            //showCancelButton: true,
                            // confirmButtonColor: "#DD6B55",
                            confirmButtonText: "Aceptar"
                            //closeOnConfirm: false
                            }, function () {
                                location.reload();
                                // swal("Deleted!", "Your imaginary file has been deleted.", "success");
                        });
                    }else{
                        swal({
                            title: "Error",
                            text: "La contraseña ingresada es incorrecta.",
                            type: "error"
                        });
                    }
                });
            console.log('se cambiaran los datos de perfil');
            return false;
        }

        function eliminarCuenta(){
            swal({
                    title: "Exito",
                    text: "¿Desea eliminar su cuenta?",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    cancelButtonText: "Cancelar",
                    confirmButtonText: "Eliminar cuenta"
                    //closeOnConfirm: false
                }, function () {
                    $.post('/index.cfm/perfilUsuario/perfil/eliminarCuenta',{},function(data){
                      location.reload();  
                    });
                    
                });
        }
</script>

<!---- Referencia ---->
 <!--- <div align="right">
                                <button class="btn btn-primary" text-right><i class="fa fa-edit" aria-hidden="true"></i> Editar</button>
                            </div> --->