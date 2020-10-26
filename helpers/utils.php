<?php

class Utils{

    public static function deleteSession($name){
        if (isset($_SESSION[$name])) {
            $_SESSION[$name] = null;
            unset($_SESSION[$name]);
        }
        return $name;
    }

    public static function isAdministrador(){
        if (isset($_SESSION['administrador'])) {
            return true;
        }else{
            header("Location:".base_url);
        }
    }

}
