/*
* =========================================================================
* IPN - ESCOM
* Trabajo Terminal
* Modulo: Principal
* Sub modulo: Registro principal
* Fecha: Agosto 18, 2018
* Descripcion: Acceso a la base de datos para la modificacion de datos relacionados con el perfil
* Autor: Lucia Ramirez
* =========================================================================
*/
component extends="coldbox.system.EventHandler"{
	
	/*Inicializador del componente*/
	function init(){
		return this;
	}

	/*Cambiar contraseña del perfil de usuario*/
	function cambiarContrasena(id,password){
		var spService = new storedproc(); 
		
		spService.setDatasource("DS_TT"); 
		spService.setProcedure("PKG_USUARIO.upd_usuario"); 
		spService.addParam(cfsqltype="cf_sql_varchar", type="in",value=id); 	
		spService.addParam(null=true, cfsqltype="cf_sql_varchar", type="in"); 
		spService.addParam(null=true, cfsqltype="cf_sql_varchar", type="in"); 
		spService.addParam(null=true, cfsqltype="cf_sql_varchar", type="in"); 
		spService.addParam(null=true, cfsqltype="cf_sql_varchar", type="in"); 
		spService.addParam(cfsqltype="cf_sql_varchar", type="in",value=password); 
		spService.addParam(null=true, cfsqltype="cf_sql_numeric", type="in"); 
		spService.addParam(cfsqltype="cf_sql_numeric",type="out",variable="bandera"); 
		result = spService.execute();
		return result.getprocOutVariables().bandera; 
	}

	/*Cambiar contraseña del perfil de usuario*/
	function cambiarDatosPerfil(id, nombre, apaterno, amaterno, genero){
		var spService = new storedproc(); 
		
		spService.setDatasource("DS_TT"); 
		spService.setProcedure("PKG_USUARIO.upd_usuario"); 
		spService.addParam(cfsqltype="cf_sql_varchar", type="in",value=id); 	
		spService.addParam(cfsqltype="cf_sql_varchar", type="in",value=nombre); 
		spService.addParam(cfsqltype="cf_sql_varchar", type="in",value=apaterno); 
		spService.addParam(cfsqltype="cf_sql_varchar", type="in",value=amaterno); 
		spService.addParam(null=true, cfsqltype="cf_sql_varchar", type="in"); 
		spService.addParam(null=true, cfsqltype="cf_sql_varchar", type="in"); 
		spService.addParam(cfsqltype="cf_sql_numeric", type="in",value=genero); 
		spService.addParam(cfsqltype="cf_sql_numeric",type="out",variable="bandera"); 
		result = spService.execute();
		return result.getprocOutVariables().bandera; 
	}

	/*Cambiar contraseña del perfil de usuario*/
	function eliminarCuenta(id){
		var spService = new storedproc(); 
		
		spService.setDatasource("DS_TT"); 
		spService.setProcedure("PKG_USUARIO.del_usuario"); 
		spService.addParam(cfsqltype="cf_sql_varchar", type="in",value=id); 	 
		spService.addParam(cfsqltype="cf_sql_numeric",type="out",variable="bandera"); 
		result = spService.execute();
		return result.getprocOutVariables().bandera; 
	}

	




}