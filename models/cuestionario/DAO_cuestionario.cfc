/*
* =========================================================================
* IPN - ESCOM
* Trabajo Terminal
* Modulo: Principal
* Sub modulo: Registro principal
* Fecha: Agosto 18, 2018
* Descripcion: Acceso a la base de datos de cuesttionario
* Autor: Lucia Ramirez
* =========================================================================
*/
component extends="coldbox.system.EventHandler"{
	
	/*Inicializador del componente*/
	function init(){
		return this;
	}

	/*Consultar todos los cuestionarios asociados con un usuario*/
	function consultarCuestionarios(id_usuario){
		var spService = new storedproc(); 
		spService.setDatasource("DS_TT"); 
		spService.setProcedure("PKG_CUESTIONARIO.sel_cuestionario"); 
		spService.addParam(null=true, cfsqltype="cf_sql_numeric",type="in"); 
		spService.addParam(cfsqltype="cf_sql_numeric", type="in",value=id_usuario); 
		spService.addProcResult(name="cursor",resultset=1);
		spService.addParam(cfsqltype="cf_sql_numeric",type="out",variable="bandera"); 
		result = spService.execute();
		//return result.getprocOutVariables().bandera; ;
		return result.getProcResultSets().cursor;
	}

	function registrarCuestionario(id, nombre, descripcion, fecha, clave){
		var spService = new storedproc(); 
		spService.setDatasource("DS_TT"); 
		spService.setProcedure("PKG_CUESTIONARIO.ins_cuestionario"); 
		//spService.addParam(null=true, cfsqltype="cf_sql_numeric",type="in"); 
		spService.addParam(cfsqltype="cf_sql_numeric", type="in",value=id); 
		spService.addParam(cfsqltype="cf_sql_varchar", type="in",value=nombre); 
		spService.addParam(cfsqltype="cf_sql_varchar", type="in",value=descripcion); 
		spService.addParam(cfsqltype="CF_SQL_DATE", type="in",value=fecha); 
		spService.addParam(cfsqltype="cf_sql_varchar", type="in",value=clave); 
		//spService.addProcResult(name="cursor",resultset=1);
		spService.addParam(cfsqltype="cf_sql_numeric",type="out",variable="bandera"); 
		result = spService.execute();
		return result.getprocOutVariables().bandera; ;
		//return result.getProcResultSets().cursor;

	}

	/*Consultar todos los cuestionarios asociados con un usuario*/
	function consultarCuestionario(id, usuario){
		var spService = new storedproc(); 
		spService.setDatasource("DS_TT"); 
		spService.setProcedure("PKG_CUESTIONARIO.sel_cuestionario"); 
		
		spService.addParam(cfsqltype="cf_sql_numeric",type="in", value=id); 

		spService.addParam(cfsqltype="cf_sql_numeric", type="in",value=usuario); 
		spService.addProcResult(name="cursor",resultset=1);
		spService.addParam(cfsqltype="cf_sql_numeric",type="out",variable="bandera"); 
		result = spService.execute();
		//return result.getprocOutVariables().bandera; ;
		return result.getProcResultSets().cursor;
	}

	function editarDatosGenerales(id,cuestionario,nombre, descripcion, fecha, clave){
		// writeDump(arguments);
		// abort;
		var spService = new storedproc(); 
		spService.setDatasource("DS_TT"); 
		spService.setProcedure("PKG_CUESTIONARIO.upd_cuestionario"); 
		spService.addParam(cfsqltype="cf_sql_numeric", type="in",value=cuestionario); 
		spService.addParam(cfsqltype="cf_sql_numeric", type="in",value=id); 
		spService.addParam(cfsqltype="cf_sql_varchar", type="in",value=nombre); 
		spService.addParam(cfsqltype="cf_sql_varchar", type="in",value=descripcion); 
		spService.addParam(cfsqltype="CF_SQL_DATE", type="in",value=fecha);
		spService.addParam(null=true,cfsqltype="cf_sql_numeric", type="in");
		spService.addParam(cfsqltype="cf_sql_varchar", type="in",value=clave); 
		//spService.addProcResult(name="cursor",resultset=1);
		spService.addParam(cfsqltype="cf_sql_numeric",type="out",variable="bandera"); 
		result = spService.execute();
		return result.getprocOutVariables().bandera; ;
	}

	function obtenerPreguntaClase(cuestionario, clase){
		var spService = new storedproc(); 
		spService.setDatasource("DS_TT"); 
		spService.setProcedure("pkg_pregunta.sel_preguntas"); 
		spService.addParam(null=true, cfsqltype="cf_sql_numeric", type="in"); 
		spService.addParam(cfsqltype="cf_sql_numeric", type="in",value=cuestionario); 
		spService.addParam(cfsqltype="cf_sql_varchar", type="in",value=clase); 
		spService.addProcResult(name="cursor",resultset=1);
		spService.addParam(cfsqltype="cf_sql_numeric",type="out",variable="bandera"); 
		result = spService.execute();
		return result.getProcResultSets().cursor;

	}

	function obtenerTipos(cuestionario, clase){
		var spService = new storedproc(); 
		spService.setDatasource("DS_TT"); 
		spService.setProcedure("pkg_pregunta.sel_tipos"); 
		spService.addProcResult(name="cursor",resultset=1);
		spService.addParam(cfsqltype="cf_sql_numeric",type="out",variable="bandera"); 
		result = spService.execute();
		return result.getProcResultSets().cursor;

	}

	function agregarPregunta(cuestionario,descripcion, tipo, clase, obligado, orden){
		// writeDump(arguments);
		// abort;
		var spService = new storedproc(); 
		spService.setDatasource("DS_TT"); 
		spService.setProcedure("pkg_pregunta.ins_pregunta"); 
		//spService.addParam(null=true, cfsqltype="cf_sql_numeric",type="in"); 
		spService.addParam(cfsqltype="cf_sql_numeric", type="in",value=cuestionario); 
		spService.addParam(cfsqltype="cf_sql_varchar", type="in",value=descripcion); 
		spService.addParam(cfsqltype="cf_sql_numeric", type="in",value=tipo); 
		spService.addParam(cfsqltype="cf_sql_numeric", type="in",value=clase); 
		
		spService.addParam(cfsqltype="cf_sql_numeric", type="in",value=orden); 
		spService.addParam(cfsqltype="cf_sql_numeric", type="in",value=obligado);
	
		//spService.addProcResult(name="cursor",resultset=1);
		spService.addParam(cfsqltype="cf_sql_numeric",type="out",variable="bandera"); 
		result = spService.execute();
		return result.getprocOutVariables().bandera; ;
		//return result.getProcResultSets().cursor;
	}

	function eliminarCuestionario(usuario,cuestionario){
		var cero = 0;
		var spService = new storedproc(); 
		spService.setDatasource("DS_TT"); 
		spService.setProcedure("PKG_CUESTIONARIO.upd_cuestionario"); 
		spService.addParam(cfsqltype="cf_sql_numeric", type="in",value=cuestionario); 
		spService.addParam(cfsqltype="cf_sql_numeric", type="in",value=usuario); 
		spService.addParam(null=true, cfsqltype="cf_sql_varchar", type="in"); 
		spService.addParam(null=true, cfsqltype="cf_sql_varchar", type="in"); 
		spService.addParam(null=true, cfsqltype="CF_SQL_DATE", type="in");
		spService.addParam(cfsqltype="cf_sql_numeric", type="in",value=cero);
		spService.addParam(null=true, cfsqltype="cf_sql_varchar", type="in"); 
		//spService.addProcResult(name="cursor",resultset=1);
		spService.addParam(cfsqltype="cf_sql_numeric",type="out",variable="bandera"); 
		result = spService.execute();
		return result.getprocOutVariables().bandera; ;
	}

	function eliminarPregunta(pregunta,cuestionario){
		var cero = 0;
		var spService = new storedproc(); 
		spService.setDatasource("DS_TT"); 
		spService.setProcedure("pkg_pregunta.upd_pregunta"); 
		spService.addParam(cfsqltype="cf_sql_numeric", type="in",value=pregunta); 
		spService.addParam(cfsqltype="cf_sql_numeric", type="in",value=cuestionario);
		spService.addParam(null=true, cfsqltype="cf_sql_varchar", type="in");  
		spService.addParam(null=true, cfsqltype="cf_sql_numeric", type="in"); 
		spService.addParam(null=true, cfsqltype="cf_sql_numeric", type="in"); 
		spService.addParam(null=true, cfsqltype="cf_sql_numeric", type="in"); 
		spService.addParam(null=true, cfsqltype="cf_sql_numeric", type="in"); 
		spService.addParam(null=true, cfsqltype="cf_sql_numeric", type="in"); 
		spService.addParam(cfsqltype="cf_sql_numeric", type="in", value=cero); 
		spService.addParam(null=true, cfsqltype="cf_sql_varchar", type="in"); 
		spService.addParam(cfsqltype="cf_sql_numeric",type="out",variable="bandera"); 
		result = spService.execute();
		return result.getprocOutVariables().bandera; ;
	}

	function obtenerPregunta(pregunta){
		var spService = new storedproc(); 
		spService.setDatasource("DS_TT"); 
		spService.setProcedure("pkg_pregunta.sel_u_pregunta"); 
		spService.addParam(cfsqltype="cf_sql_numeric", type="in",value=pregunta); 
		spService.addProcResult(name="cursor",resultset=1);
		spService.addParam(cfsqltype="cf_sql_numeric",type="out",variable="bandera"); 
		result = spService.execute();
		return result.getProcResultSets().cursor;

	}

	function obtenerOpciones(pregunta){
		var spService = new storedproc(); 
		spService.setDatasource("DS_TT"); 
		spService.setProcedure("pkg_opcion.sel_opcion"); 
		spService.addParam(null=true, cfsqltype="cf_sql_numeric", type="in"); 
		spService.addParam(cfsqltype="cf_sql_numeric", type="in",value=pregunta); 
		spService.addProcResult(name="cursor",resultset=1);
		spService.addParam(cfsqltype="cf_sql_numeric",type="out",variable="bandera"); 
		result = spService.execute();
		return result.getProcResultSets().cursor;
	}

	function actualizarTamano(pregunta, tamano){
		var cero = 0;
		var spService = new storedproc(); 
		spService.setDatasource("DS_TT"); 
		spService.setProcedure("pkg_pregunta.upd_pregunta"); 
		spService.addParam(cfsqltype="cf_sql_numeric", type="in",value=pregunta); 
		spService.addParam(null=true, cfsqltype="cf_sql_numeric", type="in");
		spService.addParam(null=true, cfsqltype="cf_sql_varchar", type="in");  
		spService.addParam(null=true, cfsqltype="cf_sql_numeric", type="in"); 
		spService.addParam(null=true, cfsqltype="cf_sql_numeric", type="in"); 
		spService.addParam(null=true, cfsqltype="cf_sql_numeric", type="in"); 
		spService.addParam(null=true, cfsqltype="cf_sql_numeric", type="in"); 
		spService.addParam(cfsqltype="cf_sql_numeric", type="in", value=tamano); 
		spService.addParam(null=true, cfsqltype="cf_sql_numeric", type="in"); 
		spService.addParam(null=true, cfsqltype="cf_sql_varchar", type="in"); 
		spService.addParam(cfsqltype="cf_sql_numeric",type="out",variable="bandera"); 
		result = spService.execute();
		return result.getprocOutVariables().bandera; ;
	}

	function actualizarRango(pregunta, rango){
		var spService = new storedproc(); 
		spService.setDatasource("DS_TT"); 
		spService.setProcedure("pkg_pregunta.upd_pregunta"); 
		spService.addParam(cfsqltype="cf_sql_numeric", type="in",value=pregunta); 
		spService.addParam(null=true, cfsqltype="cf_sql_numeric", type="in");
		spService.addParam(null=true, cfsqltype="cf_sql_varchar", type="in");  
		spService.addParam(null=true, cfsqltype="cf_sql_numeric", type="in"); 
		spService.addParam(null=true, cfsqltype="cf_sql_numeric", type="in"); 
		spService.addParam(null=true, cfsqltype="cf_sql_numeric", type="in"); 
		spService.addParam(null=true, cfsqltype="cf_sql_numeric", type="in"); 
		spService.addParam(null=true, cfsqltype="cf_sql_numeric", type="in"); 
		spService.addParam(null=true, cfsqltype="cf_sql_numeric", type="in"); 
		spService.addParam(cfsqltype="cf_sql_varchar", type="in", value=rango); 
		spService.addParam(cfsqltype="cf_sql_numeric",type="out",variable="bandera"); 
		result = spService.execute();
		return result.getprocOutVariables().bandera; ;
	}

	function obtenerOpcion(opcion){
		var spService = new storedproc(); 
		spService.setDatasource("DS_TT"); 
		spService.setProcedure("pkg_opcion.sel_opcion"); 
		spService.addParam(cfsqltype="cf_sql_numeric", type="in", value=opcion); 
		spService.addParam(null=true, cfsqltype="cf_sql_numeric", type="in"); 
		spService.addProcResult(name="cursor",resultset=1);
		spService.addParam(cfsqltype="cf_sql_numeric",type="out",variable="bandera"); 
		result = spService.execute();
		return result.getProcResultSets().cursor;
	}

	function agregarOpcion(pregunta, descripcion, orden){
		var spService = new storedproc(); 
		spService.setDatasource("DS_TT"); 
		spService.setProcedure("pkg_opcion.ins_opcion"); 
		spService.addParam(cfsqltype="cf_sql_numeric", type="in", value=pregunta); 
		spService.addParam(cfsqltype="cf_sql_varchar", type="in", value=descripcion); 
		spService.addParam(cfsqltype="cf_sql_numeric", type="in", value=orden); 
		spService.addParam(cfsqltype="cf_sql_numeric",type="out",variable="bandera"); 
		result = spService.execute();
		return result.getprocOutVariables().bandera; ;
	}

	function editarOpcion(opcion, descripcion, orden){
		var spService = new storedproc(); 
		spService.setDatasource("DS_TT"); 
		spService.setProcedure("pkg_opcion.upd_opcion"); 
		spService.addParam(cfsqltype="cf_sql_numeric", type="in", value=opcion); 
		spService.addParam(cfsqltype="cf_sql_varchar", type="in", value=descripcion); 
		spService.addParam(cfsqltype="cf_sql_numeric", type="in", value=orden);
		spService.addParam(null = true, cfsqltype="cf_sql_numeric", type="in");
		spService.addParam(cfsqltype="cf_sql_numeric",type="out",variable="bandera"); 
		result = spService.execute();
		return result.getprocOutVariables().bandera; ;
	}

	function genCuestionario(usuario, cuestionario, clase){
		var spService = new storedproc(); 
		spService.setDatasource("DS_TT"); 
		spService.setProcedure("pkg_consultas.gen_cuestionario"); 
		spService.addParam(cfsqltype="cf_sql_numeric", type="in",value=usuario); 
		spService.addParam(cfsqltype="cf_sql_numeric", type="in",value=cuestionario); 
		spService.addParam(cfsqltype="cf_sql_numeric", type="in",value=clase); 
		spService.addProcResult(name="cursor",resultset=1);
		spService.addParam(cfsqltype="cf_sql_numeric",type="out",variable="bandera"); 
		result = spService.execute();
		return result.getProcResultSets().cursor;
	}

	function eliminarOpcion(opcion){
		var spService = new storedproc(); 
		spService.setDatasource("DS_TT"); 
		spService.setProcedure("pkg_opcion.upd_opcion"); 
		spService.addParam(cfsqltype="cf_sql_numeric", type="in", value=opcion); 
		spService.addParam(null = true,cfsqltype="cf_sql_varchar", type="in"); 
		spService.addParam(null = true,cfsqltype="cf_sql_numeric", type="in");
		spService.addParam( cfsqltype="cf_sql_numeric", type="in", value=0);
		spService.addParam(cfsqltype="cf_sql_numeric",type="out",variable="bandera"); 
		result = spService.execute();
		return result.getprocOutVariables().bandera; ;
	}

	/*Consultar todos los cuestionarios asociados con un usuario*/
	function consultarCuestionarioCaptura(id){
		var spService = new storedproc(); 
		spService.setDatasource("DS_TT"); 
		spService.setProcedure("PKG_CUESTIONARIO.sel_cuestionario"); 
		spService.addParam(cfsqltype="cf_sql_numeric",type="in", value=id); 
		spService.addParam(null=true, cfsqltype="cf_sql_numeric", type="in"); 
		spService.addProcResult(name="cursor",resultset=1);
		spService.addParam(cfsqltype="cf_sql_numeric",type="out",variable="bandera"); 
		result = spService.execute();
		//return result.getprocOutVariables().bandera; ;
		return result.getProcResultSets().cursor;
	}

	function getCuestionario(cuestionario, clase){
		var spService = new storedproc(); 
		spService.setDatasource("DS_TT"); 
		spService.setProcedure("pkg_consultas.gen_cuestionario"); 
		spService.addParam(null=true,cfsqltype="cf_sql_numeric", type="in"); 
		spService.addParam(cfsqltype="cf_sql_numeric", type="in",value=cuestionario); 
		spService.addParam(cfsqltype="cf_sql_numeric", type="in",value=clase); 
		spService.addProcResult(name="cursor",resultset=1);
		spService.addParam(cfsqltype="cf_sql_numeric",type="out",variable="bandera"); 
		result = spService.execute();
		return result.getProcResultSets().cursor;
	}


	



}