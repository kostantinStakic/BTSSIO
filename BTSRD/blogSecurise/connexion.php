<?php
//inclure la page bdd.php
include("bdd.php");
$conn = new mysqli($hostname, $username, $password, $dbname);
// Vérification de la connexion
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if (isset($_GET['id'])) {
	//empeche les attaques de type XSS
	//et interprete les balises html en texte
	$id = htmlspecialchars($_GET['id']) ;

	//requete de recuperation des infos de l'utilisateur

	$requete = "select * from auteur where id_aut='$id'";

	//on execute la requete (méthode vulnérable)
	//et on recupere son resultat dans une variable
	$resultat = $conn->query($requete);

	//on va afficher le resultat
	foreach ($resultat as $auteur) {
		$nom = $auteur['nom'];
		$prenom = $auteur['prenom'];
		echo "Session de : " . $nom . " " .$prenom;
	}

}

?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
</head>
<body>

</body>
</html>

