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
	echo "Connexion réussie pour : " . $auteur["nom"] . " " . $auteur["prenom"];
}

if (($_SERVER['REQUEST_METHOD'] === "POST") && isset($_POST['deconnexion'])) {
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
		<button name="deconnexion">Déconnexion</button>
	</form>

	<!-- formulaire d'upload des articles avec image -->

	<form method="POST" enctype="multipart/form-data">
		<input type="text" name="titre" placeholder="TITRE"><br><br>
		<textarea name="contenu" cols="50" rows="10"></textarea><br><br>
		<input type="file" name="image">
		<input type="submit" name="upload" value="upload">
	</form>

<?php

if (isset($_POST['upload'])) {
	//chemin de destination des images chargées
	$dossier = "images/";

	/*
	on verifie que le dossier existe bien, 
	si ce n'est pas le cas on créé le dossier grace à la fonction mkdir()
	*/
	if (!is_dir($dossier)) {
		mkdir($dossier);
	}

	//on récupère grace à un tableau la clé(nom de l'attibut image dans le form) ainsi que son nom (name)

	$image = $_FILES['image']['name'];

	//on créé une variable qui contient le chemin de l'image 

	$destination = $dossier . $image;

	//on déplace l'image côté server vers la destination choisie

	move_uploaded_file($_FILES['image']['tmp_name'], $destination);

	?>

	<img src="<?php echo $destination; ?>">

	<?php
}

?>
	
</body>
</html>