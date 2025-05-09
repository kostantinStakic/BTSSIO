<?php
session_start();
include("fonction.php");

//on recupere l'id de la personne à partir de l'url
$idaut = $_GET['idaut'];

$resultat = selectWhereIdAut($connect,$idaut);

foreach ($resultat as $auteur) {
	$pseudo = $auteur['pseudo'];
	echo "<br>Bonjour " . $pseudo;
}

?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>BLOG</title>
</head>
<body>

</body>
</html>