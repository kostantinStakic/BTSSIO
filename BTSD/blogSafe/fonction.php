<?php
// variables d'environnement et les options PHP
$hostname = "localhost";
$user = "root";
$password = "";
$dbname = "blogD";

//connexion à la bdd
$connect = new mysqli($hostname,$user,$password,$dbname);

//Les requêtes SQL

function connexionUser($connect,$mail,$mdp)
{
	if ($connect == null) {
		return null;
	}

	//création de la requete
	$requete = "select * from auteur where mail=? and mdp=?";

	//preparation de la requete
	$stmt = $connect->prepare($requete);

	//assocation du type des variables
	$stmt->bind_param("ss",$mail,$mdp);

	//executer la requete
	$stmt->execute();

	//recuperer le ou les resultats
	$resultat = $stmt->get_result();

	return $resultat;

}

function selectWhereIdAut($connect,$idaut)
{
	if ($connect == null) {
	return null;
	}

	//création de la requete
	$requete = "select * from auteur where idaut=$idaut";

	//Execution de la requête avec query()
	//et récupération du résultat 
	//!!! méthode vulnérable !!!
	$resultat = $connect->query($requete);

	return $resultat;
}

?>