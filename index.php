<?php
ob_start();
session_start();
require_once 'autoload.php';
require_once 'config/db.php';
require_once 'config/parameters.php';
require_once 'helpers/utils.php';
require_once 'views/layout/header_v.php';
// require_once 'controllers/OopsController.php';

date_default_timezone_set("America/Chihuahua");

function show_error(){
    $error = new OopsController();
    $error->perdon();
}

if (isset($_GET['controller'])) {
    $nombre_controlador = $_GET['controller'] . 'Controller';
}elseif(!isset($_GET['controller']) && !isset($_GET['action'])){
    $nombre_controlador = controller_default;
}else{
    show_error();
    echo "aqui 1";
    exit();
}

if (class_exists($nombre_controlador)) {
    $controlador = new $nombre_controlador();
    
    if (isset($_GET['action']) && method_exists($controlador, $_GET['action'])) {
        $action = $_GET['action'];
        $controlador->$action();
    }elseif(!isset($_GET['controller']) && !isset($_GET['action'])){
        $action_default = action_default;
        $controlador->$action_default();
    }else{
        show_error();
        echo "aqui 2";
    }
}else{
    show_error();
    echo "aqui 3";
}

require_once 'views/layout/footer_v.php';