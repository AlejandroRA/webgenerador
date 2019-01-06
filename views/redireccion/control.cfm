<script src="/includes/js/jquery-3.1.1.min.js"></script>
<!-- Mainly scripts -->
<script src="/includes/js/popper.min.js"></script>
<script src="/includes/js/bootstrap.js"></script>
<script src="https://smtpjs.com/v2/smtp.js"></script>
<!-- iCheck -->
<script src="/includes/js/plugins/iCheck/icheck.min.js"></script>
<script src="/includes/js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">
  	$(document).ready(function() {
  		<cfif prc.resultado eq 1>
  			emailSend('<cfoutput>#prc.email#</cfoutput>', '<cfoutput>#prc.email#</cfoutput>','<cfoutput>#prc.password#</cfoutput>');
  		</cfif>
  		setTimeout(function(){
  			location.href='<cfoutput>#prc.direccion#</cfoutput>?res=<cfoutput>#prc.resultado#</cfoutput>';
  		}, 1000);
    //	location.href='<cfoutput>#prc.direccion#</cfoutput>?res=<cfoutput>#prc.resultado#</cfoutput>';

	}) ;

	 /*Funcion encargada de mandar el correo electronico*/
    function emailSend(email, user,pass){
        Email.send("GEAE.ESCOM@gmail.com",
            email,
            "Bievenid@",
            '<center><h1>BIENVENID@</h1></center><h2>Se ha registrado en el sistema con el usuario: '+user+' y contraseña: '+pass+'</h2>',
            "smtp.gmail.com",
            "GEAE.ESCOM@gmail.com",
            "GEAE_2018");
    }
</script>
<html>
</html>