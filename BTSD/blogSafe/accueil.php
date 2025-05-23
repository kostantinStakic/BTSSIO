<?php
	session_start();
	include("fonction.php");

	//utiliser la fonction htmlspecialchars('variable')
	//pour sécuriser nos données contre les attaques
	//de type XSS (injection en JS via url)
	$id_aut = htmlspecialchars($_GET['id']);
	$resultat = selectWhereIdAut($connect, $id_aut);

	foreach ($resultat as $auteur) {
		$pseudo = $auteur['pseudo'];
		echo "Bienvenue " . $pseudo;
	}

	//validation du formulaire de publication d'article

	if (isset($_POST['valider'])) {
		$titre = $_POST['titre'];
		$contenu = $_POST['contenu'];
		$dossier = "images/";

		//verification de l'existence du dossier images
		if (!is_dir($dossier)) {
			mkdir($dossier);
		}
		//on recupere le nom et le chemin de l'image
		$image = $_FILES['image']['name'];
		$urlimage = $dossier.$image;

		//on déplace l'image qui est stocké côté serveur
		//vers le dossier spécifié 
		move_uploaded_file($_FILES['image']['tmp_name'], $urlimage);

		insertArticle($connect,$titre,$contenu,$urlimage,$id_aut);
		header("Location: accueil.php?id=".$id_aut);
		exit();
	}

	if (isset($_GET['action']) && $_GET['action'] == "supp") {
		$idart = $_GET['idart'];
		deleteArticle($connect,$idart);
		header("Location: accueil.php?id=".$id_aut);
		exit();		
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
<!--	
	<script type="text/javascript">
		alert("tu payes ou tu crèves");
	</script>
-->
<h3>Ajouter ou modifier les publications</h3>
<form method="post" enctype="multipart/form-data">
	<input type="text" name="titre" placeholder="titre"><br><br>
	<textarea name="contenu" cols="22" rows="5" placeholder="contenu"></textarea><br><br>
	<input type="file" name="image"><br><br>
	<input type="reset" name="annuler" value="annuler">
	<input type="submit" name="valider" value="publier">
</form>

<!-- tableau qui contient la liste des publications -->
<h3>Liste des publications</h3>
<table border="1">
	<tr>
		<td>TITRE</td>
		<td>CONTENU</td>
		<td>AUTEUR</td>
		
	</tr>

	<?php
	$resultat = selectAllArticles($connect);

	foreach ($resultat as $article) {
		$idart = $article["idart"];
		$titre = $article["titre"];
		$contenu = $article["contenu"];
		$pseudo = $article["pseudo"];

		echo "	<tr>
					<td>".$titre."</td>
					<td>".$contenu."</td>
					<td>".$pseudo."</td>
					<td><a href='accueil.php?'><img src='images/modifier.png' width='30'></a></td>
					<td><a href='accueil.php?id=".$id_aut."&action=supp&idart=".$idart."'><img src='images/supprimer.png' width='30'></a></td>
				</tr>";
	}
	?>

</table>

<br>
<a href="index.php">retour</a>
</body>
</html>
