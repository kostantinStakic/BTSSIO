<?php
//On active les options de gestion des erreurs et levée d'exception
//On supprime le fatal error
//On va pouvoir utiliser try/catch

mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
$hostname = "localhost";
$user = "root";
$password = "";
$dbname = "blog";
?>