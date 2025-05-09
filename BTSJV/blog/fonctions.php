<?php
//connexion à la bdd
//utilisation de l'extension mysqli()
//la classe mysqli contient les attributs suivants:
//mysqli(hostname,user,password,dbname)

//instanciation de la class mysqli()
$mysqli = new mysqli('localhost','root','','blog');
$mysqli->set_charset("utf8");

//fonctions de requêtes coming soon...
function verifConnexion($mysqli,$mail,$mdp)
{
		//on va créer notre requête que nous allons stocker dans une variable
		$requete = "select * from auteur where mail_aut='$mail' and mdp_aut='$mdp'";
		//On accède à la méthode "vulnérable" Query() dans la classe mysqli() et on passe en paramètre la requête stockée et on récupère le résultat dans une variable
		$resultat = $mysqli->query($requete);
		return $resultat;
}


function selectWhereIdUser($mysqli,$id)
{
	$requete = "select * from auteur where id_aut=$id";

	$resultat = $mysqli->query($requete);

	return $resultat;
}
?>