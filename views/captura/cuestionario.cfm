<!-- <cfdump var="#prc#"> -->
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>SGEA</title>

    <link href="/includes/css/bootstrap.min.css" rel="stylesheet">
    <link href="/includes/font-awesome/css/font-awesome.css" rel="stylesheet">

    <link href="/includes/css/animate.css" rel="stylesheet">
    <link href="/includes/css/style.css" rel="stylesheet">

</head>
<cfset funcimg3 = ImageCreateCaptcha(35,250,"#session.cbstorage.captcha#","low","serif,sansserif", "24")>
<body class="gray-bg">

    <div class="middle-box text-center loginscreen animated fadeInDown">
        <div>
            <div>

                <h1 class="logo-name">SGCA</h1>

            </div>
            <h2>Bienvenido</h2>
            <p><!-- Perfectly designed and precisely prepared admin theme with over 50 pages with extra new web app views. -->
                <!--Continually expanded and constantly improved Inspinia Admin Them (IN+)-->
                <h3><cfoutput>#prc.cuestionario.nombre#</cfoutput></h3>
            </p>
            <p><h4><cfoutput>#prc.cuestionario.descripcion#</cfoutput></h4></p>
            <p>Complete el formulario para comenzar el cuestionario.</p>
            <cfoutput>#getInstance( "MessageBox@cbmessagebox" ).renderIt()#</cfoutput>
            <form class="m-t" role="form" action="/index.cfm/cuestionarios/cuestionarios/captura" method="post">
                <div class="form-group">
                    <input type="hidden" class="form-control" name="id" value="<cfoutput>#prc.cuestionario.id#</cfoutput>">
                </div>
                <div class="form-group">
                    <cfimage action="writetoBrowser" source="#funcimg3#">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="captcha_to" placeholder="Captcha" required="">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" name="clave" placeholder="Clave de acceso" required="">
                </div>
                <button type="submit" class="btn btn-primary block full-width m-b">Comenzar</button>
            </form>
        </div>
    </div>


    
    <!-- Mainly scripts -->
    <script src="/includes/js/jquery-3.1.1.min.js"></script>
    <script src="/includes/js/popper.min.js"></script>
    <script src="/includes/js/bootstrap.js"></script>

</body>

