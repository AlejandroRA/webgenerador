/*
* =========================================================================
* IPN - ESCOM
* Trabajo Terminal
* Modulo: Principal
* Sub modulo: Registro principal
* Fecha: Agosto 18, 2018
* Descripcion: Handler de Usuario
* Autor: Lucia Ramirez
* =========================================================================
*/
component extends="coldbox.system.EventHandler"{

	property name="cnLogin" inject="/login/CN_login";


	/*Funcion para cargar la vista del registro*/
	function registrarUsuario(event,rc,prc){
		event.setView('login/registro').noLayout();

	}
	/*Funcion para agregar usuario CN/DAO*/
	function agregarUsuario(event, rc, prc){
		
		var resultado = 0;
		resultado = cnLogin.registrarUsuario(rc.nombre, rc.apaterno, rc.amaterno, rc.email, rc.password, rc.genero);
		prc.resultado = resultado;
		/*Se redirije hacia el inicio de la aplicacion para el nuevo ingreso del usuario*/
		prc.direccion = '/index.cfm/main/index';
		prc.email = rc.email;
		prc.password = rc.password;
		event.setView("redireccion/control").noLayout();
	}

	/*Funcion para mostrar vista de la contraseña olvidada*/
	function contrasenaOlvidada(event, rc, prc){
		event.setView("/login/contrasena_olvidada").noLayout();
	}

	/*Funcion para devolver datos del correo*/
	function datosCorreo(event, rc, prc){

		resultado = cnLogin.datosCorreo(rc.email);
		event.renderData( type="json", data=resultado );

	}

	function inicio(event,rc,prc){
		event.setView(view="/geae/inicio", layout="Main");
	}

	function iniciarSesion(event, rc, prc){
		if(structKeyExists(rc,"email")){

			resultado = cnLogin.iniciarSesion(rc.email, rc.password);
			if(resultado.recordCount > 0){
				session.cbstorage.usuario = resultado;
				/*Se activa el usuario en casao de haber sido eliminado*/
				if(session.cbstorage.usuario.estado NEQ 1){
					cnLogin.activarUsuario(session.cbstorage.usuario.id);
					getInstance( "MessageBox@cbmessagebox" ).setMessage("info","Su cuenta de usuario ha sido activada");
				}
				
				runEvent("Main.inicio");
			}else{
				getInstance( "MessageBox@cbmessagebox" ).setMessage("error","El usuario o contrase&ntilde;a es incorrecto");
				runEvent("Main.index");
			}

		}else{
			runEvent("Main.index");
		}
		
	}


}