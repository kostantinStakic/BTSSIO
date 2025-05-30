<?php
session_start();
include("fonctions.php");
if ($_SESSION['utilisateur'] != null) {

	if ($_GET['id'] != $_SESSION['utilisateur']['id_aut']) {
		die("Connexion refusée!");
	}

$id = $_GET['id'];

$resultat = selectWhereIdUser($mysqli,$id);

foreach ($resultat as $auteur) {
	echo "Connexion réussie pour : " . $auteur['nom'] . " " . $auteur['prenom'];
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

	<!--formulaire d'upload des articles avec image-->

	<form method="POST" enctype="multipart/form-data">
		<input type="text" name="titre" placeholder="TITRE" 
		value="<?php echo isset($_GET['titre']) ? $_GET['titre'] : '' ?>"><br><br>
		<textarea name="contenu" cols="50" rows="10"><?php echo isset($_GET['contenu']) ? $_GET['contenu'] : '' ?></textarea><br><br>
		<input type="file" name="image">
		<?php echo isset($_GET['action']) && $_GET['action'] == 'modif' ? "<input type='submit' name='modifier' value='modifier'>" : "<input type='submit' name='upload' value='valider'>" ?>
		
		
	</form>


<?php

if (isset($_POST['upload'])) {
	//chemin de destination des images chargées
	$dossier = "images/";
	$titre = htmlspecialchars(trim($_POST['titre']));
	$contenu = htmlspecialchars(trim($_POST['contenu']));

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

	//
	insertArticle($mysqli,$titre,$contenu,$destination,$id);

	header("Location: connexion.php?id=".$id);
	exit();

}

if (isset($_GET['action']) && $_GET['action'] == "supp") {
	$id_art = $_GET['id_art'];
	deleteArticle($mysqli, $id_art);
	header("Location: connexion.php?id=".$id);
	exit();
}

if (isset($_POST['modifier'])) {
	$id_art = htmlspecialchars(trim($_GET['id_art']));
	$titre = htmlspecialchars(trim($_POST['titre']));
	$contenu = htmlspecialchars(trim($_POST['contenu']));
	$id_aut = htmlspecialchars(trim($_GET['id_aut']));

	$dossier = "images/";

	if (!is_dir($dossier)) {
		mkdir($dossier);
	}

	$image = $_FILES['image']['name'];
	$destination = $dossier . $image;
	move_uploaded_file($_FILES['image']['tmp_name'], $destination);

	updateArticle($mysqli,$titre,$contenu,$urlimage,$id_aut,$id_art);
	header("Location: connexion.php?id=".$id);
	exit();
}

?>

<table border="1">
	<tr>
		<th>Titre</th>
		<th>Contenu</th>
		<th>Auteur</th>
	</tr>
	<?php
	$resultat = selectAllArticleFromConnexion($mysqli);

	foreach ($resultat as $article) {
		$id_art = $article['id_art'];
		$titre = $article['titre'];
		$contenu = $article['contenu'];
		$nom_aut = $article['nom'];
		$prenom_aut = $article['prenom'];
		echo "	<tr>
					<td>".$titre."</td>
					<td>".$contenu."</td>
					<td>".$nom_aut." ".$prenom_aut."</td>
					<td><a href='connexion.php?id=".$id."&action=modif&id_art=".$id_art."&titre=".$titre."&contenu=".$contenu."&id_aut=".$id."'><img src='images/modifier.png' width='20'></a></td>
					<td><a href='connexion.php?id=".$id."&action=supp&id_art=".$id_art."'><img src='images/supprimer.png' width='20'></a></td>
				</tr>";
	}

	if (isset($_GET['action']) && $_GET['action'] == "supp") {
		$id_art = $_GET['id_art'];
		deleteArticle($mysqli, $id_art);
		header("Location: connexion.php?id=".$id);
		exit();
	}
	?>
</table>
	
</body>
</html>