<?php
session_start();
include("bdd.php");
//connexion à la bdd avec l'extension mysqli()
// la classe mysqli(hostname,user,password,dbname)
$bdd = new mysqli($hostname,$user,$password,$dbname);

// on verifie qu'il y a bien un id dans l'url
if (isset($_GET['id']) && $_GET['id'] == $_SESSION['utilisateur']['id_aut']) {
// htmlspecialchars() : ignore le code html(balise = texte) empeche les attaques de types XSS (injection JS)
// trim() : on enleve les espaces en debut et fin de 
// données afin d'éviter de mauvaises interpretations
$id = htmlspecialchars(trim($_GET['id']));

//on recup les resultat 
$resultat = selectAuteurWhereId($bdd, $id);

//on affiche le resultat
foreach ($resultat as $auteur) {
	$nom = htmlspecialchars(trim($auteur["nom"]));
	$prenom = htmlspecialchars(trim($auteur["prenom"]));

	echo "Session de : " . $nom . " " . $prenom;

}
if (isset($_POST['deco'])) {
	$_SESSION = [];
	session_destroy();
	header("Location: accueil.php");
	exit();
}
}else
{
	echo "connexion refusée";
}

/*
$xss = "<script type='text/javascript'>
	alert('Tu vas te faire hacker, alors paye!');
</script>";
echo $xss;
*/

?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
</head>
<body>
	<form method="post">
		<input type="submit" name="deco" value="Se déconnecter">
	</form>

	<form method="post">
		<input type="text" name="titre" placeholder="TITRE"><br><br>
		<textarea name="contenu" placeholder="Article"></textarea><br><br>
		<input type="file" name="image"><br>
		<input type="submit" name="ajouter" value="AJOUTER">
	</form>

	<h3>Liste des articles</h3>

	<table border="1">
		<tr>
			<th>titre</th>
			<th>contenu</th>
			<th>auteur</th>
		</tr>
	<?php
	$lesArticles = selectAllArticle($bdd);
	foreach ($lesArticles as $unArticle) {
		echo "	<tr>
					<td>".$unArticle['titre']."</td>
					<td>".$unArticle['contenu']."</td>
					<td>".$unArticle['nom']." ".$unArticle['prenom']."</td>
				</tr>";
	}
	?>


	</table>

	<br>
	<a href="accueil.php">Accueil</a>
</body>
</html>


