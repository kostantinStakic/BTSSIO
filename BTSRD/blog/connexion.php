<?php
//on recupere la variable de l'id
//empeche les attaques de type XSS
//et interprete les balises html en texte
$id = htmlspecialchars(trim($_GET['id'])) ;
//on l'affiche
echo "<h2>Identifiant de connexion : " . $id . "</h2>";

?>

