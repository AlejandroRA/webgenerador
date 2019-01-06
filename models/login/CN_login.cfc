/*
* =========================================================================
* IPN - ESCOM
* Trabajo Terminal
* Modulo: Principal
* Sub modulo: Registro principal
* Fecha: Agosto 18, 2018
* Descripcion: Logica de Negocio de usuarios
* Autor: Lucia Ramirez
* =========================================================================
*/
component extends="coldbox.system.EventHandler"{
	property name="daoLogin" inject="/login/DAO_login";
	

	/*Inicializador del componente*/
	function init(){
		return this;
	}

	/*Registras nuevo usuario*/
	function registrarUsuario(nombre, apaterno, amaterno, correo, password, genero){
		/*El resultado del procedure es el siguiente*/
		/*0 -> error al insertar el usuario*/
		/*1 -> si el usuario fue registrado correctamente*/
		/*2 -> el usuario ha sido registrado con anterioridad*/
		/*3 -> hay un usuario activo*/
		return daoLogin.registrarUsuario(nombre, apaterno, amaterno, correo, password, genero);
	}

	function datosCorreo(email){
		return daoLogin.datosCorreo(email);
	}

	function iniciarSesion(email, password){
		return daoLogin.iniciarSesion(email, password);
	}

	function activarUsuario(id){
		return daoLogin.activarUsuario(id);
	}





}