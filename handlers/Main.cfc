component extends="coldbox.system.EventHandler"{

	// Default Action
	function index(event,rc,prc){

		if(structKeyExists(rc, "res")){
			prc.resultado = rc.res;
		}
		if(structKeyExists(session, "cbstorage") and structKeyExists(session.cbstorage, "usuario")){
			runEvent("Main.inicio");
		}
		else{
			event.setView(view="/login/login_2").noLayout();  
		}	
	}

	function inicio(event,rc,prc){
		event.setView(view="/geae/inicio", layout="Main");
	}
	

	function cerrarSesion(event, rc, prc){
		StructDelete(session, "cbstorage",true);
		runEvent("Main.index");
	}

	// Do something
	function doSomething(event,rc,prc){
		relocate( "main.index" ).noLayout();
	}

	/************************************** IMPLICIT ACTIONS *********************************************/

	function onAppInit(event,rc,prc){

	}

	function onRequestStart(event,rc,prc){

		 baseUrl='http#iif(CGI.SERVER_PORT_SECURE,"s","")#://#CGI.SERVER_NAME#:#cgi.SERVER_PORT#/index.cfm/main';
		// baseUrl='http#iif(CGI.SERVER_PORT_SECURE,"s","")#://#CGI.SERVER_NAME#:#cgi.SERVER_PORT#/index.cfm/main';
		baseCuestionario='http#iif(CGI.SERVER_PORT_SECURE,"s","")#://#CGI.SERVER_NAME#:#cgi.SERVER_PORT#/index.cfm/cuestionarios/cuestionarios/captura';
		
 
		
		 
		 /*Este codigo se encarga de validar que peticiones puede consultar el usuario que se encuentre loggeado y cuales no*/
		 if((NOT structKeyExists(session, "cbstorage") OR structKeyExists(session.cbstorage, "usuario") 
					AND StructIsEmpty(Session.cbstorage))
				AND (NOT ArrayContains(application.urlAllowed,rc.event))) {
		 	//writeDump(baseUrl);
					location(url=baseUrl);
								
			}
	}

	function onRequestEnd(event,rc,prc){

	}

	function onSessionStart(event,rc,prc){

	}

	function onSessionEnd(event,rc,prc){
		var sessionScope = event.getValue("sessionReference");
		var applicationScope = event.getValue("applicationReference");
	}

	function onException(event,rc,prc){
		event.setHTTPHeader( statusCode = 500 );
		//Grab Exception From private request collection, placed by ColdBox Exception Handling
		var exception = prc.exception;
		//Place exception handler below:
	}

	function onMissingTemplate(event,rc,prc){
		//Grab missingTemplate From request collection, placed by ColdBox
		var missingTemplate = event.getValue("missingTemplate");
		event.setView("/login/login_2");
	}

}