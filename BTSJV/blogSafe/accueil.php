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

		$resultat = verifConnexion($mysqli,$mail,$mdp);

		//on va afficher le résultat
		foreach ($resultat as $auteur) {
			$id = $auteur["id_aut"];
			$_SESSION['utilisateur'] = $auteur;
			header("Location: connexion.php?id=".$id);
		}

	}

	?>

	<h1>Nanar Land, le pays du bon goût retrouvé</h1>

	<?php
	$resultat = selectAllArticleFromConnexion($mysqli);

	foreach ($resultat as $article) {
		$nom = $article['nom'];
		$prenom = $article['prenom'];
		$titre = $article['titre'];
		$contenu = $article['contenu'];
		$url_image = $article['url_image'];

		echo '<table width=75%>
					<tr>
						<td rowspan="2"><img src="'.$url_image.'" width="250"></td>
						<td style="vertical-align: top;"><span style="font-weight: 900;vertical-align: top;">'.$titre.'</span>
							<p>'.$contenu.'</p>
						</td>
						<tr>
							<td style="text-align: right;">
							<i>'.$nom .' '.$prenom.'</i>
							</td>
						</tr>
					</tr>
				</table>';
	}
	?>
	
</body>
</html>