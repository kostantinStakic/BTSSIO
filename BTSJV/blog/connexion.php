<?php
session_start();
include("fonctions.php");
if ($_SESSION['utilisateur'] != null) {
	if ($_GET['id'] != $_SESSION['utilisateur']['id_aut']) {
		die("Connexion refusée!");
	}

$id = $_GET['id'];

$requete = "select * from auteur where id_aut=$id";

$resultat = $mysqli->query($requete);

foreach ($resultat as $auteur) {
	echo "Connexion réussie pour : " . $auteur["nom_aut"] . " " . $auteur["prenom_aut"];
}
if ($_SERVER['REQUEST_METHOD'] === "POST") {
	$_SESSION = [];
	session_destroy();
	header("Location: accueil.php");
	exit();
}
}else
{
	echo "Veuillez vous connecter";
}
?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="styles.css">
	<title></title>
</head>
<body>
	<form method="POST">
		<button>Déconnexion</button>
	</form>
	
</body>
</html>