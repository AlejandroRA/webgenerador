/*
* =========================================================================
* IPN - ESCOM
* Trabajo Terminal
* Modulo: Principal
* Sub modulo: Registro principal
* Fecha: Agosto 18, 2018
* Descripcion: Logica de Negocio de cuestionarios
* Autor: Lucia Ramirez
* =========================================================================
*/
component extends="coldbox.system.EventHandler"{
	property name="daoCuestionario" inject="/cuestionario/DAO_cuestionario";
	

	/*Inicializador del componente*/
	function init(){
		return this;
	}

	/*Registras nuevo usuario*/
	function consultarCuestionarios(id_usuario){
		return daoCuestionario.consultarCuestionarios(id_usuario);
	}

	function registrarCuestionario(id, nombre, descripcion, fecha, clave){
		return daoCuestionario.registrarCuestionario(id, nombre, descripcion, fecha, clave);
	}

	function consultarCuestionario(id, usuario){
		return daoCuestionario.consultarCuestionario(id, usuario);
	}

	function editarDatosGenerales(id,cuestionario,nombre, descripcion, fecha, clave){
		return daoCuestionario.editarDatosGenerales(id,cuestionario,nombre, descripcion, fecha, clave);
	}

	function obtenerPreguntaClase(cuestionario, clase){
		return daoCuestionario.obtenerPreguntaClase(cuestionario, clase);
	}

	function obtenerTipos(){
		return daoCuestionario.obtenerTipos();
	}

	function agregarPregunta(cuestionario,descripcion, tipo, clase, obligado, orden){

		return daoCuestionario.agregarPregunta(cuestionario,descripcion, tipo, clase, obligado, orden);
	}

	function eliminarCuestionario(usuario, cuestionario){
		return daoCuestionario.eliminarCuestionario(usuario, cuestionario);
	}

	function eliminarPregunta(pregunta, cuestionario){
		return daoCuestionario.eliminarPregunta(pregunta, cuestionario);
	}

	function obtenerPregunta(pregunta){
		return daoCuestionario.obtenerPregunta(pregunta);
	}

	function obtenerOpciones(pregunta){
		return daoCuestionario.obtenerOpciones(pregunta);
	}

	function obtenerConfiguracionPregunta(pregunta){
		/*Se obtienen datos generales*/
		res = structNew();
		res.resultado = obtenerPregunta(pregunta); 
		var vista = arrayNew(1);
		vista.append("/preguntas/tamano");
		vista.append("/preguntas/opciones");
		vista.append("/preguntas/rango");
		

		
		/*
		    1- abierta
		    2- opciones
		    3- rango
		*/
		if(res.resultado.tipo_p EQ 2){
			res.config = obtenerOpciones(pregunta);
		}
		res.vista = vista[res.resultado.tipo_p];
		/*asignacion de la vista a mostrar*/

		return res;

	}

	function actualizarTamano(pregunta, tamano){

		return daoCuestionario.actualizarTamano(pregunta, tamano);

	}

	function actualizarRango(pregunta, rango){
		return daoCuestionario.actualizarRango(pregunta, rango);
	}

	function obtenerOpcion(opcion){
		return daoCuestionario.obtenerOpcion(opcion);
	}

	function agregarOpcion(pregunta, descripcion, orden){
		return daoCuestionario.agregarOpcion(pregunta, descripcion, orden);
	}

	function editarOpcion(opcion, descricion, orden){
		return daoCuestionario.editarOpcion(opcion, descricion, orden);
	}

	function genCuestionario(usuario, cuestionario){
		/*Se obtiene primero el formulario de acceso*/
		var respuesta = structNew();
		respuesta['formulario'] = daoCuestionario.genCuestionario(usuario, cuestionario, 1);
		respuesta['cuestionario'] = daoCuestionario.genCuestionario(usuario, cuestionario, 2);
		return respuesta;
		
	}

	function eliminarOpcion(opcion){
		return daoCuestionario.eliminarOpcion(opcion);
	}

	function consultarCuestionarioCaptura( id){
		return daoCuestionario.consultarCuestionarioCaptura(id);
	}

	function generateString(){
		var res = "";
		for(i = 0; i <= 6; i++){
			res = res&Chr(RandRange(65, 90));
		}
		return res;
	}

	function getCuestionario( cuestionario){
		/*Se obtiene primero el formulario de acceso*/
		var respuesta = structNew();
		respuesta['formulario'] = daoCuestionario.getCuestionario( cuestionario, 1);
		respuesta['cuestionario'] = daoCuestionario.getCuestionario( cuestionario, 2);
		return respuesta;
		
	}

	function captura(id, captcha_from, captcha_to, clave){
		var respuesta = structNew(); 
		respuesta.cuestionario = consultarCuestionarioCaptura(id);
		if(captcha_from neq captcha_to){
			respuesta.estado = 2; 
		}else if(clave neq respuesta.cuestionario.contrasena){
			respuesta.estado = 3;
		}else{
			respuesta.estado = 1;
			respuesta.pregunta = getCuestionario(id);
		}

		return respuesta;


	}

	function guardaRespuesta(valores){
		var formulario = valores['formularios'];
		var cuestionario = valores['cuestionarios'];
		var usuario = daoCuestionario.generarUser();
		for(i = 1; i <= arrayLen(formulario);i++){
			daoCuestionario.guardaRes(formulario[i].id,usuario, formulario[i].respuesta)
		}
		for(i = 1; i <= arrayLen(cuestionario);i++){
			daoCuestionario.guardaRes(cuestionario[i].id,usuario, cuestionario[i].respuesta)
		}
		
		return 1;
	}
		

	



}