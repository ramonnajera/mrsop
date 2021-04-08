<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- google-fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,400;0,500;0,700;1,400&display=swap" rel="stylesheet">
    <!-- fontawesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
    <!-- css-bootstrap-5.0.0 -->
    <link rel="stylesheet" href="<?=base_url?>/assets/lib/bootstrap-5.0.0/css/bootstrap.min.css">
    <!-- css-style -->
    <link rel="stylesheet" href="<?=base_url?>/assets/css/main.css">
    <title>MRSOP</title>
</head>
<body data-spy="scroll" data-target="#pnavbar" data-offset="50">
    <!-- preloader -->
    <!-- <div class="loader" id="loader">
        <div class="lds-ring"><div></div><div></div><div></div><div></div></div>
    </div> -->
    <!-- navbar -->
    <nav id="pnavbar" class="navbar navbar-expand-md navbar-light bg-light fixed-top">
        <div class="container-fluid d-flex flex-row">
            <a href="<?=base_url?>" class="navbar-brand">
                <img src="assets/img/logoh.svg" alt="" width="150">
            </a>

            <button class="navbar-toggler menu" id="btnmenu"
            onclick="this.classList.toggle('opened');
            this.setAttribute('aria-expanded', this.classList.contains('opened'))" 
            type="button" 
            data-toggle="collapse" 
            data-target="#navbarSupportedContent" 
            aria-controls="navbarSupportedContent" 
            aria-expanded="false" 
            aria-label="Toggle navigation">
                <svg width="38" height="38" viewBox="0 0 100 100">
                    <path class="line line1" d="M 20,29.000046 H 80.000231 C 80.000231,29.000046 94.498839,28.817352 94.532987,66.711331 94.543142,77.980673 90.966081,81.670246 85.259173,81.668997 79.552261,81.667751 75.000211,74.999942 75.000211,74.999942 L 25.000021,25.000058" />
                    <path class="line line2" d="M 20,50 H 80" />
                    <path class="line line3" d="M 20,70.999954 H 80.000231 C 80.000231,70.999954 94.498839,71.182648 94.532987,33.288669 94.543142,22.019327 90.966081,18.329754 85.259173,18.331003 79.552261,18.332249 75.000211,25.000058 75.000211,25.000058 L 25.000021,74.999942" />
                </svg>
            </button>

            <div class="collapse navbar-collapse text-center" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a class="nav-link" href="#home">Inicio</a></li>
                    <li class="nav-item"><a class="nav-link" href="#nosotros">Nosotros</a></li>
                    <li class="nav-item"><a class="nav-link" href="#servicios">Servicios</a></li>
                    <li class="nav-item"><a class="nav-link" href="#contacto">Contacto</a></li>
                </ul>
            </div>
        </div>
    </nav>