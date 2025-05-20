<?php
session_start();
include("bdd.php");
//connexion à la bdd avec l'extension mysqli()
// la classe mysqli(hostname,user,password,dbname)
$bdd = new mysqli($hostname,$user,$password,$dbname);

if (isset($_GET['login'])) {
	$mail = $_GET['mail'];
	$mdp = $_GET['mdp'];

	//requete sql qui va recup mail et mdp
	//et on va afficher l'utilisateur associé
	$requete = "select * from auteur where mail='$mail' and mdp='$mdp'";

	//on va executer la requete méthode vulnérable (avec query) et on recuperer le resultat
	$resultat = $bdd->query($requete);

	//on récupère les attributs retournés par la requete
	foreach ($resultat as $auteur) {
		$_SESSION['utilisateur'] = $auteur;
		$id = $auteur['id_aut'];
		header("Location: connexion.php?id=" . $id);
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
	<form method="get">
		<input type="text" name="mail">
		<input type="text" name="mdp">
		<input type="reset" value="ANNULER">
		<input type="submit" name="login" value="LOGIN">
	</form>

	<h2>Les rappeurs bling bling, mais pas trop ...	</h2>

	<table>
		<tr>
			<td><img src="images/riff.jpeg" width="400"></td>
			<td style="vertical-align: top;">
				<span style="font-weight: 900;">
				Titre
				</span>
				<p>Publication, bla bla bla ....
				</p>
			</td>
		</tr>
	</table>

</body>
</html>