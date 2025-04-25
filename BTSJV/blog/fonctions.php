<?php
//connexion à la bdd
//utilisation de l'extension mysqli()
//la classe mysqli contient les attributs suivants:
//mysqli(hostname,user,password,dbname)

//instanciation de la class mysqli()
$mysqli = new mysqli('localhost','root','','blog');
$mysqli->set_charset("utf8");

//fonctions de requêtes coming soon...
?>