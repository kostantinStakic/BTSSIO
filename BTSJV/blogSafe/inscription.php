<?php
session_start();
$_SESSION['utilisateur'] = null;
include("fonctions.php");
?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="styles.css">
	<title>BLOG</title>
</head>
<body>
	<h3>Inscription</h3>
	<form method="post">
		<input type="text" name="nom" placeholder="Nom">
		<input type="text" name="prenom" placeholder="Prénom">
		<input type="text" name="mail" placeholder="mail">
		<input type="text" name="mdp" placeholder="mot de passe">
		<input type="submit" name="valider" value="Inscription">
	</form>

	<?php

	if(isset($_POST['valider']))
	{
		$nom = htmlspecialchars(trim($_POST['nom']));
		$prenom = htmlspecialchars(trim($_POST['prenom']));
		$mail = htmlspecialchars(trim($_POST['mail']));
		$mdp = htmlspecialchars(trim($_POST['mdp']));

		$mdpHash = password_hash($mdp, PASSWORD_DEFAULT);

		insertAuteur($mysqli,$nom,$prenom,$mail,$mdpHash);

		header("Location: accueil.php");

		exit();
	}

	?>

</body>
</html>