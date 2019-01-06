component extends="coldbox.system.EventHandler"{
	property name="cnPerfil" inject="/perfil/CN_perfil";
	property name="cnLogin" inject="/login/CN_login";
	
	// Default Action
	function index(event,rc,prc){

		prc.usuario = session.cbstorage.usuario;
		event.setView("/geae/perfil");
	}

	/*Cambiar contraseña del perfil de usuario*/
	/*
		valor -> 0: Error en la ejecucion del query
		valor -> 1: OK
		valor -> 2: Contraseña original erronea
	*/
	function cambiarContrasena(event, rc, prc){
		resultado = cnPerfil.cambiarContrasena(session.cbstorage.usuario.correo, rc.cur, rc.newp);
		event.renderData(type="json", data=resultado);
	}
	/*Cambiar datos de perfil de usuario*/

	function cambiarDatosPerfil(event, rc, prc){
		
		resultado = cnPerfil.cambiarDatosPerfil(rc.nombre, rc.apaterno, rc.amaterno, rc.genero, rc.password);
		if(resultado  eq 1){
        	/*Se actualiza con los nuevos datos del sistema*/
			session.cbstorage.usuario = cnLogin.iniciarSesion(session.cbstorage.usuario.correo, rc.password);
		}
		event.renderData(type="json", data = resultado);
	}

	function eliminarCuenta(event, rc, prc){
		resultado = cnPerfil.eliminarCuenta(session.cbstorage.usuario.id);
		/*Se elimina el usuario registrado*/
		getInstance( "MessageBox@cbmessagebox" ).setMessage("info","Su cuenta ha sido desactivada");
		StructDelete(session, "cbstorage",true);
		//runEvent("Main.index");
		return resultado;
	}
}