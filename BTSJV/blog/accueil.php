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

	<form method="get">
		<input type="text" name="mail" placeholder="mail">
		<input type="text" name="mdp" placeholder="mot de passe">
		<input type="submit" name="valider" value="Connexion">
	</form>

	<?php
		//on verfie que le bouton valider a été activé
	if (isset($_GET['valider'])) {
		//on récupère les éléments saisis par l'utilisateur depuis le formulaire avec la méthode GET
		$mail = $_GET['mail'];
		$mdp = $_GET['mdp'];

		//on va créer notre requête que nous allons stocker dans une variable
		$requete = "select * from auteur where mail='$mail' and mdp='$mdp'";
		//On accède à la méthode "vulnérable" Query() dans la classe mysqli() et on passe en paramètre la requête stockée et on récupère le résultat dans une variable
		$resultat = $mysqli->query($requete);

		//on va afficher le résultat
		foreach ($resultat as $auteur) {
			$id = $auteur["id_aut"];
			$_SESSION['utilisateur'] = $auteur;
			header("Location: connexion.php?id=".$id);
		}

	}

	?>

	<h1>Blog BTS, mais pas trop ...</h1>
	<table>
		<tr>
			<td rowspan="2"><img src="images/cover.jpg" width="420"></td>
			<td width='500' style="vertical-align: top;"><span style="font-weight: 900;">TITRE</span>
				<p>Une étrange relique vient d’atterrir sur mon bureau, au 65e étage de la tour d’archéologie. Un artefact envoyé de la planète Pleztéshone III, au centre de la galaxie Lécon-Sol. Il paraît qu’il y a des milliers d’années, en l’an 2013, les autochtones de Pleztéshone III considéraient ce fossile comme le summum du divertissement. Se pourrait-il qu’il contienne des plaisirs encore inconnus de nous, sur la planète Péssai ?</p>
			</td>
			<tr>
				<td style="text-align: right;">signature auteur</td>
			</tr>
		</tr>
	</table>
</body>
</html>