<?php
session_start();
include("bdd.php");
//connexion à la bdd avec l'extension mysqli()
// la classe mysqli(hostname,user,password,dbname)
$bdd = new mysqli($hostname,$user,$password,$dbname);

if (isset($_GET['login'])) {
	$mail = $_GET['mail'];
	$mdp = $_GET['mdp'];

	$resultat = selectAuteurWhereMailMdp($bdd, $mail, $mdp);

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
		<?php
		$lesArticles = selectAllArticles($bdd);

	foreach ($lesArticles as $unArticle) {
		echo "	<tr>
					<td><img src='".$unArticle['url_image']."' width='400'></td>
					<td style='vertical-align: top;'>
						<span style='font-weight: 900;'>
						".$unArticle['titre']."
						</span>
						<p>".$unArticle['contenu']."</p>
						<p><i>".$unArticle['nom']." ".$unArticle['prenom']."</i></p>
					</td>
				</tr>";
			
			}


		?>

	</table>

</body>
</html>