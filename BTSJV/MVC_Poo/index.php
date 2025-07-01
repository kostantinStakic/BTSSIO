<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Gestion Alternance</title>
</head>
<body>

	<?php
	include("controleurs/controleur.php");
	$unControleur = new Controleur();
	?>

	<h1>Gestion des alternances</h1>

	<h2>Inscription d'un étudiant</h2>

	<h2>Liste des étudiants</h2>
	<?php
	$lesEtudiants = $unControleur->selectAllEtudiants();
	include("vues/vue_liste_des_etudiants.php");

	?>
	<h2>Liste des entreprises</h2>

</body>
</html>