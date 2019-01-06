/*
* =========================================================================
* IPN - ESCOM
* Trabajo Terminal
* Modulo: Principal
* Sub modulo: Registro principal
* Fecha: Agosto 18, 2018
* Descripcion: Acceso a la base de datos de usuario
* Autor: Lucia Ramirez
* =========================================================================
*/
component extends="coldbox.system.EventHandler"{
	
	/*Inicializador del componente*/
	function init(){
		return this;
	}

	/*Registrar un nuevo usuario*/
	function registrarUsuario(nombre, apaterno, amaterno, correo, password, genero){
		var spService = new storedproc(); 
		spService.setDatasource("DS_TT"); 
		spService.setProcedure("PKG_USUARIO.nuevo_usuario"); 
		spService.addParam(cfsqltype="cf_sql_varchar", type="in",value=nombre); 
		spService.addParam(cfsqltype="cf_sql_varchar",type="in",value=apaterno); 
		spService.addParam(cfsqltype="cf_sql_varchar", type="in",value=amaterno); 
		spService.addParam(cfsqltype="cf_sql_varchar", type="in",value=correo); 
		spService.addParam(cfsqltype="cf_sql_varchar", type="in",value=password); 
		spService.addParam(cfsqltype="cf_sql_numeric", type="in",value=genero); 
		spService.addParam(cfsqltype="cf_sql_numeric",type="out",variable="bandera"); 
		result = spService.execute();
		return result.getprocOutVariables().bandera; ;
	}

	function datosCorreo(email){
		var spService = new storedproc(); 
		spService.setDatasource("DS_TT"); 
		spService.setProcedure("PKG_USUARIO.sel_usuario_correo"); 
		spService.addParam(cfsqltype="cf_sql_varchar", type="in",value=email); 
		spService.addProcResult(name="cursor",resultset=1); 
		spService.addParam(cfsqltype="cf_sql_numeric",type="out",variable="bandera"); 
		result = spService.execute();
		return result.getProcResultSets().cursor;
	}
	/*retorna los datos del usuario*/
	function iniciarSesion(email, password){
		var spService = new storedproc(); 
		spService.setDatasource("DS_TT"); 
		spService.setProcedure("PKG_USUARIO.sel_usuario"); 
		spService.addParam(cfsqltype="cf_sql_varchar", type="in",value=email); 
		spService.addParam(cfsqltype="cf_sql_varchar", type="in",value=password); 
		spService.addProcResult(name="cursor",resultset=1); 
		spService.addParam(cfsqltype="cf_sql_numeric",type="out",variable="bandera"); 
		result = spService.execute();
		return result.getProcResultSets().cursor;
	}

	function activarUsuario(id){
		var spService = new storedproc(); 
		
		spService.setDatasource("DS_TT"); 
		spService.setProcedure("PKG_USUARIO.act_usuario"); 
		spService.addParam(cfsqltype="cf_sql_varchar", type="in",value=id); 	 
		spService.addParam(cfsqltype="cf_sql_numeric",type="out",variable="bandera"); 
		result = spService.execute();
		return result.getprocOutVariables().bandera; 
	}



}