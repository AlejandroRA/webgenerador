/*
* =========================================================================
* IPN - ESCOM
* Trabajo Terminal
* Modulo: Principal
* Sub modulo: Registro principal
* Fecha: Agosto 18, 2018
* Descripcion: Logica de negocio relacionado con los datos relacionados con el perfil
* Autor: Lucia Ramirez
* =========================================================================
*/
component extends="coldbox.system.EventHandler"{
	property name="daoPerfil" inject="/perfil/DAO_perfil";
	property name="daoLogin" inject="/login/DAO_login";
	
	

	/*Inicializador del componente*/
	function init(){
		return this;
	}

	function cambiarContrasena(correo, curpassword, newpassword){
		resultado = daoLogin.iniciarSesion(correo, curpassword);
		if(resultado.RECORDCOUNT > 0){
			resultado = daoPerfil.cambiarContrasena(session.cbstorage.usuario.id, newpassword);
			return resultado;
		}else{
			return 2;
		}

	}

	function cambiarDatosPerfil(nombre, apaterno, amaterno, genero, password){
		resultado = daoLogin.iniciarSesion(session.cbstorage.usuario.correo, password);
		if(resultado.RECORDCOUNT > 0){
			resultado = daoPerfil.cambiarDatosPerfil(session.cbstorage.usuario.id,nombre, apaterno, amaterno, genero);
			return resultado;
		}else{
			return 2;
		}
	}

	function eliminarCuenta(id){
		return daoPerfil.eliminarCuenta(id);
		
	}




}