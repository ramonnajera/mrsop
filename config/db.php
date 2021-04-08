<?php

class Database{
    public static function connect(){
        $db = new mysqli('localhost', '
        mrsopcom_root', 'Joaquinsabina210191','mrsopcom_dbmrsop');
        $db->query("SET NAMES'utf8'");
        return $db;
    }
}