<?php
session_start();
include("fonction.php");
$connect = new mysqli($hostname,$user,$password,$dbname);

if (isset($_GET['valider'])) {
	//transformer les balises html en texte
	//pour éviter les injection type XSS
	//Cross-site Scripting
	//exemple: redirection vers site malveillant
	//via code JS grace à la balise <script>

	//trim pour rogner les espaces en debut 
	//et fin de saisie
	$mail = htmlspecialchars(trim($_GET['mail']));
	$mdp = htmlspecialchars(trim($_GET['mdp']));

	//appel de la fonction de verif à la connexion
	$resultat = connexionUser($connect,$mail,$mdp);
	//
	//on verifie qu'il y a un résultat

	//recuperation des resultats de la bdd
	foreach ($resultat as $auteur) {
		header("Location: accueil.php?idaut=".$auteur['idaut']);
		exit();
	}
	
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
	<!-- formulaire de connexion de l'auteur -->
	<form method="get">
		<input type="text" name="mail">
		<input type="text" name="mdp">
		<input type="submit" name="valider" value="login">
	</form><br>

	<!-- affichage des articles du blog -->
	<table border="1">
		<tr>
			<td>images</td>
			<td>
			<span>titre</span>
			<p>contenu</p>
			</td>
		</tr>
	</table>

</body>
</html>