<?php
include("variables.php");
//connexion à la bdd
//utilisation de l'extension mysqli()
//la classe mysqli contient les attributs suivants:
//mysqli(hostname,user,password,dbname)

//instanciation de la class mysqli()
//verification de la connexion avec TRY / CATCH
try{
	$mysqli = new mysqli($hostname,$user,$password,$dbname);
	$mysqli->set_charset("utf8");

}
catch(mysqli_sql_exception $e)
{
	echo "erreur de connexion SQL : " . $e->getMessage();
	$mysqli = null;
}


//fonctions de requêtes coming soon...
function verifConnexion($mysqli,$mail,$mdp)
{
	//on va créer notre requête que nous allons stocker dans une variable
	$requete = "select * from auteur where mail=?";

	//pour sécuriser nos requetes, on ne va pas utiliser query()
	//on va preparer la requete
	$stmt = $mysqli->prepare($requete);

	//on va associer les types aux variables
	$stmt->bind_param("s",$mail);

	//on va executer la requete
	$stmt->execute();

	//on va recuperer le ou les resultats
	$resultat = $stmt->get_result();

	//on recupere sous forme de tableau associatif le SEUL résultat
	$auteur = $resultat->fetch_assoc();

	//Verif le mot de passe saisi, on le compare au mot de passe
	//issu de la bdd. 
	if (password_verify($mdp, $auteur["mdp"])) {
		header("Location: connexion.php?id=".$auteur["id_aut"]);
		exit();
	}else
	{
		echo "MDP pas OK";
	}

}

function selectWhereIdUser($mysqli,$id)
{
	$requete = "select * from auteur where id_aut=?";
	$stmt = $mysqli->prepare($requete);
	$stmt->bind_param("i",$id);
	$stmt->execute();
	$resultat = $stmt->get_result();

	return $resultat;
}

function selectAllArticleFromConnexion($mysqli)
{
	$requete = "select * from article, auteur where article.id_aut = auteur.id_aut";
	$stmt = $mysqli->prepare($requete);
	$stmt->execute();
	$resultat = $stmt->get_result();

	return $resultat;
}

function insertArticle($mysqli,$titre,$contenu,$urlimage,$id_aut)
{
	$requete = "insert into article values(null,?,?,?,?)";
	$stmt = $mysqli->prepare($requete);
	$stmt->bind_param("sssi",$titre,$contenu,$urlimage,$id_aut);
	$stmt->execute();	
}

function insertAuteur($mysqli,$nom,$prenom,$mail,$mdp)
{
	$requete = "insert into auteur values(null,?,?,?,?)";
	$stmt = $mysqli->prepare($requete);
	$stmt->bind_param("ssss",$nom,$prenom,$mail,$mdp);
	$stmt->execute();	
}

function deleteArticle($mysqli, $id_art)
{
	$requete = "delete from article where id_art=?";
	$stmt = $mysqli->prepare($requete);
	$stmt->bind_param("i",$id_art);
	$stmt->execute();	
}

function updateArticle($mysqli,$titre,$contenu,$urlimage,$id_aut,$id_art)
{
	$requete = "update article set titre=?, contenu=?, url_image=?, id_aut=? where id_art=?";
	$stmt = $mysqli->prepare($requete);
	$stmt->bind_param("sssii",$titre,$contenu,$urlimage,$id_aut,$id_art);
	$stmt->execute();	
}

?>