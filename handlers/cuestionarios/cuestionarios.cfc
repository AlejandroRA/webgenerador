component extends="coldbox.system.EventHandler"{
	property name="cnPerfil" inject="/perfil/CN_perfil";
	property name="cnLogin" inject="/login/CN_login";
	property name="cnCuestionarios" inject="/cuestionario/CN_cuestionario";
	
	
	// Default Action
	function index(event,rc,prc){

	///	prc.cuestionarios = session.cbstorage.usuario;
	/*esto es temporal*/
		//event.setView("/cuestionarios/cuestionarios");
		event.setView("/cuestionarios/cuestionariosCatalogo");

	}

	function consultarCuestionario(event, rc, prc){
		prc.cuestionarios = cnCuestionarios.consultarCuestionarios(session.cbstorage.usuario.id);
		event.setView("/cuestionarios/tabla_cuestionarios").noLayout();
	}
	function nuevoCuestionario(event, rc, prc){
		event.setView("/cuestionarios/nuevo_cuestionario").noLayout();
	}

	function registrarCuestionario(event, rc, prc){
		
		resultado = cnCuestionarios.registrarCuestionario(session.cbstorage.usuario.id, rc.nombre, rc.descripcion, rc.fecha, rc.clave);
		event.renderData(type="json", data=resultado);
	}
	function configuracionCuestionario(event, rc, prc){
		prc.cuestionarios = cnCuestionarios.consultarCuestionario( rc.id, session.cbstorage.usuario.id);
		event.setView("/cuestionarios/configuraciones_cuestionario").noLayout();
	}
	function datosGenerales(event,rc, prc){
		prc.cuestionarios = cnCuestionarios.consultarCuestionario( rc.id, session.cbstorage.usuario.id);
		event.setView("/cuestionarios/datosGenerales").noLayout();
	}
	function edicionDatosGenerales(event,rc, prc){
		prc.estado = rc.estado;
		prc.cuestionarios = cnCuestionarios.consultarCuestionario( rc.id, session.cbstorage.usuario.id);
		event.setView("/cuestionarios/edicion_datosGenerales").noLayout();
	}
	function editarDatosGenerales(event, rc, prc){

		resultado = cnCuestionarios.editarDatosGenerales(session.cbstorage.usuario.id, rc.id, rc.nombre, rc.descripcion, rc.fecha, rc.clave);
		event.renderData(type="json", data=resultado);
	}

	function obtenerPreguntaClase(event, rc, prc){
		prc.clase = rc.clase;
		prc.id = rc.id;
		prc.preguntas = cnCuestionarios.obtenerPreguntaClase(rc.id ,rc.clase);
		if(rc.clase eq 1)
		 prc.nombretabla = 'tabla-formulario';
		else
		 prc.nombretabla = 'tabla-cuestionario';
			
		event.setView("/cuestionarios/tablaPreguntas").noLayout();
	}

	function nuevaPregunta(event,rc, prc){
		prc.clase = rc.clase;
		prc.id = rc.id;
		prc.tipos = cnCuestionarios.obtenerTipos();
		event.setView("/cuestionarios/nueva_pregunta").noLayout();
	}
	/*Agrega una nueva pregunta dependiendo de los requerimientos*/
	function agregarPregunta(event, rc, prc){

		resultado = cnCuestionarios.agregarPregunta(rc.cuestionario,rc.descripcion, rc.tipo, rc.clase, rc.obligado, rc.orden);
		event.renderData(type="json", data=resultado);
	}
	/*Funcion necesaria para la eliminacion del cuestionario*/
	function eliminarCuestionario(event, rc, prc){
		//eliminarCuestionario
		resultado = cnCuestionarios.eliminarCuestionario(session.cbstorage.usuario.id, rc.id);
		event.renderData(type="json", data=resultado);	
	}
	/*Funcion necesarioa para la eliminacion de la preguna*/
	function eliminarPregunta(event, rc, prc){
		//eliminarCuestionario
		resultado = cnCuestionarios.eliminarPregunta(rc.pregunta, rc.cuestionario);
		event.renderData(type="json", data=resultado);	
	}

	function obtenerConfiguracionPregunta(event, rc, prc){
		prc.pregunta = rc.pregunta;
		prc.resultado = cnCuestionarios.obtenerConfiguracionPregunta(rc.pregunta);
		event.setView(prc.resultado.vista).noLayout();
	}

	function actualizarTamano(event, rc, prc){
		resultado = cnCuestionarios.actualizarTamano(rc.id, rc.tamano);
		event.renderData(type="json", data=resultado);	
	}
	function actualizarRango(event, rc, prc){
		resultado = cnCuestionarios.actualizarRango(rc.id, rc.rango);
		event.renderData(type="json", data=resultado);	
	}

	function opcionDatos(event, rc, prc){
		prc.id  = rc.id;
		prc.pregunta = rc.pregunta;
		prc.opcion = cnCuestionarios.obtenerOpcion(rc.id);
		event.setView("/preguntas/opcion").noLayout();
	}

	function nuevaOpcion(event, rc, prc){
		prc.pregunta = rc.pregunta;
		event.setView("/preguntas/nueva_opcion").noLayout();
	}

	function agregarOpcion(event, rc, prc){
		resultado = cnCuestionarios.agregarOpcion(rc.pregunta, rc.descripcion,rc.orden)
		event.renderData(type="json", data=resultado);	
	}

	function editarOpcion(event, rc, prc){
		resultado = cnCuestionarios.editarOpcion(rc.opcion, rc.descripcion,rc.orden)
		event.renderData(type="json", data=resultado);	
	}

	function consultarCatalogoCuestionario(event, rc, prc){
		prc.cuestionarios = cnCuestionarios.consultarCuestionarios(session.cbstorage.usuario.id);
		
		event.setView("/cuestionarios/catalogoCuestionario").noLayout();
	}

	function verCuestionario(event, rc, prc){
		prc.cuestionarios = cnCuestionarios.genCuestionario(session.cbstorage.usuario.id, rc.id);
		event.setView("/cuestionarios/verCuestionario").noLayout();
		//writeDump(prc.cuestionarioas);
		//abort;

		//event.renderData(type="json", data=resultado);	
	}

	function eliminarOpcion(event, rc, prc){
		resultado = cnCuestionarios.eliminarOpcion(rc.opcion);
		event.renderData(type="json", data=resultado);
	}

	function responderCuestionario(event, rc, prc){
		prc.cuestionario = cnCuestionarios.consultarCuestionarioCaptura( rc.id);
		session.cbstorage.captcha = cnCuestionarios.generateString();
		event.setView("/captura/cuestionario").noLayout();
	}
	function captura(event, rc, prc){
		prc.cuestionario = cnCuestionarios.captura(rc.id, session.cbstorage.captcha, rc.captcha_to, rc.clave);
		if(prc.cuestionario.estado eq 2){
			getInstance( "MessageBox@cbmessagebox" ).setMessage("error","El captcha ingresado es incorrecto.");
			runEvent("cuestionarios.cuestionarios.responderCuestionario");
		}
		else if(prc.cuestionario.estado eq 3){
			getInstance( "MessageBox@cbmessagebox" ).setMessage("error","La clave de acceso de incorrecta.");
			runEvent("cuestionarios.cuestionarios.responderCuestionario");
		}else{
			event.setView(view='/captura/captura', layout='Captura');
		}
	}


}