<?php
// variables qui vont contenir les 
// données pour faciliter l'accès à la connexion bdd
$hostname = "localhost";
$user = "root";
$password = "";
$dbname = "blogLM";


// les fonctions : 

function selectAuteurWhereMailMdp($bdd, $mail, $mdp)
{
	//requete sql qui va recup mail et mdp
	//et on va afficher l'utilisateur associé
	$requete = "select * from auteur where mail=? and mdp=?";

	//preparer la requete prepare()
	$stmt = $bdd->prepare($requete);
	$stmt->bind_param("ss", $mail, $mdp);

	//executer le requete execute()
	$stmt->execute();

	$resultat = $stmt->get_result();

	/*
	on va executer la requete méthode vulnérable (avec query) et on recuperer le resultat : 

	$resultat = $bdd->query($requete);
	*/

	//une fonction retourne toujours un résultat
	return $resultat;
}

function selectAuteurWhereId($bdd, $id)
{

	$requete = "select * from auteur where id_aut=?";

	$stmt = $bdd->prepare($requete);
	$stmt->bind_param("i", $id);
	$stmt->execute();

	$resultat = $stmt->get_result();
	return $resultat;
}

function selectAllArticle($bdd)
{

	$requete = "select * from article, auteur where article.id_aut = auteur.id_aut";

	$stmt = $bdd->prepare($requete);
	$stmt->execute();

	$resultat = $stmt->get_result();
	return $resultat;
}

function insertArticle($bdd,$titre,$contenu,$url_image,$id_aut)
{
	if ($bdd == null) {
		return null;
	}
	$requete = "insert into article values(null,?,?,?,?)";

	$stmt = $bdd->prepare($requete);
	$stmt->bind_param("sssi",$titre,$contenu,$url_image,$id_aut);
	$stmt->execute();
}

function selectAllArticles($mysqli)
{
	$requete = " select * from auteur aut join article art on aut.id_aut = art.id_aut;
";
	$stmt = $mysqli->prepare($requete);
	$stmt->execute();
	$resultat = $stmt->get_result();

	return $resultat;
}	

function deleteArticleWhereId($mysqli, $id_art)
{
	$requete = "delete from article where id_art=?";
	$stmt = $mysqli->prepare($requete);
	$stmt->bind_param("i",$id_art);
	$stmt->execute();

}


?>